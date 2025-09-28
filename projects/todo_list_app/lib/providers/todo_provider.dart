import 'package:flutter/foundation.dart';
import '../models/todo_model.dart';
import '../services/todo_service.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];
  final TodoService _todoService = TodoService();
  bool _isLoading = false;
  String _searchQuery = '';

  List<Todo> get todos {
    if (_searchQuery.isEmpty) {
      return _todos;
    }
    return _todos.where((todo) {
      return todo.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             todo.description.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  List<Todo> get completedTodos => _todos.where((todo) => todo.isCompleted).toList();
  List<Todo> get incompleteTodos => _todos.where((todo) => !todo.isCompleted).toList();

  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery;

  int get totalTodos => _todos.length;
  int get completedCount => completedTodos.length;
  int get incompleteCount => incompleteTodos.length;

  Future<void> loadTodos() async {
    _isLoading = true;
    notifyListeners();

    try {
      _todos = await _todoService.loadTodos();
    } catch (e) {
      print('Error loading todos: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTodo(String title, {String description = ''}) async {
    if (title.trim().isEmpty) return;

    final todo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title.trim(),
      description: description.trim(),
      createdAt: DateTime.now(),
    );

    _todos.add(todo);
    await _saveTodos();
    notifyListeners();
  }

  Future<void> updateTodo(String id, {String? title, String? description}) async {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index == -1) return;

    _todos[index] = _todos[index].copyWith(
      title: title,
      description: description,
    );

    await _saveTodos();
    notifyListeners();
  }

  Future<void> toggleTodoCompletion(String id) async {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index == -1) return;

    final todo = _todos[index];
    _todos[index] = todo.copyWith(
      isCompleted: !todo.isCompleted,
      completedAt: !todo.isCompleted ? DateTime.now() : null,
    );

    await _saveTodos();
    notifyListeners();
  }

  Future<void> deleteTodo(String id) async {
    _todos.removeWhere((todo) => todo.id == id);
    await _saveTodos();
    notifyListeners();
  }

  Future<void> deleteAllCompleted() async {
    _todos.removeWhere((todo) => todo.isCompleted);
    await _saveTodos();
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> _saveTodos() async {
    await _todoService.saveTodos(_todos);
  }
}