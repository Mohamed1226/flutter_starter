import 'dart:developer';

import 'package:cache_manager/core/delete_cache_service.dart';
import 'package:cache_manager/core/read_cache_service.dart';
import 'package:cache_manager/core/write_cache_service.dart';
import 'package:ready_structure/core/cache/cache_provider.dart';
import 'package:ready_structure/core/networking/models/bases/base_model.dart';

class CacheManagerProvider implements CacheProvider {
  @override
  Future<void> cacheSingleObject<T extends BaseModel>(T ob) async {
    try {
      await WriteCache.setJson(key: T.toString(), value: ob.toJson());
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  @override
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

  @override
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
