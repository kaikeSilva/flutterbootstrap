import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  static const storage = FlutterSecureStorage();

  // read from storage
  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  // write to storage
  Future<void> write({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  // delete from storage
  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  // delete all from storage
  Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  // read all keys from storage
  Future<Map<String, String>> readAll() async {
    return await storage.readAll();
  }
}
