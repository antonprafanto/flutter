# ✅ Todo List App - Complete Flutter Application

[![Flutter](https://img.shields.io/badge/Flutter-Todo_List-blue?style=for-the-badge&logo=flutter)](../../README.md)
[![Intermediate](https://img.shields.io/badge/Level-Intermediate-orange?style=for-the-badge)](../../README.md)

> 🎯 **Complete todo list application demonstrating CRUD operations, local storage, and professional Flutter development patterns**

## 📱 About This Project

Todo List App adalah aplikasi lengkap yang mendemonstrasikan:
- ✅ CRUD operations (Create, Read, Update, Delete)
- 💾 Local storage dengan SharedPreferences
- 🎨 Modern Material Design UI
- 🏗️ Clean code architecture
- 🔄 State management dengan Provider
- 🧪 Error handling dan validation
- 📱 Responsive design

## 📋 What You'll Learn

- ✅ **Data Modeling** - Membuat model data yang robust
- ✅ **Local Storage** - Menyimpan data di device
- ✅ **State Management** - Provider pattern implementation
- ✅ **Form Handling** - Input validation dan user interaction
- ✅ **List Management** - Dynamic lists dengan operations
- ✅ **Navigation** - Multi-screen navigation
- ✅ **Error Handling** - Graceful error management
- ✅ **Code Organization** - Professional project structure

## 🚀 Features

### ✨ **Core Features**
- ➕ Add new todos with title dan description
- ✅ Mark todos as completed/incomplete
- ✏️ Edit existing todos
- 🗑️ Delete todos with confirmation
- 💾 Automatic data persistence
- 🔍 Search dan filter todos

### 🎨 **UI/UX Features**
- 🌙 Beautiful Material Design interface
- ⚡ Smooth animations dan transitions
- 📱 Responsive layout untuk berbagai screen sizes
- 🎯 Intuitive user interactions
- 🔔 Visual feedback untuk user actions
- 🎨 Dynamic theming

### 🛠️ **Technical Features**
- 🏗️ Clean architecture pattern
- 📦 Modular code organization
- 🧪 Comprehensive error handling
- 💾 Efficient local storage
- 🔄 Real-time state updates
- 📊 Data validation

## 🚀 How to Run

1. **Navigate ke project directory:**
   ```bash
   cd projects/todo_list_app
   ```

2. **Get dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
todo_list_app/
├── lib/
│   ├── main.dart                   # Application entry point
│   ├── models/
│   │   └── todo_model.dart         # Todo data model
│   ├── services/
│   │   └── todo_service.dart       # Data persistence service
│   ├── screens/
│   │   ├── home_screen.dart        # Main todo list screen
│   │   └── add_edit_todo_screen.dart # Add/Edit todo screen
│   ├── widgets/
│   │   ├── todo_item.dart          # Individual todo item widget
│   │   ├── todo_list.dart          # Todo list widget
│   │   └── empty_state.dart        # Empty state widget
│   └── providers/
│       └── todo_provider.dart      # State management
├── pubspec.yaml                    # Dependencies
└── README.md                      # This file
```

## 💻 Implementation

### 1. Todo Model
```dart
// models/todo_model.dart
class Todo {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime? completedAt;

  Todo({
    required this.id,
    required this.title,
    this.description = '',
    this.isCompleted = false,
    required this.createdAt,
    this.completedAt,
  });

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'])
          : null,
    );
  }

  // Helper methods
  Todo copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? completedAt,
  }) {
    return Todo(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}
```

### 2. Data Service
```dart
// services/todo_service.dart
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
}
```

### 3. State Management
```dart
// providers/todo_provider.dart
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

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> _saveTodos() async {
    await _todoService.saveTodos(_todos);
  }
}
```

## 🎨 UI Components

### Home Screen
- 📋 List of todos dengan filtering
- 🔍 Search functionality
- ➕ Floating action button untuk add todo
- 📊 Statistics display (total, completed, pending)

### Add/Edit Screen
- 📝 Form untuk input title dan description
- ✅ Input validation
- 💾 Save/Cancel actions
- 🔄 Loading states

### Todo Item Widget
- ✅ Checkbox untuk completion toggle
- ✏️ Edit button
- 🗑️ Delete button dengan confirmation
- 🎨 Visual indicators untuk completion status

## 🎯 Learning Challenges

### **Challenge 1: Categories**
Add category support untuk todos (Work, Personal, Shopping, etc.)

### **Challenge 2: Due Dates**
Implement due dates dengan notification reminders

### **Challenge 3: Priority Levels**
Add priority levels (High, Medium, Low) dengan visual indicators

### **Challenge 4: Data Export**
Add functionality untuk export todos ke JSON file

### **Challenge 5: Dark Theme**
Implement dark theme toggle

## 🧪 Testing Scenarios

### **Manual Testing**
- ✅ Add todos dengan berbagai input combinations
- ✅ Edit existing todos
- ✅ Mark todos as complete/incomplete
- ✅ Delete todos dan verify confirmation
- ✅ Search functionality
- ✅ App restart data persistence
- ✅ Edge cases (empty input, special characters)

### **Unit Testing Examples**
```dart
test('Should add todo to list', () {
  final provider = TodoProvider();
  provider.addTodo('Test Todo');

  expect(provider.todos.length, 1);
  expect(provider.todos.first.title, 'Test Todo');
});

test('Should toggle todo completion', () {
  final todo = Todo(
    id: '1',
    title: 'Test',
    createdAt: DateTime.now(),
  );

  final completedTodo = todo.copyWith(isCompleted: true);
  expect(completedTodo.isCompleted, true);
});
```

## 📚 Key Learning Points

### **1. State Management**
- Provider pattern untuk global state
- ChangeNotifier untuk reactive updates
- Consumer widgets untuk UI updates

### **2. Data Persistence**
- SharedPreferences untuk simple storage
- JSON serialization/deserialization
- Error handling untuk storage operations

### **3. Code Organization**
- Separation of concerns
- Model-View-Provider architecture
- Reusable widget components

### **4. User Experience**
- Loading states dan error handling
- Form validation
- Confirmation dialogs
- Search dan filtering

## 🔗 Related Tutorials

- 📖 [Section 8: State Management](../../docs/08-state-management-sederhana.md)
- 📖 [Section 10: Working with Data](../../docs/10-working-with-data.md)
- 📖 [Section 12: Todo List Project Guide](../../docs/12-proyek-mini-todo-list.md)

## 🎊 Congratulations!

You've built a complete, production-ready Flutter application! 🎉

**Skills Mastered:**
- ✅ Complete CRUD operations
- ✅ Local data persistence
- ✅ Professional state management
- ✅ Form handling dan validation
- ✅ Error handling patterns
- ✅ Code organization principles

**Ready for Advanced Topics:**
- 🚀 Backend integration (Firebase, REST APIs)
- 🔄 Advanced state management (BLoC, Riverpod)
- 🧪 Testing strategies
- 📱 Platform-specific features
- 🌐 Web dan desktop deployment

---

**Next Steps:**
- Explore advanced state management patterns
- Add backend synchronization
- Implement offline-first architecture
- Build more complex applications

**Congratulations on completing your Flutter journey!** 🚀