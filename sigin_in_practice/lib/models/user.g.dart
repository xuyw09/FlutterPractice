// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..userName = json['userName'] as String
    ..authentication = json['authentication'] as String
    ..phone = json['phone'] as String
    ..mail = json['mail'] as String
    ..realName = json['realName'] as String
    ..corporation = json['corporation'] as String
    ..department = json['department'] as String
    ..avatar = json['avatar'] as String
    ..authorityDescription = json['authorityDescription'] as String
    ..authorzedLevel = json['authorzedLevel'] as List
    ..uid = json['uid'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userName': instance.userName,
      'authentication': instance.authentication,
      'phone': instance.phone,
      'mail': instance.mail,
      'realName': instance.realName,
      'corporation': instance.corporation,
      'department': instance.department,
      'avatar': instance.avatar,
      'authorityDescription': instance.authorityDescription,
      'authorzedLevel': instance.authorzedLevel,
      'uid': instance.uid
    };
