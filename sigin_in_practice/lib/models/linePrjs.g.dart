// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linePrjs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinePrjs _$LinePrjsFromJson(Map<String, dynamic> json) {
  return LinePrjs()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..projects = json['projects'] as List
    ..isSubway = json['isSubway'] as bool;
}

Map<String, dynamic> _$LinePrjsToJson(LinePrjs instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'projects': instance.projects,
      'isSubway': instance.isSubway
    };
