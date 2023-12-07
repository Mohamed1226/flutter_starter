// import 'package:flutter/foundation.dart';
//
// import '../../../models/bases/base_model.dart';
// import '../../bases/cache_strategy_i.dart';
// import 'ob_hash_key.dart';
// import 'package:objectbox/objectbox.dart';
// class ObjectBoxCacheStrategy implements ICacheStrategy<OBHashKey> {
//   late Store store;
//
//   ObjectBoxCacheStrategy() {
//     init();
//   }
//
//   @override
//   @protected
//   Future<void> init() async {
//     // store = await openStore();
//   }
//
//   @override
//   @protected
//   Future<T?> getCachedObject<T extends BaseModel>(String? id) async {
//     final box = store.box<T>();
//     return box.get(AppConsts.OB_SINGLE_ID);
//   }
//
//   @override
//   @protected
//   Future<void> cacheObject<T extends BaseModel>(T model) async {
//     final box = store.box<T>();
//     box.put(model);
//   }
//
//   @override
//   @protected
//   Future<void> cacheList<T extends BaseModel>(List<T> list, OBHashKey hashKey) {
//     throw UnimplementedError();
//   }
//
//   @override
//   @protected
//   Future<List<T>> getCachedList<T extends BaseModel>(OBHashKey hashKey) {
//     throw UnimplementedError();
//   }
//
//   @override
//   @protected
//   Future<void> clear() {
//     throw UnimplementedError();
//   }
// }
