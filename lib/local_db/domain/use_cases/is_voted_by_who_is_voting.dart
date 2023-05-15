import 'package:eom_parinaz_asghari_sample/local_db/domain/repository/local_db_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class IsVotedByWhoIsVotingUseCase  {
  IsVotedByWhoIsVotingUseCase(this._repository);

  final LocalRepository _repository;

  Future<bool?> call(int whoIsVoting , int whoIsVoted) async {
    bool? result = await _repository.isVotedByWhoIsVoting(whoIsVoting, whoIsVoted);
    return result;
  }
}