import 'package:floor/floor.dart';

@entity
class UserFloor {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? name;
  final String? password;
  final bool? isVoted;

  UserFloor({this.id, this.name, this.password, this.isVoted});
}