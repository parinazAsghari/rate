// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  VoteDao? _voteDaoInstance;

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UserFloor` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `password` TEXT, `isVoted` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `VoteFloor` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `whoIsVoting` INTEGER, `whoIsVoted` INTEGER, `rate` REAL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  VoteDao get voteDao {
    return _voteDaoInstance ??= _$VoteDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$VoteDao extends VoteDao {
  _$VoteDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _voteFloorInsertionAdapter = InsertionAdapter(
            database,
            'VoteFloor',
            (VoteFloor item) => <String, Object?>{
                  'id': item.id,
                  'whoIsVoting': item.whoIsVoting,
                  'whoIsVoted': item.whoIsVoted,
                  'rate': item.rate
                }),
        _voteFloorDeletionAdapter = DeletionAdapter(
            database,
            'VoteFloor',
            ['id'],
            (VoteFloor item) => <String, Object?>{
                  'id': item.id,
                  'whoIsVoting': item.whoIsVoting,
                  'whoIsVoted': item.whoIsVoted,
                  'rate': item.rate
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<VoteFloor> _voteFloorInsertionAdapter;

  final DeletionAdapter<VoteFloor> _voteFloorDeletionAdapter;

  @override
  Future<List<VoteFloor>?>? getAllVotes() async {
    return _queryAdapter.queryList('SELECT * FROM VoteFloor',
        mapper: (Map<String, Object?> row) => VoteFloor(
            id: row['id'] as int?,
            whoIsVoting: row['whoIsVoting'] as int?,
            whoIsVoted: row['whoIsVoted'] as int?,
            rate: row['rate'] as double?));
  }

  @override
  Future<VoteFloor?> getVoteById(int id) async {
    return _queryAdapter.query('SELECT * FROM VoteFloor WHERE id = ?1',
        mapper: (Map<String, Object?> row) => VoteFloor(
            id: row['id'] as int?,
            whoIsVoting: row['whoIsVoting'] as int?,
            whoIsVoted: row['whoIsVoted'] as int?,
            rate: row['rate'] as double?),
        arguments: [id]);
  }

  @override
  Future<VoteFloor?> isVotedByWhoIsVoting(
    int whoIsVoting,
    int whoIsVoted,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM VoteFloor WHERE whoIsVoting = ?1 AND whoIsVoted = ?2',
        mapper: (Map<String, Object?> row) => VoteFloor(
            id: row['id'] as int?,
            whoIsVoting: row['whoIsVoting'] as int?,
            whoIsVoted: row['whoIsVoted'] as int?,
            rate: row['rate'] as double?),
        arguments: [whoIsVoting, whoIsVoted]);
  }

  @override
  Future<void> insertVote(VoteFloor vote) async {
    await _voteFloorInsertionAdapter.insert(vote, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteVote(VoteFloor vote) async {
    await _voteFloorDeletionAdapter.delete(vote);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userFloorInsertionAdapter = InsertionAdapter(
            database,
            'UserFloor',
            (UserFloor item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'password': item.password,
                  'isVoted':
                      item.isVoted == null ? null : (item.isVoted! ? 1 : 0)
                }),
        _userFloorUpdateAdapter = UpdateAdapter(
            database,
            'UserFloor',
            ['id'],
            (UserFloor item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'password': item.password,
                  'isVoted':
                      item.isVoted == null ? null : (item.isVoted! ? 1 : 0)
                }),
        _userFloorDeletionAdapter = DeletionAdapter(
            database,
            'UserFloor',
            ['id'],
            (UserFloor item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'password': item.password,
                  'isVoted':
                      item.isVoted == null ? null : (item.isVoted! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserFloor> _userFloorInsertionAdapter;

  final UpdateAdapter<UserFloor> _userFloorUpdateAdapter;

  final DeletionAdapter<UserFloor> _userFloorDeletionAdapter;

  @override
  Future<List<UserFloor>?> getAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM UserFloor',
        mapper: (Map<String, Object?> row) => UserFloor(
            id: row['id'] as int?,
            name: row['name'] as String?,
            password: row['password'] as String?,
            isVoted:
                row['isVoted'] == null ? null : (row['isVoted'] as int) != 0));
  }

  @override
  Future<UserFloor?> getUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM UserFloor WHERE id = ?1',
        mapper: (Map<String, Object?> row) => UserFloor(
            id: row['id'] as int?,
            name: row['name'] as String?,
            password: row['password'] as String?,
            isVoted:
                row['isVoted'] == null ? null : (row['isVoted'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<void> insertUser(UserFloor user) async {
    await _userFloorInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(UserFloor user) async {
    await _userFloorUpdateAdapter.update(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUser(UserFloor user) async {
    await _userFloorDeletionAdapter.delete(user);
  }
}
