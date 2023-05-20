import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_todo_list/app/modules/todo/home/home.page.dart';
import 'package:flutter_modular_todo_list/app/modules/todo/todo.module.dart';

class HomeModule extends Module{

  @override
  List<Module> get imports => [
    TodoModule()
  ];
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child:(context, args) => HomePage())
  ];
}