import 'package:eom_parinaz_asghari_sample/feature/rating/user_entity.dart';
import 'package:eom_parinaz_asghari_sample/local_db/domain/repository/local_db_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckUserExistUseCase {
  CheckUserExistUseCase(this._repository);

  final LocalRepository _repository;

  Future<UserEntity?> call(arg1, arg2) async {
    var result = await _repository.checkUserExist(arg1, arg2);
    return result;
  }
}
