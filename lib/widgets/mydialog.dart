import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/config.dart';
import 'package:simple_todo/models/todo.dart';
import 'package:simple_todo/providers/todo_provider.dart';

class Mydialog extends StatelessWidget {
  const Mydialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, data, widget) {
      var text = '';
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 248, 232, 116),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text('Add a ToDo'),
        content: TextField(
          cursorColor: primaryYellow,
          onChanged: (value) {
            text = value;
          },
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
          ),
        ),
        actions: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: primaryYellow,
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.transparent),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: primaryYellow,
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.transparent),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: () {
              if (text.trim().isNotEmpty) {
                FocusScope.of(context).unfocus();
                data.addTodo(TodoModel(title: text));
                Navigator.of(context).pop();
              }
            },
            child: const Text('Persist'),
          ),
        ],
      );
    });
  }
}
