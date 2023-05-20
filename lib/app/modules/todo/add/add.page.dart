import 'package:flutter/material.dart';
import 'package:flutter_modular_todo_list/app/modules/core/floor/DAOs/todo/todo.entity.dart';
import 'package:flutter_modular_todo_list/app/modules/todo/add/add.controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTodoPage extends StatelessWidget {
   AddTodoPage({Key? key}) : super(key: key);
  final nameController=TextEditingController();
  final desController=TextEditingController();
  final dateController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: desController,
                decoration: const InputDecoration(hintText: 'des'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: dateController,
                decoration: const InputDecoration(hintText: 'date'),
              ),
            ),
            Consumer(
              builder: (context, ref, child) =>
                  ElevatedButton(onPressed: () {
                    ref.read(addTodoProvider(TodoEntity(nameController.text,desController.text,dateController.text)));
                  }, child: const Text('add')),
            )
          ],
        ),
      ),
    );
  }
}
