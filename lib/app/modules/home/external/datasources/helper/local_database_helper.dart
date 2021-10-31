import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseHelper {
  LocalDatabaseHelper._instance();

  static final LocalDatabaseHelper db = LocalDatabaseHelper._instance();
  late Database _database;

  Future<Database> get database async {
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String databasePath = directory.path + DATABASE_NAME;

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(CREATE_ANIME_TABLE);
  }

  Future close() async {
    var dbClient = await database;
    return dbClient.close();
  }
}

const String DATABASE_NAME = 'anime.db';

const String CREATE_ANIME_TABLE = '''
    create table anime (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      animeId INTEGER,
      link TEXT,
      title TEXT
    )
''';
