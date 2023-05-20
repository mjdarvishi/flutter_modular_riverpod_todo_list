import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_todo_list/app/modules/todo/todo.module.dart';


class AppModule extends Module  {
  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/',module: TodoModule()),
  ];
}