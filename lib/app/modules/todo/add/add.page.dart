import 'package:flutter/material.dart';
import 'package:flutter_modular_todo_list/app/modules/core/floor/DAOs/todo/todo.entity.dart';
import 'package:flutter_modular_todo_list/app/modules/todo/add/add.controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

class AddTodoPage extends ConsumerWidget {
  AddTodoPage({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                onChanged: (value) => ref
                    .read(addTodoNotifierProvider.notifier)
                    .nameOnChange(value),
                decoration: InputDecoration(
                    hintText: 'name',
                    errorText: ref
                        .watch(addTodoNotifierProvider)
                        .name
                        ?.error
                        ?.getMessage()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) => ref
                    .read(addTodoNotifierProvider.notifier)
                    .desOnChange(value),
                controller: desController,
                decoration: InputDecoration(
                    hintText: 'des',
                    errorText: ref
                        .watch(addTodoNotifierProvider)
                        .des
                        ?.error
                        ?.getMessage()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) => ref
                    .read(addTodoNotifierProvider.notifier)
                    .dateOnChange(value),
                controller: dateController,
                decoration: InputDecoration(
                    hintText: 'date',
                    errorText: ref
                        .watch(addTodoNotifierProvider)
                        .date
                        ?.error
                        ?.getMessage()),
              ),
            ),
            Consumer(
              builder: (context, ref, child) => ElevatedButton(
                  onPressed:ref.watch(addTodoNotifierProvider).status.isValid? () {
                      ref.read(addTodoProvider);

                  }:null,
                  child: const Text('add')),
            )
          ],
        ),
      ),
    );
  }
}
