import 'package:eom_parinaz_asghari_sample/database/app_database.dart';
import 'package:eom_parinaz_asghari_sample/di/di_setup.dart';
import 'package:eom_parinaz_asghari_sample/feature/rating/user_model.dart';
import 'package:eom_parinaz_asghari_sample/feature/rating/vote_model.dart';
import 'package:eom_parinaz_asghari_sample/local_db/data/data_source/local_db_data_source.dart';
import 'package:eom_parinaz_asghari_sample/local_db/data/model/user_floor_model.dart';
import 'package:eom_parinaz_asghari_sample/local_db/data/model/vote_floor_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl extends LocalDataSource{
  LocalDataSourceImpl();
  // final AppDatabase appDatabase;

  @override
  Future addUser(UserModel userModel) async {
    var db = await getIt.getAsync<AppDatabase>();
    var result = await db.userDao.insertUser(
      UserFloor(name: userModel.userName,password: userModel.password,isVoted: userModel.isVoted)
    );
    // var box = await Hive.openBox(Common.hiveBoxUser);
    // await box.put(
    //     userModel.id,
    //     UserHiveModel(
    //         id: userModel.id,
    //         userName: userModel.userName,
    //       password: userModel.password
    //     )
    // );
    // var result  = await getUsers();
    //
    // return result;
  }


  @override
  Future<List<UserModel>> getUsers() async {
    var db = await getIt.getAsync<AppDatabase>();
    var result = await db.userDao.getAllUsers();
    List<UserModel> userModelList = [];
    if(result!.isNotEmpty){
    for (var element in result) {
      userModelList.add(
          UserModel(
              id: element.id,
              userName: element.name,
            password: element.password,
            isVoted: element.isVoted
          )
      );
    }
    }
    return userModelList;

  }

  @override
  Future<List<VoteModel>> getVotes() async {
    var db = await getIt.getAsync<AppDatabase>();
    var result = await db.voteDao.getAllVotes();
    List<VoteModel> voteListModel = [];
    if(result!.isNotEmpty) {
      for (var element in result) {
        voteListModel.add(
            VoteModel(
                id: element.id,
                whoIsVoting: element.whoIsVoting,
                whoIsVoted: element.whoIsVoted
            )
        );
      }
    }
    return voteListModel;

  }

  @override
  Future addVote(VoteModel voteModel) async {
    var db = await getIt.getAsync<AppDatabase>();
    var result = await db.voteDao.insertVote(
        VoteFloor(
          whoIsVoted: voteModel.whoIsVoted,
          whoIsVoting: voteModel.whoIsVoting,
          rate:  voteModel.rate
        )
    );
   await getVotes();
    // await box.put(
    //     Common.hiveVote,
    //     VoteHive(
    //         whoIsVoting: voteModel.whoIsVoting,
    //         whoIsVoted: voteModel.whoIsVoted
    //     )
    // );
    // var result  = await getVotes();
    // return result;
  }

  @override
  Future<UserModel?> checkUserExist(String userName, String password) async {
   var userList = await getUsers();
   if(userList.isNotEmpty) {
     for (var element in userList) {
       if (element.userName == userName && element.password == password) {
         return element;
       } else {
        continue;
       }
     }
   }
     return null;

  }

  @override
  Future<UserModel> getUserById(int id) async {
    var db = await getIt.getAsync<AppDatabase>();
    var result = await db.userDao.getUserById(id);
    return UserModel(
      id: result?.id,
      userName: result?.name,
      password: result?.password,
      isVoted: result?.isVoted
    );

  }

  @override
  Future<VoteModel> getVoteById(int id) async {
    var db = await getIt.getAsync<AppDatabase>();
    var result = await db.voteDao.getVoteById(id);
    return VoteModel(
        id: result?.id,
       whoIsVoting: result?.whoIsVoting,
      whoIsVoted: result?.whoIsVoted
    );
  }

  @override
  Future<bool?> isVotedByWhoIsVoting(int whoIsVoting, int whoIsVoted) async {
    var db = await getIt.getAsync<AppDatabase>();
    var result = await db.voteDao.isVotedByWhoIsVoting(whoIsVoting,whoIsVoted);
    if(result==null){
      return false;
    }else{
      return true;
    }

  }



}