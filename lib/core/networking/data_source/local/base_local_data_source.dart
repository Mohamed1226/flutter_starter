import 'package:ready_structure/core/cache/cache_provider.dart';
import '../../models/bases/base_model.dart';

abstract class LocalDataSource {
  final CacheProvider cacheProvider;

  LocalDataSource(this.cacheProvider);

  Future<void> cacheSingleObject<T extends BaseModel>(T ob) async {
    cacheProvider.cacheSingleObject<T>(ob);
  }

  Future<T?> getSingleCachedObject<T extends BaseModel>(
      T Function(Map<String, dynamic> json) converter) async {
    return cacheProvider.getSingleCachedObject<T>(converter);
  }

  Future<void> clearSingleCachedObject<T extends BaseModel>() async {
    cacheProvider.clearSingleCachedObject<T>();
  }
}
