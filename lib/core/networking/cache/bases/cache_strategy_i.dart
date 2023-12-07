import '../../models/bases/base_model.dart';
import 'base_hash_key.dart';

abstract class ICacheStrategy<H extends BaseHashKey> {
  Future<void> init();

  Future<void> clear();

  Future<void> cacheObject<T extends BaseModel>(T model);

  Future<void> cacheList<T extends BaseModel>(List<T> list, H hashKey);

  Future<T?> getCachedObject<T extends BaseModel>(String? id);

  Future<List<T>> getCachedList<T extends BaseModel>(H hashKey);
}
