import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_todo_list/app/modules/todo/home/home.controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.change_circle,
              color: Colors.teal,
              size: 35,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Modular.to.pushNamed('/add');
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: Consumer(
        builder: (context, watch, child) {
          final responseValue = watch.watch(todoListProvider);

         return ListView.builder(
           padding: const EdgeInsets.all(8),
           itemCount:responseValue.value?.length ,
           itemBuilder: (context, index) => Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(responseValue.value?[index].id.toString()??''),
               Text(responseValue.value?[index].name??''),
               Text(responseValue.value?[index].des??''),
               Text(responseValue.value?[index].date??''),
             ],
           ));
        },
      ),
    );
  }
}
