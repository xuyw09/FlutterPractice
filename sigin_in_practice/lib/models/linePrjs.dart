import 'package:json_annotation/json_annotation.dart';
import './project.dart';
part 'linePrjs.g.dart';

@JsonSerializable()
class LinePrjs {
  LinePrjs();

  num id;
  String name;
  List projects;
  bool isSubway;

  factory LinePrjs.fromJson(Map<String, dynamic> json) =>
      _$LinePrjsFromJson(json);
  Map<String, dynamic> toJson() => _$LinePrjsToJson(this);
}
