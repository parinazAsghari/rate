import 'package:eom_parinaz_asghari_sample/feature/rating/user_model.dart';
import 'package:eom_parinaz_asghari_sample/feature/rating/vote_model.dart';

abstract class LocalDataSource {
  Future addUser(UserModel userModel);
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUserById(int id);
  Future<VoteModel> getVoteById(int id);
  Future addVote(VoteModel voteModel);
  Future<List<VoteModel>> getVotes();
  Future<UserModel?> checkUserExist(String userName , String password);
  Future<bool?> isVotedByWhoIsVoting(int whoIsVoting , int whoIsVoted);


}