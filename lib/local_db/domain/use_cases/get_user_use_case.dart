import 'package:eom_parinaz_asghari_sample/feature/rating/user_entity.dart';
import 'package:eom_parinaz_asghari_sample/local_db/domain/repository/local_db_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserUseCase  {
  GetUserUseCase(this._repository);

  final LocalRepository _repository;

  Future<List<UserEntity>> call() async {
    List<UserEntity> result = await _repository.getUsers();
    return result;
  }
}