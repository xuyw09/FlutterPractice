import 'package:json_annotation/json_annotation.dart';

part 'line.g.dart';

@JsonSerializable()
class Line {
    Line();

    num id;
    String name;
    String locate;
    num cityId;
    num seq;
    bool isSubway;
    String sections;
    
    factory Line.fromJson(Map<String,dynamic> json) => _$LineFromJson(json);
    Map<String, dynamic> toJson() => _$LineToJson(this);
}
