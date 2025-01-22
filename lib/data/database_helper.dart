import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/todo_model.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database? _database;

  DataBaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'bloc_example.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE items(
        id INTEGER PRIMARY KEY, 
        title TEXT, 
        description TEXT,
        isCompleted INTEGER,
        date TEXT
      )
      ''');
  }

  Future<int> insertItem(TodoModel todoModel) async {
    final db = await database;
    return await db.insert(
      'items',
      todoModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace, // Prevent duplicate entries
    );
  }

  Future<List<TodoModel>> getAllItems() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('items');
    return result.map((map) => TodoModel.fromJson(map)).toList();
  }

  Future<int> updateItem(TodoModel item) async {
    final db = await database;
    return await db.update(
      'items',
      item.toJson(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteItem(int id) async {
    final db = await database;
    return await db.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
