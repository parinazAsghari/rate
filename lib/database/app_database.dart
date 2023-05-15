import 'package:eom_parinaz_asghari_sample/local_db/data/dao/user_dao.dart';
import 'package:eom_parinaz_asghari_sample/local_db/data/dao/vote_dao.dart';
import 'package:eom_parinaz_asghari_sample/local_db/data/model/user_floor_model.dart';
import 'package:eom_parinaz_asghari_sample/local_db/data/model/vote_floor_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';
@Database(version: 1, entities: [UserFloor,VoteFloor])
abstract class AppDatabase extends FloorDatabase {
  VoteDao get voteDao;
  UserDao get userDao;
}