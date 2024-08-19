import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/config.dart';
import 'package:simple_todo/providers/todo_provider.dart';

class Todos extends ConsumerStatefulWidget {
  const Todos({super.key});

  @override
  ConsumerState<Todos> createState() {
    return _TodosState();
  }
}

class _TodosState extends ConsumerState<Todos> {
  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoProvider);
    if (todos.isEmpty) {
      return const Center(
        child: Text('No Data Found'),
      );
    } else {
      return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (_, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (_) {
              ref.read(todoProvider.notifier).removeTodo(todos[index]);
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
                      value: todos[index].status,
                      onChanged: (newValue) {
                        setState(() {
                          ref.read(todoProvider)[index].status = newValue!;
                        });
                      }),
                  Text(todos[index].title),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
