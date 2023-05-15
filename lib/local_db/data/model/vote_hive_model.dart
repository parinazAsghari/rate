import 'package:hive_flutter/hive_flutter.dart';

part 'vote_hive_model.g.dart';

@HiveType(typeId: 2)
class VoteHive extends HiveObject{
  VoteHive(
      {
        this.whoIsVoting,
        this.whoIsVoted
      }):super();

  @HiveField(0)
  int? whoIsVoting;
  @HiveField(1)
  int? whoIsVoted;


}