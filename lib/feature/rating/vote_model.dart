import 'package:eom_parinaz_asghari_sample/feature/rating/vote_entity.dart';

class VoteModel extends VoteEntity{


  VoteModel({
    int? id,
    int? whoIsVoting,
    int? whoIsVoted,
    double? rate

  }) : super(
      id: id,
      whoIsVoted: whoIsVoted,
      whoIsVoting: whoIsVoting,
    rate :rate

  );


  factory VoteModel.fromJson(dynamic json) {
    return VoteModel(
      whoIsVoted: json['voted'],
      whoIsVoting: json['voting'],
      rate: json['rate'],

    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['voted'] = whoIsVoted;
    map['voting'] = whoIsVoting;
    map['id'] = id;
    map['rate'] = rate;
    return map;
  }
}
