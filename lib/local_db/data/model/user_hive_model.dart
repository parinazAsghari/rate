import 'package:eom_parinaz_asghari_sample/local_db/data/model/vote_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: 1)
class UserHiveModel extends HiveObject{
  UserHiveModel(
      {
        this.id,
        this.userName,
        this.password,
        this.voteList
      }):super();

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? userName;
  @HiveField(2)
  List<VoteHive>? voteList;
  @HiveField(3)
  String? password;


}