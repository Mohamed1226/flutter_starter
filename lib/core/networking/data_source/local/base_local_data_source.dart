import 'dart:developer';
import 'package:cache_manager/cache_manager.dart';
import '../../cache/bases/cache_strategy_i.dart';
import '../../cache/strategies/object_box/ob_hash_key.dart';
import '../../models/bases/base_model.dart';

abstract class LocalDataSource {
  final ICacheStrategy _objectCacheStrategy;

  const LocalDataSource({required ICacheStrategy objectCacheStrategy})
      : _objectCacheStrategy = objectCacheStrategy;

  Future<void> saveObjectItem<T extends BaseModel>(T model) =>
      _objectCacheStrategy.cacheObject<T>(model);

  Future<void> saveObjectList<T extends BaseModel>(
          List<T> list, OBHashKey hashKey) =>
      _objectCacheStrategy.cacheList(list, hashKey);

  Future<T?> getCachedObjectItem<T extends BaseModel>([String? id]) =>
      _objectCacheStrategy.getCachedObject<T>(id);

  Future<List<T>> getCachedObjectList<T extends BaseModel>(OBHashKey hashKey) =>
      _objectCacheStrategy.getCachedList(hashKey);

  /// This method is built to cache simple json where the key of the object
  /// is the type of it (object will not be saved in real DB like in ObjectBox)
  Future<void> cacheSingleObject<T extends BaseModel>(T ob) async {
    try {
      await WriteCache.setJson(key: T.toString(), value: ob.toJson());
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  /// This method is built to get cached object by its type
  /// where the object was saved with its simple json
  Future<T?> getSingleCachedObject<T extends BaseModel>(
      T Function(Map<String, dynamic> json) converter) async {
    try {
      final jsonData = await ReadCache.getJson(key: T.toString());
      log('jsonData $jsonData');
      if (jsonData != null) return converter(jsonData as Map<String, dynamic>);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  /// This method will delete the json saved with key that match its type [T]
  ///
  /// example:
  ///
  ///  clearSingleCachedObject<UserModel>()
  ///
  /// will delete the json exist with
  ///
  /// key = UserModel.type.toString()
  ///
  Future<void> clearSingleCachedObject<T extends BaseModel>() async {
    assert(T.toString() != 'BaseModel<BaseEntity>',
        'Type must be specified clearSingleCachedObject<T>() method');
    try {
      await DeleteCache.deleteKey(T.toString());
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }
}
