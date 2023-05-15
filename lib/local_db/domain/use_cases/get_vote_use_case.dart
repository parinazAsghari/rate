import 'package:eom_parinaz_asghari_sample/feature/rating/vote_entity.dart';
import 'package:eom_parinaz_asghari_sample/local_db/domain/repository/local_db_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetVoteUseCase  {
  GetVoteUseCase(this._repository);

  final LocalRepository _repository;

  Future<List<VoteEntity>> call() async {
    List<VoteEntity> result = await _repository.getVotes();
    return result;
  }
}