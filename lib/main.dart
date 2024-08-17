import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/config.dart';
import 'package:simple_todo/providers/todo_provider.dart';
import 'package:simple_todo/widgets/mydialog.dart';
import 'package:simple_todo/widgets/todos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Todo(),
      ),
    );
  }
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryYellow,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ToDo',
          style: TextStyle(),
        ),
        backgroundColor: primaryYellow,
      ),
      body: const Todos(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const Mydialog(),
          );
        },
        elevation: 0,
        backgroundColor: primaryYellow,
        foregroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Text(
          '+',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
