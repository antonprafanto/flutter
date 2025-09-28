import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo_model.dart';

class TodoService {
  static const String _todosKey = 'todos';

  Future<List<Todo>> loadTodos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todosJson = prefs.getString(_todosKey);

      if (todosJson == null) return [];

      final List<dynamic> todosList = json.decode(todosJson);
      return todosList.map((json) => Todo.fromJson(json)).toList();
    } catch (e) {
      print('Error loading todos: $e');
      return [];
    }
  }

  Future<bool> saveTodos(List<Todo> todos) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todosJson = json.encode(todos.map((todo) => todo.toJson()).toList());
      return await prefs.setString(_todosKey, todosJson);
    } catch (e) {
      print('Error saving todos: $e');
      return false;
    }
  }

  Future<bool> clearAllTodos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_todosKey);
    } catch (e) {
      print('Error clearing todos: $e');
      return false;
    }
  }
}