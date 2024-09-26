import 'package:hive_flutter/hive_flutter.dart';

import 'package:ecommerce_shopping_project/services/abstract_classes/i_local_db_service.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HiveLocalDBService extends ILocalDBService {
  final Box box = Hive.box(LocalDB.name);

  @override
  Map<dynamic, dynamic> getAllData() => box.toMap();

  @override
  getData({required String key}) => box.get(key);

  @override
  createData({required String key, required String value}) =>
      box.put(key, value);

  @override
  deleteData({required String key}) => box.delete(key);

  @override
  updateData({required String key, required String value}) =>
      box.put(key, value);
}
