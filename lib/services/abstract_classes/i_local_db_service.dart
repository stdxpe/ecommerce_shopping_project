abstract class ILocalDBService {
  Map<dynamic, dynamic> getAllData();
  String? getData({required String key});
  createData({required String key, required String value});
  updateData({required String key, required String value});
  deleteData({required String key});
}
