import 'package:observable_flutter/models/date.dart';
import 'package:observable_flutter/services/api_service.dart';
import 'package:observable_flutter/models/api_response.dart';

class DateService extends ApiService<Date> {
  final String _baseUrl = "/periodos/api/v1/data/";

  // CREATE: Adicionar um novo livro
  Future<ApiResponse> addDate(Date book) async {
    final body = book.toJson(); // Supondo que Date tenha um método toJson
    return post(_baseUrl, body, (json) => Date.fromJson(json));
  }

  // READ: Obter um livro pelo ID
  Future<ApiResponse<Date>> getDate(String id) async {
    return show('$_baseUrl/$id', (json) => Date.fromJson(json));
  }

  // UPDATE: Atualizar um livro
  Future<ApiResponse> updateDate(String id, Date book) async {
    final body = book.toJson();
    return put('$_baseUrl/$id', body, (json) => Date.fromJson(json));
  }

  // DELETE: Remover um livro
  Future<ApiResponse> deleteDate(String id) async {
    return delete('$_baseUrl/$id');
  }

  // LIST: Listar todos os livros
  Future<ApiResponse<List<Date>>> getDates() async {
    return get(_baseUrl, (jsonData) {
      Iterable iterable = jsonData as Iterable;
      return iterable.map((item) => Date.fromJson(item)).toList();
    });
  }
}
