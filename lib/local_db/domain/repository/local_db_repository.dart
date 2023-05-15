import 'package:eom_parinaz_asghari_sample/feature/rating/user_entity.dart';
import 'package:eom_parinaz_asghari_sample/feature/rating/vote_entity.dart';

abstract class LocalRepository {

  Future addUser(UserEntity userEntity);
  Future<List<UserEntity>> getUsers();
  Future addVote(VoteEntity voteEntity);
  Future<List<VoteEntity>> getVotes();
  Future<UserEntity?> checkUserExist(String userName , String password);
  Future<UserEntity> getUserById(int id);
  Future<VoteEntity> getVoteById(int id);
  Future<bool?> isVotedByWhoIsVoting(int whoIsVoting , int whoIsVoted);

}
