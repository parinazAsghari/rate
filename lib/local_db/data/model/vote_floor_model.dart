
import 'package:floor/floor.dart';

@entity
class VoteFloor {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int? whoIsVoting;
  final int? whoIsVoted;
  //همه ریتی که گرفته
  final double? rate;

  VoteFloor({this.id, this.whoIsVoting, this.whoIsVoted,this.rate,});
}