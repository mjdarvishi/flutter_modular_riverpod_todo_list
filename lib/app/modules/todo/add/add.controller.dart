import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_todo_list/app/modules/core/floor/DAOs/todo/todo.doa.dart';
import 'package:flutter_modular_todo_list/app/modules/core/floor/DAOs/todo/todo.entity.dart';
import 'package:flutter_modular_todo_list/app/modules/todo/home/home.controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final addTodoProvider = Provider.family<void, TodoEntity>(
  (ref, todo) async {
    final todoDto = await Modular.getAsync<TodoDoa>();
     todoDto.insertCustomer(todo);
     ref.invalidate(todoListProvider);
  },
);
