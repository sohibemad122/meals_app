import 'package:meals_app/Features/home/data/models/home_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper instance = DbHelper();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'meals.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE meals (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            imageUrl TEXT,
            name TEXT,
            description TEXT,
            rate TEXT,
            time TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertMeal(HomeModel meal) async {
    Map<String, dynamic> mealMap = meal.toMap();
    final db = await database;
    return await db.insert('meals', mealMap);
  }

  Future<List<HomeModel>> getMeals() async {
    final db = await database;
    List<Map<String, dynamic>> mealsJson = await db.query('meals');
    List<HomeModel> meals = mealsJson.map((meslaJson) {
      return HomeModel.fromMap(meslaJson);
    }).toList();
    return meals;
  }
}
