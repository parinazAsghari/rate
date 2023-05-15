import 'package:eom_parinaz_asghari_sample/feature/rating/vote_model.dart';

class VoteEntity {
  final int? id;
  final int? whoIsVoting;
  final int? whoIsVoted;
  final double? rate;




  VoteEntity( {
     this.id,
     this.whoIsVoted,
     this.whoIsVoting,
     this.rate
  });

  VoteModel toModel() {
    return VoteModel(
      id: id,
      whoIsVoting: whoIsVoting,
      whoIsVoted: whoIsVoted,
      rate: rate

    );
  }
}