// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDateCollection on Isar {
  IsarCollection<Date> get dates => this.collection();
}

const DateSchema = CollectionSchema(
  name: r'Date',
  id: 8536446127664714782,
  properties: {
    r'content_type': PropertySchema(
      id: 0,
      name: r'content_type',
      type: IsarType.long,
    ),
    r'datatime': PropertySchema(
      id: 1,
      name: r'datatime',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.long,
    ),
    r'object_id': PropertySchema(
      id: 3,
      name: r'object_id',
      type: IsarType.long,
    ),
    r'tipo': PropertySchema(
      id: 4,
      name: r'tipo',
      type: IsarType.string,
    )
  },
  estimateSize: _dateEstimateSize,
  serialize: _dateSerialize,
  deserialize: _dateDeserialize,
  deserializeProp: _dateDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dateGetId,
  getLinks: _dateGetLinks,
  attach: _dateAttach,
  version: '3.1.0+1',
);

int _dateEstimateSize(
  Date object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.datatime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tipo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dateSerialize(
  Date object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.content_type);
  writer.writeString(offsets[1], object.datatime);
  writer.writeLong(offsets[2], object.id);
  writer.writeLong(offsets[3], object.object_id);
  writer.writeString(offsets[4], object.tipo);
}

Date _dateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Date(
    content_type: reader.readLongOrNull(offsets[0]),
    datatime: reader.readStringOrNull(offsets[1]),
    id: reader.readLongOrNull(offsets[2]),
    object_id: reader.readLongOrNull(offsets[3]),
    tipo: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _dateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dateGetId(Date object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _dateGetLinks(Date object) {
  return [];
}

void _dateAttach(IsarCollection<dynamic> col, Id id, Date object) {}

extension DateQueryWhereSort on QueryBuilder<Date, Date, QWhere> {
  QueryBuilder<Date, Date, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DateQueryWhere on QueryBuilder<Date, Date, QWhereClause> {
  QueryBuilder<Date, Date, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Date, Date, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Date, Date, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Date, Date, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DateQueryFilter on QueryBuilder<Date, Date, QFilterCondition> {
  QueryBuilder<Date, Date, QAfterFilterCondition> content_typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content_type',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> content_typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content_type',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> content_typeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content_type',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> content_typeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content_type',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> content_typeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content_type',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> content_typeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content_type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> datatimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'datatime',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> datatimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'datatime',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> datatimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datatime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> datatimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'datatime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> datatimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'datatime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> datatimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'datatime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> datatimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'datatime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> datatimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'datatime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> datatimeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'datatime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> datatimeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'datatime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> datatimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datatime',
        value: '',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> datatimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'datatime',
        value: '',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> object_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'object_id',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> object_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'object_id',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> object_idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'object_id',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> object_idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'object_id',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> object_idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'object_id',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> object_idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'object_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> tipoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tipo',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> tipoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tipo',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> tipoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> tipoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> tipoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> tipoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> tipoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> tipoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> tipoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> tipoMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }
}

extension DateQueryObject on QueryBuilder<Date, Date, QFilterCondition> {}

extension DateQueryLinks on QueryBuilder<Date, Date, QFilterCondition> {}

extension DateQuerySortBy on QueryBuilder<Date, Date, QSortBy> {
  QueryBuilder<Date, Date, QAfterSortBy> sortByContent_type() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content_type', Sort.asc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> sortByContent_typeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content_type', Sort.desc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> sortByDatatime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datatime', Sort.asc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> sortByDatatimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datatime', Sort.desc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> sortByObject_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'object_id', Sort.asc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> sortByObject_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'object_id', Sort.desc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension DateQuerySortThenBy on QueryBuilder<Date, Date, QSortThenBy> {
  QueryBuilder<Date, Date, QAfterSortBy> thenByContent_type() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content_type', Sort.asc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> thenByContent_typeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content_type', Sort.desc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> thenByDatatime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datatime', Sort.asc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> thenByDatatimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datatime', Sort.desc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> thenByObject_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'object_id', Sort.asc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> thenByObject_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'object_id', Sort.desc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<Date, Date, QAfterSortBy> thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension DateQueryWhereDistinct on QueryBuilder<Date, Date, QDistinct> {
  QueryBuilder<Date, Date, QDistinct> distinctByContent_type() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content_type');
    });
  }

  QueryBuilder<Date, Date, QDistinct> distinctByDatatime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'datatime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Date, Date, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<Date, Date, QDistinct> distinctByObject_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'object_id');
    });
  }

  QueryBuilder<Date, Date, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }
}

extension DateQueryProperty on QueryBuilder<Date, Date, QQueryProperty> {
  QueryBuilder<Date, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Date, int?, QQueryOperations> content_typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content_type');
    });
  }

  QueryBuilder<Date, String?, QQueryOperations> datatimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'datatime');
    });
  }

  QueryBuilder<Date, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Date, int?, QQueryOperations> object_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'object_id');
    });
  }

  QueryBuilder<Date, String?, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DateImpl _$$DateImplFromJson(Map<String, dynamic> json) => _$DateImpl(
      id: json['id'] as int?,
      datatime: json['datatime'] as String?,
      tipo: json['tipo'] as String?,
      object_id: json['object_id'] as int?,
      content_type: json['content_type'] as int?,
    );

Map<String, dynamic> _$$DateImplToJson(_$DateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'datatime': instance.datatime,
      'tipo': instance.tipo,
      'object_id': instance.object_id,
      'content_type': instance.content_type,
    };
