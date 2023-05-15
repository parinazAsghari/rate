import 'package:eom_parinaz_asghari_sample/feature/rating/user_entity.dart';

class UserModel extends UserEntity{

  // Role role;

  UserModel({
    int? id,
    String? userName,
    String? password,
    bool? isVoted,

  }) : super(
      id: id,
      userName: userName,
    password: password,
    isVoted: isVoted

  );


  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      id: json['id'],
      userName: json['userName'],
      password: json['password']

    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userName'] = userName;
    map['password'] = password;
    map['isVoted'] = isVoted;
    return map;
  }
}


class Role{
  int? id;
  String roleName;

  Role({
    this.id,
    required this.roleName

  }) : super(

  );


  factory Role.fromJson(dynamic json) {
    return Role(
        id: json['id'],
        roleName: json['roleName']

    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['roleName'] = roleName;
    return map;
  }
}