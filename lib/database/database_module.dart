import 'package:eom_parinaz_asghari_sample/database/app_database.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DatabaseModule{

  @factoryMethod
  Future<AppDatabase> get database async {
    final AppDatabase appDatabase = await  $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return appDatabase;

  }
}