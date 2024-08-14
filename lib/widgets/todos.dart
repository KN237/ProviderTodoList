import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/config.dart';
import 'package:simple_todo/providers/todo_provider.dart';

class Todos extends StatelessWidget {
  const Todos({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (ctx, value, widget) {
      if (value.todos.isEmpty) {
        return const Center(
          child: Text('No Data Found'),
        );
      } else {
        return ListView.builder(
          itemCount: value.todos.length,
          itemBuilder: (_, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (context) {
                value.removeTodo(value.todos[index]);
              },
              direction: DismissDirection.endToStart,
              background: Container(
                height: 80,
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFE4A49),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              child: Container(
                height: 80,
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                decoration: BoxDecoration(
                  color: primaryYellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Checkbox(
                        activeColor: const Color.fromARGB(255, 105, 94, 9),
                        value: value.todos[index].status,
                        onChanged: (newValue) {
                          value.todos[index].status = newValue!;
                        }),
                    Text(value.todos[index].title),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }
}
