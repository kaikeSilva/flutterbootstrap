import 'dart:io';

import 'package:isar/isar.dart';
import 'package:observable_flutter/models/date.dart';
import 'package:path_provider/path_provider.dart';

class LocalDatabaseService<T> {
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

  // Future<ApiResponse<List<T>>> getAll(List<T> Function(List<dynamic>) fromIsar) async {
  //   try {
  //     final result = await isar.collection<T>(collectionName).where().findAll();
  //     final data = fromIsar(result);
  //     return ApiResponse<List<T>>(data: data, statusCode: 200, errorMessage: null);
  //   } catch (e) {
  //     return ApiResponse<List<T>>(data: [], statusCode: 500, errorMessage: e.toString());
  //   }
  // }

  // Future<ApiResponse<T?>> insert(String collectionName, dynamic item,
  //     T Function(Map<String, dynamic>) fromIsar) async {
  //   await isar.writeTxn(() async {
  //     await isar.collection<T>().put(item);
  //   });
  //   return ApiResponse<T?>(data: item, statusCode: 200, errorMessage: null);
  // }

  // Future<ApiResponse<T?>> update(dynamic item, T Function(Map<String, dynamic>) fromIsar) async {
  //   try {
  //     await isar.writeTxn(() async {
  //       await isar.collection<T>(collectionName).put(item);
  //     });
  //     return ApiResponse<T?>(data: item, statusCode: 200, errorMessage: null);
  //   } catch (e) {
  //     return ApiResponse<T?>(data: null, statusCode: 500, errorMessage: e.toString());
  //   }
  // }

  // Future<ApiResponse<void>> delete(int id) async {
  //   try {
  //     await isar.writeTxn(() async {
  //       await isar.collection<T>(collectionName).delete(id);
  //     });
  //     return ApiResponse<void>(statusCode: 200, errorMessage: null);
  //   } catch (e) {
  //     return ApiResponse<void>(statusCode: 500, errorMessage: e.toString());
  //   }
  // }
}
