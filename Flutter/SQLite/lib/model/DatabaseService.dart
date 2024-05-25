import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'MovieModel.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final getDirectory = await getApplicationDocumentsDirectory();
    String path = getDirectory.path + '/movies.db';
    log(path);
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Movies(id TEXT PRIMARY KEY, title TEXT, language TEXT, year INTEGER)');
    log('TABLE CREATED');
  }

  Future<List<MovieModel>> getMovies() async {
    final db = await _databaseService.database;
    var data = await db.rawQuery('SELECT * FROM Movies');
    List<MovieModel> movies =
        List.generate(data.length, (index) => MovieModel.fromJson(data[index]));
    print(movies.length);
    return movies;
  }

  Future<void> insertMovie(MovieModel movie) async {
    final db = await _databaseService.database;
    var data = await db.rawInsert(
        'INSERT INTO Movies(id, title, language, year ) VALUES(?,?,?,?)',
        [movie.id, movie.title, movie.language, movie.year]);
    log('inserted $data');
  }

  Future<void> editMovie(MovieModel movie) async {
    final db = await _databaseService.database;
    var data = await db.rawUpdate(
        'UPDATE Movies SET title=?,language=?,year=? WHERE ID=?',
        [movie.title, movie.language, movie.year, movie.id]);
    log('updated $data');
  }

  Future<void> deleteMovie(String id) async {
    final db = await _databaseService.database;
    var data = await db.rawDelete('DELETE from Movies WHERE id=?', [id]);
    log('deleted $data');
  }
}
