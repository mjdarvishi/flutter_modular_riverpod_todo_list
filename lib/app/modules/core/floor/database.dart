import 'package:floor/floor.dart';
import 'package:flutter_modular_todo_list/app/modules/core/floor/DAOs/todo/todo.doa.dart';
import 'package:flutter_modular_todo_list/app/modules/core/floor/DAOs/todo/todo.entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'database.g.dart';

//configuration of floor
@Database(version: 1, entities: [TodoEntity])
abstract class AppDatabase extends FloorDatabase {
  TodoDoa get todoDao;
}