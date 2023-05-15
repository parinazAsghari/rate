import 'package:eom_parinaz_asghari_sample/local_db/data/model/user_floor_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM UserFloor')
  Future<List<UserFloor>?> getAllUsers();

  @Query('SELECT * FROM UserFloor WHERE id = :id')
  Future<UserFloor?> getUserById(int id);

  @insert
  Future<void> insertUser(UserFloor user);

  @update
  Future<void> updateUser(UserFloor user);

  @delete
  Future<void> deleteUser(UserFloor user);
}