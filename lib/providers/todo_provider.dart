import 'package:flutter/material.dart';
import 'package:simple_todo/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<TodoModel> _todos = [
    TodoModel(title: 'todo A'),
    TodoModel(title: 'todo B'),
    TodoModel(title: 'todo C'),
    TodoModel(title: 'todo D'),
  ];

  List<TodoModel> get todos => _todos;

  void addTodo(TodoModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(TodoModel todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
