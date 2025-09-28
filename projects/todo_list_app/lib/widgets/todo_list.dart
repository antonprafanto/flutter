import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  const TodoList({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sort todos: incomplete first, then completed
    final sortedTodos = [...todos]..sort((a, b) {
      if (a.isCompleted == b.isCompleted) {
        // If both have same completion status, sort by creation date (newest first)
        return b.createdAt.compareTo(a.createdAt);
      }
      // Incomplete todos first
      return a.isCompleted ? 1 : -1;
    });

    return ListView.builder(
      padding: EdgeInsets.only(top: 8, bottom: 80), // Bottom padding for FAB
      itemCount: sortedTodos.length,
      itemBuilder: (context, index) {
        final todo = sortedTodos[index];

        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          child: TodoItem(todo: todo),
        );
      },
    );
  }
}