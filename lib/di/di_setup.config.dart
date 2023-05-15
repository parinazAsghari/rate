// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../database/app_database.dart' as _i3;
import '../database/database_module.dart' as _i14;
import '../local_db/data/data_source/local_db_data_source.dart' as _i4;
import '../local_db/data/data_source/local_db_data_source_impl.dart' as _i5;
import '../local_db/data/repository/local_db_repository_impl.dart' as _i7;
import '../local_db/domain/repository/local_db_repository.dart' as _i6;
import '../local_db/domain/use_cases/add_user_use_case.dart' as _i8;
import '../local_db/domain/use_cases/add_vote_use_case.dart' as _i9;
import '../local_db/domain/use_cases/check_user_exist.dart' as _i10;
import '../local_db/domain/use_cases/get_user_use_case.dart' as _i11;
import '../local_db/domain/use_cases/get_vote_use_case.dart' as _i12;
import '../local_db/domain/use_cases/is_voted_by_who_is_voting.dart' as _i13;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final databaseModule = _$DatabaseModule();
  gh.factoryAsync<_i3.AppDatabase>(() => databaseModule.database);
  gh.lazySingleton<_i4.LocalDataSource>(() => _i5.LocalDataSourceImpl());
  gh.lazySingleton<_i6.LocalRepository>(
      () => _i7.LocalDbRepositoryImpl(gh<_i4.LocalDataSource>()));
  gh.lazySingleton<_i8.AddUserUseCase>(
      () => _i8.AddUserUseCase(gh<_i6.LocalRepository>()));
  gh.lazySingleton<_i9.AddVoteUseCase>(
      () => _i9.AddVoteUseCase(gh<_i6.LocalRepository>()));
  gh.lazySingleton<_i10.CheckUserExistUseCase>(
      () => _i10.CheckUserExistUseCase(gh<_i6.LocalRepository>()));
  gh.lazySingleton<_i11.GetUserUseCase>(
      () => _i11.GetUserUseCase(gh<_i6.LocalRepository>()));
  gh.lazySingleton<_i12.GetVoteUseCase>(
      () => _i12.GetVoteUseCase(gh<_i6.LocalRepository>()));
  gh.lazySingleton<_i13.IsVotedByWhoIsVotingUseCase>(
      () => _i13.IsVotedByWhoIsVotingUseCase(gh<_i6.LocalRepository>()));
  return getIt;
}

class _$DatabaseModule extends _i14.DatabaseModule {}
