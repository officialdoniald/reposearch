import 'package:reposearch/reposearch/data/models/dto/repo_model_dto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RepoDB {
  static final RepoDB instance = RepoDB._internal();
  RepoDB._internal();

  Database? _db;

  Future<RepoDB> init() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'repositoriess.db');
    _db = await openDatabase(path, version: 3, onCreate: (db, v) {
      return db.execute('''
        CREATE TABLE repos(
          id INTEGER PRIMARY KEY,
          name TEXT,
          full_name TEXT,
          description TEXT,
          html_url TEXT,
          avatar_url TEXT,
          created_at TEXT,
          updated_at TEXT,
          forks_count INTEGER
        )
      ''');
    });
    return this;
  }

  Future<void> insertRepos(List<RepoModelDTO> repos) async {
    final db = _db;
    if (db == null) return;
    final batch = db.batch();
    for (final r in repos) {
      batch.insert('repos', r.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  Future<List<RepoModelDTO>> getAllRepos() async {
    final db = _db;
    if (db == null) return [];
    final maps = await db.query('repos', orderBy: 'full_name ASC');
    return maps.map((m) => RepoModelDTO.fromMap(m)).toList();
  }

  Future<void> clearRepos() async {
    final db = _db;
    if (db == null) return;
    await db.delete('repos');
  }
}
