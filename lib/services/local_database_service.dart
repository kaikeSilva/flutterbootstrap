import 'dart:io';

import 'package:isar/isar.dart';
import 'package:observable_flutter/models/data_response.dart';
import 'package:observable_flutter/models/date.dart';
import 'package:observable_flutter/services/data_access_interface.dart';
import 'package:path_provider/path_provider.dart';

class LocalDatabaseService<T> implements DataAccessInterface<T> {
  late final Isar isar;
  late final Directory dir;

  LocalDatabaseService() {
    _init();
  }

  Future<void> _init() async {
    dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [DateSchema],
      directory: dir.path,
    );
  }

  @override
  Future<DataResponse<T?>> delete(String route, String id) async {
    final collection = isar.collection<T>();
    final intId = int.parse(id);
    return await collection.delete(intId).then((value) {
      return const DataResponse(data: null, statusCode: 200, message: null);
    });
  }

  @override
  Future<DataResponse<T?>> insert(String url, T body,
      {T? Function(Map<String, dynamic> p1)? fromJsonT,
      Map<String, dynamic>? Function(T p1)? toJson}) async {
    final collection = isar.collection<T>();
    return await collection.put(body).then((value) async {
      final createdObject = await collection.get(value);
      return DataResponse(data: createdObject, statusCode: 200, message: null);
    });
  }

  @override
  Future<DataResponse<List<T>>> list(
      String url, List<T> Function(dynamic p1) fromJsonT) {
    final collection = isar.collection<T>();
    return collection.where().findAll().then((value) {
      return DataResponse(data: value, statusCode: 200, message: null);
    });
  }

  @override
  Future<DataResponse<T>> show(
      String url, String id, T Function(Map<String, dynamic> p1) fromJsonT) {
    final collection = isar.collection<T>();
    final intId = int.parse(id);
    return collection.get(intId).then((value) {
      return DataResponse(data: value, statusCode: 200, message: null);
    });
  }

  @override
  Future<DataResponse<T>> update(String url, String id, T body,
      {T? Function(Map<String, dynamic> p1)? fromJsonT,
      Map<String, dynamic>? Function(T p1)? toJson}) {
    final collection = isar.collection<T>();
    final intId = int.parse(id);
    return collection.put(body).then((value) async {
      final updatedObject = await collection.get(intId);
      return DataResponse(data: updatedObject, statusCode: 200, message: null);
    });
  }
}
