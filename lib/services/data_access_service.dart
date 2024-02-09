import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/models/data_response.dart';
import 'package:observable_flutter/services/api_service.dart';
import 'package:observable_flutter/services/connection_service.dart';
import 'package:observable_flutter/services/data_access_interface.dart';
import 'package:observable_flutter/services/local_database_service.dart';

class DataAccessService<T> implements DataAccessInterface<T> {
  final ApiService<T> _apiService = locator<ApiService<T>>();
  final LocalDatabaseService<T> _localDatabaseService =
      locator<LocalDatabaseService<T>>();
  final ConnectionService _connectionService = locator<ConnectionService>();

  @override
  Future<DataResponse<T?>> delete(String url, String id) async {
    if (await _connectionService.hasConnection()) {
      return _apiService.delete(url, id);
    } else {
      return _localDatabaseService.delete(url, id);
    }
  }

  @override
  Future<DataResponse<T?>> insert(String url, T body,
      {T? Function(Map<String, dynamic> p1)? fromJsonT,
      Map<String, dynamic>? Function(T p1)? toJson}) async {
    if (await _connectionService.hasConnection()) {
      return _apiService.insert(url, body,
          fromJsonT: fromJsonT, toJson: toJson);
    } else {
      return _localDatabaseService.insert(url, body,
          fromJsonT: fromJsonT, toJson: toJson);
    }
  }

  @override
  Future<DataResponse<List<T>>> list(
      String url, List<T> Function(dynamic p1) fromJsonT) async {
    if (await _connectionService.hasConnection()) {
      return _apiService.list(url, fromJsonT);
    } else {
      return _localDatabaseService.list(url, fromJsonT);
    }
  }

  @override
  Future<DataResponse<T>> show(String url, String id,
      T Function(Map<String, dynamic> p1) fromJsonT) async {
    if (await _connectionService.hasConnection()) {
      return _apiService.show(url, id, fromJsonT);
    } else {
      return _localDatabaseService.show(url, id, fromJsonT);
    }
  }

  @override
  Future<DataResponse<T>> update(String url, String id, T body,
      {T? Function(Map<String, dynamic> p1)? fromJsonT,
      Map<String, dynamic>? Function(T p1)? toJson}) async {
    if (await _connectionService.hasConnection()) {
      return _apiService.update(url, id, body,
          fromJsonT: fromJsonT, toJson: toJson);
    } else {
      return _localDatabaseService.update(url, id, body,
          fromJsonT: fromJsonT, toJson: toJson);
    }
  }
}
