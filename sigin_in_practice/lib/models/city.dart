import 'package:json_annotation/json_annotation.dart';
import './line.dart';
part 'city.g.dart';

@JsonSerializable()
class City {
  City();

  num id;
  String name;
  List lines;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
