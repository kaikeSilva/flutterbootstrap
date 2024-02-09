import 'package:freezed_annotation/freezed_annotation.dart';
part 'data_response.freezed.dart';

typedef JsonToT<T> = T Function(Map<String, dynamic>);

@freezed
class DataResponse<T> with _$DataResponse<T> {
  const DataResponse._();

  const factory DataResponse({
    required T? data,
    required String? message,
    required int? statusCode,
  }) = _DataResponse<T>;

  factory DataResponse.fromJson(
      Map<String, dynamic> json, JsonToT<T> fromJsonT) {
    return DataResponse<T>(
      data: fromJsonT(json['data']),
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
    );
  }
}
