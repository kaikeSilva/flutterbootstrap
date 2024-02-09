import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/exceptions/data_exception.dart';
import 'package:observable_flutter/models/data_response.dart';
import 'package:observable_flutter/services/data_access_interface.dart';
import 'package:observable_flutter/services/local_storage_service.dart';

// DataService agora é genérico com o tipo T
class ApiService<T> implements DataAccessInterface<T> {
  final storage = locator<LocalStorageService>();
  final String baseUrl = "https://97ca-200-137-195-149.ngrok-free.app";

  @override
  Future<DataResponse<T?>> insert(String url, T body,
      {T? Function(Map<String, dynamic>)? fromJsonT,
      Map<String, dynamic>? Function(T)? toJson}) async {
    final authtoken = await storage.read("access");
    final response = await http.post(
      Uri.parse(baseUrl + url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authtoken"
      },
      body: toJson != null ? jsonEncode(toJson(body)) : jsonEncode({}),
    );

    if (response.statusCode == 200) {
      final json = response.body;
      if (json.isEmpty) {
        return DataResponse(
            data: null,
            message: "Error: ${response.statusCode}",
            statusCode: response.statusCode);
      }

      final decoded = jsonDecode(json);
      final items = decoded;
      if (items == null) {
        return DataResponse(
            data: null,
            message: "Error: ${response.statusCode}",
            statusCode: response.statusCode);
      }
      T? data = fromJsonT != null ? fromJsonT(items) : null;
      return DataResponse(data: data, statusCode: 200, message: null);
    } else {
      throw DataException(response.statusCode, "Error: ${response.statusCode}");
    }
  }

  @override
  Future<DataResponse<List<T>>> list(
      String url, List<T> Function(dynamic) fromJsonT) async {
    final finalUrl = baseUrl + url;
    final response = await http.get(Uri.parse(finalUrl),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final json = response.body;
      final decoded = jsonDecode(json);
      Iterable items = decoded["data"];
      List<T> data = fromJsonT(items);
      return DataResponse<List<T>>(data: data, statusCode: 200, message: null);
    } else {
      throw DataException(response.statusCode, "Error: ${response.statusCode}");
    }
  }

  @override
  Future<DataResponse<T>> update(String url, String id, T body,
      {T? Function(Map<String, dynamic>)? fromJsonT,
      Map<String, dynamic>? Function(T)? toJson}) async {
    final response = await http.put(
      Uri.parse(baseUrl + id + url),
      headers: {"Content-Type": "application/json"},
      body: toJson != null ? toJson(body) : jsonEncode({}),
    );

    if (response.statusCode == 200) {
      final json = response.body;
      final decoded = jsonDecode(json);
      final data = fromJsonT != null ? fromJsonT(decoded) : null;
      return DataResponse(data: data, statusCode: 200, message: null);
    } else {
      throw DataException(response.statusCode, "Error: ${response.statusCode}");
    }
  }

  @override
  Future<DataResponse<T?>> delete(String url, String id) async {
    final response = await http.delete(Uri.parse(baseUrl + id + url),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return const DataResponse(data: null, statusCode: 200, message: null);
    } else {
      throw DataException(response.statusCode, "Error: ${response.statusCode}");
    }
  }

  @override
  Future<DataResponse<T>> show(
      String url, String id, T Function(Map<String, dynamic>) fromJsonT) async {
    final response = await http.get(Uri.parse(baseUrl + id + url),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final json = response.body;
      final decoded = jsonDecode(json);
      final data = fromJsonT(decoded);
      return DataResponse(data: data, statusCode: 200, message: null);
    } else {
      throw DataException(response.statusCode, "Error: ${response.statusCode}");
    }
  }
}
