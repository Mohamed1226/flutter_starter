import 'package:ready_structure/core/networking/models/bases/base_model.dart';

abstract class CacheProvider {
  Future<void> cacheSingleObject<T extends BaseModel>(T ob);

  Future<T?> getSingleCachedObject<T extends BaseModel>(
      T Function(Map<String, dynamic> json) converter);

  Future<void> clearSingleCachedObject<T extends BaseModel>();
}
