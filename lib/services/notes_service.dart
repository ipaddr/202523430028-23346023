import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesService {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'notes.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT)',
        );
      },
    );

    return _db!;
  }

  Future<void> createNote(String text) async {
    final db = await database;

    await db.insert(
      'notes',
      {'text': text},
    );
  }

  Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await database;
    return await db.query('notes');
  }

  Future<void> deleteNote(int id) async {
    final db = await database;

    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}