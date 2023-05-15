import 'package:eom_parinaz_asghari_sample/feature/rating/vote_entity.dart';
import 'package:eom_parinaz_asghari_sample/local_db/domain/repository/local_db_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddVoteUseCase  {
  AddVoteUseCase(this._repository);

  final LocalRepository _repository;

  Future call(arg) async {
    var result = await _repository.addVote(arg);
    // return result;
  }
}