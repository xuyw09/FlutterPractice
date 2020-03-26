// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Line _$LineFromJson(Map<String, dynamic> json) {
  return Line()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..locate = json['locate'] as String
    ..cityId = json['cityId'] as num
    ..seq = json['seq'] as num
    ..isSubway = json['isSubway'] as bool
    ..sections = json['sections'] as String;
}

Map<String, dynamic> _$LineToJson(Line instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'locate': instance.locate,
      'cityId': instance.cityId,
      'seq': instance.seq,
      'isSubway': instance.isSubway,
      'sections': instance.sections
    };
