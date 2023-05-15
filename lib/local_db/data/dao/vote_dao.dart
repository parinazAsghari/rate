import 'package:eom_parinaz_asghari_sample/local_db/data/model/vote_floor_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class VoteDao {
  @Query('SELECT * FROM VoteFloor')
  Future<List<VoteFloor>?>? getAllVotes();

  @Query('SELECT * FROM VoteFloor WHERE id = :id')
  Future<VoteFloor?> getVoteById(int id);

  @insert
  Future<void> insertVote(VoteFloor vote);

  @delete
  Future<void> deleteVote(VoteFloor vote);
//ایا فلان ای دی به فلانی رای داده یا نه
  @Query('SELECT * FROM VoteFloor WHERE whoIsVoting = :whoIsVoting AND whoIsVoted = :whoIsVoted')
  Future<VoteFloor?> isVotedByWhoIsVoting(int whoIsVoting , int whoIsVoted);
}