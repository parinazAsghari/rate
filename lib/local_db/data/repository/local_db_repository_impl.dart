import 'package:eom_parinaz_asghari_sample/feature/rating/user_entity.dart';
import 'package:eom_parinaz_asghari_sample/feature/rating/vote_entity.dart';
import 'package:eom_parinaz_asghari_sample/local_db/data/data_source/local_db_data_source.dart';
import 'package:eom_parinaz_asghari_sample/local_db/domain/repository/local_db_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocalRepository)
class LocalDbRepositoryImpl extends LocalRepository{

  final LocalDataSource _localDataSource;

  LocalDbRepositoryImpl( this._localDataSource,);

  @override
  Future addUser(UserEntity userEntity) async {
    try {
      // var result = await getIt<AppDatabase>().userDao.insertUser(userEntity.toModel());
      // var result = await appDatabase.userDao.insertUser(userEntity.toModel());
      final localResult = await _localDataSource.addUser(userEntity.toModel());
    } catch (e, s) {
      return [];
    }
  }

  @override
  Future addVote(VoteEntity voteEntity) async {
    try {
      // var result = await appDatabase.voteDao.insertVote(voteEntity.toModel());
      final localResult = await _localDataSource.addVote(voteEntity.toModel());
      // return localResult;
    } catch (e, s) {
      return [];
    }

  }

  @override
  Future<List<UserEntity>> getUsers() async {
    try {
      // var result = await appDatabase.userDao.getAllUsers();
      final localResult = await _localDataSource.getUsers();
      return localResult;
    } catch (e, s) {
      return [];
    }

  }

  @override
  Future<List<VoteEntity>> getVotes() async {
    try {
      final localResult = await _localDataSource.getVotes();
      return localResult;
    } catch (e, s) {
      print(e);
      return [];
    }
  }

  @override
  Future<UserEntity?> checkUserExist(String userName, String password) async {
    try {
      final localResult = await _localDataSource.checkUserExist(userName, password);
      return localResult;
    } catch (e, s) {
      print(e);
      return null;
    }

  }

  @override
  Future<UserEntity> getUserById(int id) async {
    try {
      final localResult = await _localDataSource.getUserById(id);
      return localResult;
    } catch (e, s) {
      print(e);
      return UserEntity();
    }

  }

  @override
  Future<VoteEntity> getVoteById(int id) async {
    try {
      final localResult = await _localDataSource.getVoteById(id);
      return localResult;
    } catch (e, s) {
      print(e);
      return VoteEntity();
    }
  }

  @override
  Future<bool?> isVotedByWhoIsVoting(int whoIsVoting, int whoIsVoted) async {
    try {
      final localResult = await _localDataSource.isVotedByWhoIsVoting(whoIsVoting,whoIsVoted);
      return localResult;
    } catch (e, s) {
      print(e);
      return false;
    }
  }

}