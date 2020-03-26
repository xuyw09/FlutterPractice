// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  final originalLines = json['lines'] as List;
  List<Line> lines = originalLines.map((line) => Line.fromJson(line)).toList();
  return City()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..lines = lines;
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lines': instance.lines
    };
