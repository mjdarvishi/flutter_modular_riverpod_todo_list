import 'package:flutter_modular_todo_list/app/modules/core/floor/DAOs/todo/todo.entity.dart';
import 'package:flutter_modular_todo_list/app/utils/validation/formz/date_formz.dart';
import 'package:flutter_modular_todo_list/app/utils/validation/formz/des_formz.dart';
import 'package:flutter_modular_todo_list/app/utils/validation/formz/name_formz.dart';
import 'package:formz/formz.dart';


class AddTodoState {
  NameFormz? name;
  DesFormz? des;
  DateFormz? date;
  FormzStatus status;
  AddTodoState({this.name, this.des, this.date, this.status=FormzStatus.pure});

  AddTodoState copyWith({NameFormz? name, DesFormz? des, DateFormz? date,FormzStatus ?status}) {
    return AddTodoState(
        name: name ?? this.name, des: des ?? this.des, date: date ?? this.date,status:status??this.status);
  }
}
