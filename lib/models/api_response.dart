import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

typedef JsonToT<T> = T Function(Map<String, dynamic>);

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const ApiResponse._();

  const factory ApiResponse({
    required T? data,
    required String? errorMessage,
    required int? statusCode,
  }) = _ApiResponse<T>;

  // Custom fromJson method
  factory ApiResponse.fromJson(
      Map<String, dynamic> json, JsonToT<T> fromJsonT) {
    return ApiResponse<T>(
      data: fromJsonT(json['data']),
      errorMessage: json['errorMessage'] as String?,
      statusCode: json['statusCode'] as int?,
    );
  }
}
