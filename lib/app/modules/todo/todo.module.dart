import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_todo_list/app/modules/core/core.module.dart';
import 'package:flutter_modular_todo_list/app/modules/core/floor/database.dart';
import 'package:flutter_modular_todo_list/app/modules/todo/add/add.module.dart';
import 'package:flutter_modular_todo_list/app/modules/todo/home/home.module.dart';

class TodoModule extends Module {
  @override
  List<Module> get imports => [
    CoreModule()
  ];

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) async {
          final floor = await Modular.getAsync<AppDatabase>();
          return floor.todoDao;
        }),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/add', module: AddModule())
      ];
}
