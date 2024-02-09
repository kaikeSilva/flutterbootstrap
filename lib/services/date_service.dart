import 'package:observable_flutter/models/date.dart';
import 'package:observable_flutter/services/api_service.dart';
import 'package:observable_flutter/models/data_response.dart';

class DateService extends ApiService<Date> {
  final String _baseUrl = "/periodos/api/v1/data/";
  final String collectionName = "date";

  Future<DataResponse<Date?>> addDate(Date date) async {
    return insert(_baseUrl, date,
        fromJsonT: (json) => Date.fromJson(json),
        toJson: (date) => date.toJson());
  }

  Future<DataResponse<Date>> getDate(String id) async {
    return show('$_baseUrl/', id, (json) => Date.fromJson(json));
  }

  Future<DataResponse<Date>> updateDate(String id, Date date) async {
    return update('$_baseUrl/', id, date,
        fromJsonT: (json) => Date.fromJson(json),
        toJson: (date) => date.toJson());
  }

  Future<DataResponse<Date?>> deleteDate(String id) async {
    return delete('$_baseUrl/', id);
  }

  Future<DataResponse<List<Date>>> getDates() async {
    return list(_baseUrl, (jsonData) {
      Iterable iterable = jsonData as Iterable;
      return iterable.map((item) => Date.fromJson(item)).toList();
    });
  }
}
