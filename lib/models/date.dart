import 'package:freezed_annotation/freezed_annotation.dart';

part 'date.freezed.dart';
part 'date.g.dart';

@freezed
class Date with _$Date {
  factory Date({
    required int? id,
    required String? datatime,
    required String? tipo,
    required int? object_id,
    required int? content_type,
  }) = _Date;

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);
}
