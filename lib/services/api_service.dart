import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/models/api_response.dart';
import 'package:observable_flutter/services/local_storage_service.dart';

// ApiService agora é genérico com o tipo T
class ApiService<T> {
  final storage = locator<LocalStorageService>();
  final String baseUrl =
      "https://9621-2001-12f0-c0b-81d-525e-974b-2f52-314e.ngrok-free.app";

  Future<ApiResponse<T?>> post(String url, dynamic body,
      T? Function(Map<String, dynamic>) fromJsonT) async {
    try {
      final authtoken = await storage.read("access");
      final response = await http.post(
        Uri.parse(baseUrl + url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $authtoken"
        },
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final json = response.body;
        if (json.isEmpty) {
          return ApiResponse(
              data: null,
              errorMessage: "Error: ${response.statusCode}",
              statusCode: response.statusCode);
        }

        final decoded = jsonDecode(json);
        final items = decoded;
        if (items == null) {
          return ApiResponse(
              data: null,
              errorMessage: "Error: ${response.statusCode}",
              statusCode: response.statusCode);
        }
        T? data = fromJsonT(items);
        return ApiResponse(data: data, statusCode: 200, errorMessage: null);
      } else {
        throw ApiResponse(
            data: null,
            errorMessage: "Error: ${response.statusCode}",
            statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<List<T>>> get(
      String url, List<T> Function(dynamic) fromJsonT) async {
    try {
      final finalUrl = baseUrl + url;
      final response = await http.get(Uri.parse(finalUrl),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        final json = response.body;
        final decoded = jsonDecode(json);
        Iterable items = decoded["data"];
        List<T> data = fromJsonT(items);
        return ApiResponse<List<T>>(
            data: data, statusCode: 200, errorMessage: null);
      } else {
        return ApiResponse(
            data: null,
            errorMessage: "Error: ${response.statusCode}",
            statusCode: response.statusCode);
      }
    } catch (e) {
      print(e);
      return ApiResponse(
          data: null, errorMessage: e.toString(), statusCode: null);
    }
  }

  Future<ApiResponse<T>> put(String url, dynamic body,
      T Function(Map<String, dynamic>) fromJsonT) async {
    try {
      final response = await http.put(
        Uri.parse(baseUrl + url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final json = response.body;
        final decoded = jsonDecode(json);
        final data = fromJsonT(decoded);
        return ApiResponse(data: data, statusCode: 200, errorMessage: null);
      } else {
        return ApiResponse(
            data: null,
            errorMessage: "Error: ${response.statusCode}",
            statusCode: response.statusCode);
      }
    } catch (e) {
      return ApiResponse(
          data: null, errorMessage: e.toString(), statusCode: null);
    }
  }

  Future<ApiResponse<T>> delete(String url) async {
    try {
      final response = await http.delete(Uri.parse(baseUrl + url),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        return const ApiResponse(
            data: null, statusCode: 200, errorMessage: null);
      } else {
        return ApiResponse(
            data: null,
            errorMessage: "Error: ${response.statusCode}",
            statusCode: response.statusCode);
      }
    } catch (e) {
      return ApiResponse(
          data: null, errorMessage: e.toString(), statusCode: null);
    }
  }

  Future<ApiResponse<T>> show(
      String url, T Function(Map<String, dynamic>) fromJsonT) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + url),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        final json = response.body;
        final decoded = jsonDecode(json);
        final data = fromJsonT(decoded);
        return ApiResponse(data: data, statusCode: 200, errorMessage: null);
      } else {
        return ApiResponse(
            data: null,
            errorMessage: "Error: ${response.statusCode}",
            statusCode: response.statusCode);
      }
    } catch (e) {
      return ApiResponse(
          data: null, errorMessage: e.toString(), statusCode: null);
    }
  }
}
