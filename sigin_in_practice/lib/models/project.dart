import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
    Project();

    String lineName;
    bool isSubway;
    num prjId;
    String name;
    num lineId;
    Map<String,dynamic> coor;
    List deviceTypes;
    String projectType;
    String constructionCorp;
    String department;
    String ownerCorp;
    bool isAutoProject;
    
    factory Project.fromJson(Map<String,dynamic> json) => _$ProjectFromJson(json);
    Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
