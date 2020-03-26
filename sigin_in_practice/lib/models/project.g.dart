// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project()
    ..lineName = json['lineName'] as String
    ..isSubway = json['isSubway'] as bool
    ..prjId = json['prjId'] as num
    ..name = json['name'] as String
    ..lineId = json['lineId'] as num
    ..coor = json['coor'] as Map<String, dynamic>
    ..deviceTypes = json['deviceTypes'] as List
    ..projectType = json['projectType'] as String
    ..constructionCorp = json['constructionCorp'] as String
    ..department = json['department'] as String
    ..ownerCorp = json['ownerCorp'] as String
    ..isAutoProject = json['isAutoProject'] as bool;
}

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'lineName': instance.lineName,
      'isSubway': instance.isSubway,
      'prjId': instance.prjId,
      'name': instance.name,
      'lineId': instance.lineId,
      'coor': instance.coor,
      'deviceTypes': instance.deviceTypes,
      'projectType': instance.projectType,
      'constructionCorp': instance.constructionCorp,
      'department': instance.department,
      'ownerCorp': instance.ownerCorp,
      'isAutoProject': instance.isAutoProject
    };
