import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageClass {
  final String? tokenKey='token';
  final String? userTypeKey='userType';
  final String? userIdKey='userIdKey';
  final localStorage = const FlutterSecureStorage();
  void setData(String? key, String? value) async {
    await localStorage.write(key: key!, value: value);
  }

  Future<String?> getData(String? key) async {
    var result = await localStorage.read(key: key!);
    return result;
  }

  void removeData(String? key) async {
    await localStorage.delete(key: key!);
  }
}
