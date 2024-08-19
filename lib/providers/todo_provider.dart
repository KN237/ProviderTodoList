import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/models/todo.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]);

  void addTodo(TodoModel todo) {
    state = [...state, todo];
  }

  void removeTodo(TodoModel todo) {
    state = state.where((elt) {
      return todo.title != elt.title;
    }).toList();
  }

  void check(TodoModel todo) {
    todo.status = !todo.status;
  }
}

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<TodoModel>>((ref) {
  return TodoNotifier();
});
