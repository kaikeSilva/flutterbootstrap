import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'date.freezed.dart';
part 'date.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Date with _$Date {
  const Date._();

  factory Date({
    required int? id,
    required String? datatime,
    required String? tipo,
    required int? object_id,
    required int? content_type,
  }) = _Date;

  Id get isarId => id ?? 0;

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);
}
