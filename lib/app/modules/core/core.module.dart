import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_todo_list/app/modules/core/http/http.dart';

import 'floor/database.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) async {
          final database =
              await $FloorAppDatabase.databaseBuilder('TodoDb').build();
          return database;
        }, export: true),
        Bind.singleton((i) async {
          return http;
        }, export: true),
      ];
}
