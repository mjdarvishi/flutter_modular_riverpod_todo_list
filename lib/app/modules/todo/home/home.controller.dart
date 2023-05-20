import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_todo_list/app/modules/core/floor/DAOs/todo/todo.doa.dart';
import 'package:flutter_modular_todo_list/app/modules/core/floor/DAOs/todo/todo.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoListProvider = FutureProvider<List<TodoEntity>>((ref) async {
  final todoDto = await Modular.getAsync<TodoDoa>();
  return todoDto.getTodoList();
});
