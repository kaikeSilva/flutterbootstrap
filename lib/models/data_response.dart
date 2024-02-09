import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:observable_flutter/models/data_response.dart';

part 'data_response.freezed.dart';

typedef JsonToT<T> = T Function(Map<String, dynamic>);

@freezed
class DataResponse<T> with _$DataResponse<T> {
  const DataResponse._();

  const factory DataResponse({
    required T? data,
    required String? errorMessage,
    required int? statusCode,
  }) = _DataResponse<T>;

  // Custom fromJson method
  factory DataResponse.fromJson(
      Map<String, dynamic> json, JsonToT<T> fromJsonT) {
    return DataResponse<T>(
      data: fromJsonT(json['data']),
      errorMessage: json['errorMessage'] as String?,
      statusCode: json['statusCode'] as int?,
    );
  }
}
