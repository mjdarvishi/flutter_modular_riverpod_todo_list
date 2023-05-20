import 'package:floor/floor.dart';
import 'package:flutter_modular_todo_list/app/modules/core/floor/DAOs/todo/todo.entity.dart';

// the queries are here
@dao
abstract class TodoDoa {
  @Query('SELECT * FROM TodoEntity ORDER BY id DESC')
  Future<List<TodoEntity>> getTodoList();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCustomer(TodoEntity article);

  @delete
  Future<void> deleteCustomer(TodoEntity customer);
}