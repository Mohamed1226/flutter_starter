import 'dart:developer';
import 'package:cache_manager/cache_manager.dart';
import '../../models/bases/base_model.dart';

abstract class LocalDataSource {
  Future<void> cacheSingleObject<T extends BaseModel>(T ob) async {
    try {
      await WriteCache.setJson(key: T.toString(), value: ob.toJson());
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

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
