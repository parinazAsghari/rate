import 'package:eom_parinaz_asghari_sample/feature/rating/user_model.dart';

class UserEntity {
  final int? id;
  final String? userName;
  final String? password;
  final bool? isVoted;




  UserEntity(  {
     this.id,
     this.userName,
     this.password,
     this.isVoted,
  });

  // UserModel toModel() {
  //   return UserModel(
  //     id: id,
  //     userName: userName,
  //     password: password
  //   );
  // }
  UserModel toModel() {
    return UserModel(
      id: id,
      userName: userName,
      password: password,
      isVoted: isVoted
    );
  }
}