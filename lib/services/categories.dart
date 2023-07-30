import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../constants/default_category_list.dart';
import '../models/category_model.dart';

class Categories {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE categories(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT NOT NULL,
      icon INTEGER NOT NULL,
      type TEXT NOT NULL,
      color INTEGER NOT NULL,
      canDelete INTEGER NOT NULL,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
""");

    // execute expenses category seeder
    for (final category in expensescategories) {
      final data = {
        'title': category.title,
        'icon': category.icon.codePoint,
        'type': 'expenses',
        'color': category.color.value,
        'canDelete': category.canDelete,
      };
      await database.insert('categories', data,
          conflictAlgorithm: sql.ConflictAlgorithm.replace);
    }

    // execute income category seeder
    for (final category in incomecategories) {
      final data = {
        'title': category.title,
        'icon': category.icon.codePoint,
        'type': 'income',
        'color': category.color.value,
        'canDelete': category.canDelete,
      };
      await database.insert('categories', data,
          conflictAlgorithm: sql.ConflictAlgorithm.replace);
    }
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('./cruddb.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<int> createCategory(
    String title,
    int icon,
    String type,
    int color,
  ) async {
    final db = await Categories.db();

    final data = {
      'title': title,
      'icon': icon,
      'type': type,
      'color': color,
      'canDelete': 1,
    };

    final id = await db.insert('categories', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> updateCategory(
    int id,
    String title,
    int icon,
    String type,
    int color,
  ) async {
    final db = await Categories.db();

    final data = {
      'title': title,
      'icon': icon,
      'type': type,
      'color': color,
    };

    final result = await db.update(
      'categories',
      data,
      where: "id = ?",
      whereArgs: [id],
    );
    return result;
  }

  static Future<List<CategoryModel>> getCategories() async {
    final db = await Categories.db();
    final List<Map<String, dynamic>> dbResult =
        await db.query('categories', orderBy: 'id');

    if (dbResult.isEmpty) {
      return [];
    } else {
      final result =
          dbResult.map((map) => CategoryModel.fromJson(map)).toList();

      return result;
    }
  }

  static Future<void> deleteCategory(int id) async {
    final db = await Categories.db();
    try {
      await db.delete(
        'categories',
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (err) {
      debugPrint('Something went wrong when deleting an item: $err');
    }
  }
}
