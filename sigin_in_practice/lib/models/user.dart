import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
    User();

    String userName;
    String authentication;
    String phone;
    String mail;
    String realName;
    String corporation;
    String department;
    String avatar;
    String authorityDescription;
    List authorzedLevel;
    String uid;
    
    factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
}
