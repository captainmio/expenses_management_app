import 'package:sqflite/sqflite.dart' as sql;

class Categories {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE categories(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT NOT NULL,
      icon TEXT NOT NULL,
      type TEXT NOT NULL,
      color TEXT NOT NULL,
      can_delete INTEGER NOT NULL,
      created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('./cruddb.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<int> createCategory(
    String name,
    int icon,
    String type,
    int color,
  ) async {
    final db = await Categories.db();

    final data = {
      'name': name,
      'icon': icon,
      'type': type,
      'color': color,
      'can_delete': 1,
    };

    final id = await db.insert('categories', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
}
