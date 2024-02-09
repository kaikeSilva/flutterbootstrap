import 'package:observable_flutter/models/data_response.dart';

abstract class DataAccessInterface<T> {
  Future<DataResponse<T?>> insert(String url, T body,
      {T? Function(Map<String, dynamic>)? fromJsonT,
      Map<String, dynamic>? Function(T)? toJson});

  Future<DataResponse<List<T>>> list(
      String url, List<T> Function(dynamic) fromJsonT);

  Future<DataResponse<T>> update(String url, String id, T body,
      {T? Function(Map<String, dynamic>)? fromJsonT,
      Map<String, dynamic>? Function(T)? toJson});

  Future<DataResponse<T?>> delete(String url, String id);

  Future<DataResponse<T>> show(
      String url, String id, T Function(Map<String, dynamic>) fromJsonT);
}
