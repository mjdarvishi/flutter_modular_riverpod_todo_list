import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_todo_list/app/modules/core/floor/DAOs/todo/todo.doa.dart';
import 'package:flutter_modular_todo_list/app/modules/core/floor/DAOs/todo/todo.entity.dart';
import 'package:flutter_modular_todo_list/app/modules/todo/add/add.state.dart';
import 'package:flutter_modular_todo_list/app/modules/todo/home/home.controller.dart';
import 'package:flutter_modular_todo_list/app/utils/validation/formz/date_formz.dart';
import 'package:flutter_modular_todo_list/app/utils/validation/formz/des_formz.dart';
import 'package:flutter_modular_todo_list/app/utils/validation/formz/name_formz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final addTodoProvider = Provider(
  (ref) async {
    final todoDto = await Modular.getAsync<TodoDoa>();
    todoDto.insertCustomer(ref.read(addTodoNotifierProvider.notifier).getTodoEntity);
    ref.invalidate(todoListProvider);
  },
);

final addTodoNotifierProvider =
    StateNotifierProvider<AddTodoController, AddTodoState>(
        (ref) => AddTodoController());

class AddTodoController extends StateNotifier<AddTodoState> {
  AddTodoController() : super(AddTodoState());

  FormzStatus validate({NameFormz? name, DesFormz? des, DateFormz? date}) {
    return Formz.validate([
      name ?? state.name ?? const NameFormz.pure(),
      des ?? state.des ?? const DesFormz.pure(),
      date ?? state.date ?? const DateFormz.pure(),
    ]);
  }

  void nameOnChange(String value) {
    final name = NameFormz.dirty(value);
    state = state.copyWith(name: name, status: validate(name: name));
  }

  void desOnChange(String value) {
    final des = DesFormz.dirty(value);
    state = state.copyWith(des: des, status: validate(des: des));
  }

  void dateOnChange(String value) {
    final date = DateFormz.dirty(value);
    state = state.copyWith(date: date, status: validate(date: date));
  }

  TodoEntity get getTodoEntity{
    return TodoEntity(state.name!.value, state.des!.value, state.date!.value);
  }
}
