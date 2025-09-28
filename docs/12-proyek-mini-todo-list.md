# 📝 Section 12: Proyek Todo List App

<div align="center">

![Flutter Project](https://img.shields.io/badge/Flutter-Project_Complete-blue?style=for-the-badge&logo=flutter)
![Difficulty](https://img.shields.io/badge/Level-Advanced-red?style=for-the-badge)
![Duration](https://img.shields.io/badge/Durasi-6--8_Jam-green?style=for-the-badge)

*Membangun aplikasi Todo List lengkap dengan semua fitur modern - dari konsep hingga deployment*

</div>

---

## 🎯 Tujuan Pembelajaran

Dalam proyek ini, Anda akan menggabungkan semua pengetahuan Flutter untuk membangun aplikasi Todo List yang lengkap dengan:

- ✅ State management dengan Provider/Riverpod
- ✅ Local database dengan SQLite
- ✅ Custom animations dan transitions
- ✅ Dark/Light theme switching
- ✅ Form handling dan validation
- ✅ Data persistence
- ✅ Testing comprehensive
- ✅ Performance optimization

---

> 💡 **Cara menjalankan code examples:**
> Setiap contoh kode di section ini sudah lengkap dan siap dijalankan. Copy seluruh kode (termasuk import dan main function) ke dalam file dart baru atau ganti class name sesuai kebutuhan.
>
> **Template wrapper untuk semua examples:**
> ```dart
> import 'package:flutter/material.dart';
>
> void main() {
>   runApp(MyApp());
> }
>
> class MyApp extends StatelessWidget {
>   @override
>   Widget build(BuildContext context) {
>     return MaterialApp(
>       title: 'Todo List App',
>       theme: ThemeData(
>         colorSchemeSeed: Colors.indigo,
>         useMaterial3: true,
>         brightness: Brightness.light,
>       ),
>       darkTheme: ThemeData(
>         colorSchemeSeed: Colors.blue,
>         useMaterial3: true,
>         brightness: Brightness.dark,
>       ),
>       home: YourWidgetName(), // ← Ganti dengan nama widget contoh
>       debugShowCheckedModeBanner: false,
>     );
>   }
> }
> ```

## 📚 Daftar Isi

1. [Project Overview & Planning](#project-overview--planning)
2. [Project Setup & Dependencies](#project-setup--dependencies)
3. [Database Design & Models](#database-design--models)
4. [State Management Architecture](#state-management-architecture)
5. [UI Design & Layout](#ui-design--layout)
6. [Core Functionality Implementation](#core-functionality-implementation)
7. [Advanced Features](#advanced-features)
8. [Theming & Customization](#theming--customization)
9. [Testing Implementation](#testing-implementation)
10. [Performance Optimization](#performance-optimization)
11. [Build & Deployment](#build--deployment)
12. [Project Review & Next Steps](#project-review--next-steps)

---

## 1. Project Overview & Planning

### 🎯 App Features Specification

```dart
/*
📱 Todo List App - Feature Specifications

🏠 Core Features:
- ✅ Add, edit, delete todos
- ✅ Mark todos as complete/incomplete
- ✅ Categories and priority levels
- ✅ Due dates and reminders
- ✅ Search and filtering
- ✅ Statistics dashboard

🎨 UI/UX Features:
- ✅ Dark/Light theme toggle
- ✅ Custom animations
- ✅ Responsive design
- ✅ Accessibility support
- ✅ Gesture controls (swipe actions)

💾 Data Features:
- ✅ Local SQLite database
- ✅ Data backup/restore
- ✅ Offline functionality
- ✅ Data persistence

⚙️ Advanced Features:
- ✅ Notification system
- ✅ Widget integration
- ✅ Export to different formats
- ✅ Settings and preferences
*/
```

### 🏗️ Project Architecture

```dart
/*
📁 Project Structure:

lib/
├── main.dart
├── app/
│   ├── app.dart                 # Main app configuration
│   ├── router.dart             # Navigation setup
│   └── theme.dart              # Theme configuration
├── core/
│   ├── constants/              # App constants
│   ├── utils/                  # Utility functions
│   ├── extensions/             # Dart extensions
│   └── services/               # Core services
├── data/
│   ├── models/                 # Data models
│   ├── repositories/           # Data repositories
│   ├── datasources/           # Local/Remote data sources
│   └── database/              # SQLite database
├── domain/
│   ├── entities/              # Business entities
│   ├── repositories/          # Repository interfaces
│   └── usecases/             # Business use cases
├── presentation/
│   ├── pages/                # UI pages/screens
│   ├── widgets/              # Custom widgets
│   ├── providers/            # State management
│   └── themes/               # UI themes
└── tests/
    ├── unit/                 # Unit tests
    ├── widget/               # Widget tests
    └── integration/          # Integration tests
*/
```

### 📋 Development Phases

```dart
/*
🚀 Development Roadmap:

Phase 1: Foundation (2 hours)
- Project setup and dependencies
- Database schema and models
- Basic app structure

Phase 2: Core Features (3 hours)
- Todo CRUD operations
- Categories and priorities
- Basic UI implementation

Phase 3: Advanced Features (2 hours)
- Search and filtering
- Due dates and notifications
- Statistics dashboard

Phase 4: Polish & Testing (1 hour)
- UI polish and animations
- Testing implementation
- Performance optimization

Phase 5: Deployment (30 minutes)
- Build optimization
- App signing
- Release preparation
*/
```

---

## 2. Project Setup & Dependencies

### 📦 Dependencies Configuration

```yaml
# pubspec.yaml
name: todo_list_app
description: A comprehensive Todo List app built with Flutter

version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: ">=3.10.0"

dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_riverpod: ^2.4.9
  riverpod_annotation: ^2.3.3

  # Database
  sqflite: ^2.3.0
  path: ^1.8.3

  # UI Components
  cupertino_icons: ^1.0.2
  google_fonts: ^6.1.0
  flutter_staggered_animations: ^1.1.1
  lottie: ^2.7.0

  # Utilities
  intl: ^0.18.1
  uuid: ^4.1.0
  shared_preferences: ^2.2.2

  # Notifications
  flutter_local_notifications: ^16.3.0
  timezone: ^0.9.2

  # File handling
  path_provider: ^2.1.1
  permission_handler: ^11.1.0

  # Networking (for future API integration)
  dio: ^5.3.2
  json_annotation: ^4.8.1

dev_dependencies:
  flutter_test:
    sdk: flutter

  # Code generation
  build_runner: ^2.4.7
  riverpod_generator: ^2.3.9
  json_serializable: ^6.7.1

  # Testing
  mockito: ^5.4.2
  integration_test:
    sdk: flutter

  # Code quality
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true

  assets:
    - assets/images/
    - assets/animations/
    - assets/icons/

  fonts:
    - family: CustomIcons
      fonts:
        - asset: assets/fonts/custom_icons.ttf
```

### 🏗️ Project Structure Setup

```bash
# Create project structure
mkdir -p lib/{app,core/{constants,utils,extensions,services},data/{models,repositories,datasources,database},domain/{entities,repositories,usecases},presentation/{pages,widgets,providers,themes}}

# Create assets structure
mkdir -p assets/{images,animations,icons,fonts}

# Create test structure
mkdir -p test/{unit,widget,integration}
```

### ⚙️ Core Configuration Files

```dart
// lib/core/constants/app_constants.dart
class AppConstants {
  // App Info
  static const String appName = 'Todo List';
  static const String appVersion = '1.0.0';

  // Database
  static const String databaseName = 'todo_database.db';
  static const int databaseVersion = 1;

  // Preferences Keys
  static const String themeKey = 'theme_mode';
  static const String firstLaunchKey = 'first_launch';
  static const String languageKey = 'language';

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  // Todo Categories
  static const List<String> defaultCategories = [
    'Personal',
    'Work',
    'Shopping',
    'Health',
    'Education',
    'Travel',
  ];

  // Priority Levels
  static const List<String> priorityLevels = [
    'Low',
    'Medium',
    'High',
    'Urgent',
  ];
}

// lib/core/constants/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF6366F1);
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4F46E5);

  // Secondary Colors
  static const Color secondary = Color(0xFF06B6D4);
  static const Color secondaryLight = Color(0xFF67E8F9);
  static const Color secondaryDark = Color(0xFF0891B2);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Priority Colors
  static const Color priorityLow = Color(0xFF6B7280);
  static const Color priorityMedium = Color(0xFFF59E0B);
  static const Color priorityHigh = Color(0xFFEF4444);
  static const Color priorityUrgent = Color(0xFF7C2D12);

  // Category Colors
  static const List<Color> categoryColors = [
    Color(0xFF6366F1), // Personal - Purple
    Color(0xFF06B6D4), // Work - Cyan
    Color(0xFF10B981), // Shopping - Green
    Color(0xFFEF4444), // Health - Red
    Color(0xFF8B5CF6), // Education - Violet
    Color(0xFFF59E0B), // Travel - Amber
  ];

  // Background Colors
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E293B);

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF1E293B);
  static const Color textPrimaryDark = Color(0xFFF1F5F9);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
}
```

---

## 3. Database Design & Models

### 🗄️ Database Schema

```dart
// lib/data/database/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../core/constants/app_constants.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, AppConstants.databaseName);

    return await openDatabase(
      path,
      version: AppConstants.databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create categories table
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL UNIQUE,
        color INTEGER NOT NULL,
        icon TEXT,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL
      )
    ''');

    // Create todos table
    await db.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        is_completed INTEGER NOT NULL DEFAULT 0,
        priority INTEGER NOT NULL DEFAULT 1,
        category_id INTEGER,
        due_date INTEGER,
        reminder_date INTEGER,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL,
        completed_at INTEGER,
        FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE SET NULL
      )
    ''');

    // Create subtasks table
    await db.execute('''
      CREATE TABLE subtasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        todo_id INTEGER NOT NULL,
        title TEXT NOT NULL,
        is_completed INTEGER NOT NULL DEFAULT 0,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL,
        FOREIGN KEY (todo_id) REFERENCES todos (id) ON DELETE CASCADE
      )
    ''');

    // Insert default categories
    await _insertDefaultCategories(db);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle database migrations here
    if (oldVersion < 2) {
      // Add new columns or tables
    }
  }

  Future<void> _insertDefaultCategories(Database db) async {
    final categories = [
      {'name': 'Personal', 'color': 0xFF6366F1, 'icon': 'person'},
      {'name': 'Work', 'color': 0xFF06B6D4, 'icon': 'work'},
      {'name': 'Shopping', 'color': 0xFF10B981, 'icon': 'shopping_cart'},
      {'name': 'Health', 'color': 0xFFEF4444, 'icon': 'favorite'},
      {'name': 'Education', 'color': 0xFF8B5CF6, 'icon': 'school'},
      {'name': 'Travel', 'color': 0xFFF59E0B, 'icon': 'flight'},
    ];

    final now = DateTime.now().millisecondsSinceEpoch;

    for (final category in categories) {
      await db.insert('categories', {
        ...category,
        'created_at': now,
        'updated_at': now,
      });
    }
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
```

### 📊 Data Models

```dart
// lib/data/models/todo_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  final int? id;
  final String title;
  final String? description;
  final bool isCompleted;
  final int priority; // 1: Low, 2: Medium, 3: High, 4: Urgent
  final int? categoryId;
  final DateTime? dueDate;
  final DateTime? reminderDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? completedAt;
  final List<SubtaskModel>? subtasks;

  TodoModel({
    this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    this.priority = 1,
    this.categoryId,
    this.dueDate,
    this.reminderDate,
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
    this.subtasks,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['is_completed'] == 1,
      priority: map['priority'],
      categoryId: map['category_id'],
      dueDate: map['due_date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['due_date'])
          : null,
      reminderDate: map['reminder_date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['reminder_date'])
          : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
      completedAt: map['completed_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['completed_at'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'is_completed': isCompleted ? 1 : 0,
      'priority': priority,
      'category_id': categoryId,
      'due_date': dueDate?.millisecondsSinceEpoch,
      'reminder_date': reminderDate?.millisecondsSinceEpoch,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
      'completed_at': completedAt?.millisecondsSinceEpoch,
    };
  }

  TodoModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    int? priority,
    int? categoryId,
    DateTime? dueDate,
    DateTime? reminderDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? completedAt,
    List<SubtaskModel>? subtasks,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      categoryId: categoryId ?? this.categoryId,
      dueDate: dueDate ?? this.dueDate,
      reminderDate: reminderDate ?? this.reminderDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: completedAt ?? this.completedAt,
      subtasks: subtasks ?? this.subtasks,
    );
  }

  // Helper getters
  String get priorityText {
    switch (priority) {
      case 1:
        return 'Low';
      case 2:
        return 'Medium';
      case 3:
        return 'High';
      case 4:
        return 'Urgent';
      default:
        return 'Unknown';
    }
  }

  Color get priorityColor {
    switch (priority) {
      case 1:
        return AppColors.priorityLow;
      case 2:
        return AppColors.priorityMedium;
      case 3:
        return AppColors.priorityHigh;
      case 4:
        return AppColors.priorityUrgent;
      default:
        return AppColors.priorityLow;
    }
  }

  bool get isOverdue {
    if (dueDate == null || isCompleted) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  bool get isDueToday {
    if (dueDate == null) return false;
    final now = DateTime.now();
    return dueDate!.year == now.year &&
        dueDate!.month == now.month &&
        dueDate!.day == now.day;
  }

  int get completedSubtasksCount {
    if (subtasks == null) return 0;
    return subtasks!.where((subtask) => subtask.isCompleted).length;
  }

  double get completionPercentage {
    if (subtasks == null || subtasks!.isEmpty) {
      return isCompleted ? 1.0 : 0.0;
    }
    return completedSubtasksCount / subtasks!.length;
  }

  @override
  String toString() {
    return 'TodoModel{id: $id, title: $title, isCompleted: $isCompleted}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

// lib/data/models/category_model.dart
@JsonSerializable()
class CategoryModel {
  final int? id;
  final String name;
  final int color;
  final String? icon;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryModel({
    this.id,
    required this.name,
    required this.color,
    this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
      color: map['color'],
      icon: map['icon'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'color': color,
      'icon': icon,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
    };
  }

  CategoryModel copyWith({
    int? id,
    String? name,
    int? color,
    String? icon,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Color get colorValue => Color(color);

  @override
  String toString() => 'CategoryModel{id: $id, name: $name}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

// lib/data/models/subtask_model.dart
@JsonSerializable()
class SubtaskModel {
  final int? id;
  final int todoId;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubtaskModel({
    this.id,
    required this.todoId,
    required this.title,
    this.isCompleted = false,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubtaskModel.fromJson(Map<String, dynamic> json) =>
      _$SubtaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubtaskModelToJson(this);

  factory SubtaskModel.fromMap(Map<String, dynamic> map) {
    return SubtaskModel(
      id: map['id'],
      todoId: map['todo_id'],
      title: map['title'],
      isCompleted: map['is_completed'] == 1,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'todo_id': todoId,
      'title': title,
      'is_completed': isCompleted ? 1 : 0,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
    };
  }

  SubtaskModel copyWith({
    int? id,
    int? todoId,
    String? title,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SubtaskModel(
      id: id ?? this.id,
      todoId: todoId ?? this.todoId,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() => 'SubtaskModel{id: $id, title: $title}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubtaskModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
```

---

## 4. State Management Architecture

### 🎛️ Riverpod Providers Setup

```dart
// lib/presentation/providers/todo_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/todo_repository.dart';
import '../../data/models/todo_model.dart';

part 'todo_provider.g.dart';

// Todo Repository Provider
@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) {
  return TodoRepository();
}

// All Todos Provider
@riverpod
class TodoList extends _$TodoList {
  @override
  Future<List<TodoModel>> build() async {
    final repository = ref.read(todoRepositoryProvider);
    return await repository.getAllTodos();
  }

  Future<void> addTodo(TodoModel todo) async {
    state = const AsyncValue.loading();

    try {
      final repository = ref.read(todoRepositoryProvider);
      await repository.createTodo(todo);

      // Refresh the list
      ref.invalidateSelf();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateTodo(TodoModel todo) async {
    try {
      final repository = ref.read(todoRepositoryProvider);
      await repository.updateTodo(todo);

      // Update state optimistically
      state.whenData((todos) {
        state = AsyncValue.data(
          todos.map((t) => t.id == todo.id ? todo : t).toList(),
        );
      });
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteTodo(int todoId) async {
    try {
      final repository = ref.read(todoRepositoryProvider);
      await repository.deleteTodo(todoId);

      // Update state optimistically
      state.whenData((todos) {
        state = AsyncValue.data(
          todos.where((t) => t.id != todoId).toList(),
        );
      });
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> toggleTodoCompletion(int todoId) async {
    try {
      state.whenData((todos) {
        final todoIndex = todos.indexWhere((t) => t.id == todoId);
        if (todoIndex != -1) {
          final todo = todos[todoIndex];
          final updatedTodo = todo.copyWith(
            isCompleted: !todo.isCompleted,
            completedAt: !todo.isCompleted ? DateTime.now() : null,
            updatedAt: DateTime.now(),
          );

          // Update state optimistically
          final updatedTodos = [...todos];
          updatedTodos[todoIndex] = updatedTodo;
          state = AsyncValue.data(updatedTodos);

          // Update in database
          updateTodo(updatedTodo);
        }
      });
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// Filtered Todos Provider
@riverpod
class FilteredTodos extends _$FilteredTodos {
  @override
  List<TodoModel> build(TodoFilter filter) {
    final asyncTodos = ref.watch(todoListProvider);

    return asyncTodos.when(
      data: (todos) => _filterTodos(todos, filter),
      loading: () => [],
      error: (_, __) => [],
    );
  }

  List<TodoModel> _filterTodos(List<TodoModel> todos, TodoFilter filter) {
    var filteredTodos = todos;

    // Filter by completion status
    switch (filter.status) {
      case TodoStatus.pending:
        filteredTodos = filteredTodos.where((t) => !t.isCompleted).toList();
        break;
      case TodoStatus.completed:
        filteredTodos = filteredTodos.where((t) => t.isCompleted).toList();
        break;
      case TodoStatus.all:
        break;
    }

    // Filter by category
    if (filter.categoryId != null) {
      filteredTodos = filteredTodos
          .where((t) => t.categoryId == filter.categoryId)
          .toList();
    }

    // Filter by priority
    if (filter.priority != null) {
      filteredTodos = filteredTodos
          .where((t) => t.priority == filter.priority)
          .toList();
    }

    // Filter by search query
    if (filter.searchQuery != null && filter.searchQuery!.isNotEmpty) {
      final query = filter.searchQuery!.toLowerCase();
      filteredTodos = filteredTodos.where((t) =>
          t.title.toLowerCase().contains(query) ||
          (t.description?.toLowerCase().contains(query) ?? false)).toList();
    }

    // Filter by due date
    if (filter.dueDateFilter != null) {
      final now = DateTime.now();
      switch (filter.dueDateFilter!) {
        case DueDateFilter.today:
          filteredTodos = filteredTodos.where((t) => t.isDueToday).toList();
          break;
        case DueDateFilter.overdue:
          filteredTodos = filteredTodos.where((t) => t.isOverdue).toList();
          break;
        case DueDateFilter.thisWeek:
          final weekFromNow = now.add(Duration(days: 7));
          filteredTodos = filteredTodos.where((t) =>
              t.dueDate != null &&
              t.dueDate!.isAfter(now) &&
              t.dueDate!.isBefore(weekFromNow)).toList();
          break;
      }
    }

    // Sort todos
    switch (filter.sortBy) {
      case SortBy.createdDate:
        filteredTodos.sort((a, b) => filter.sortOrder == SortOrder.ascending
            ? a.createdAt.compareTo(b.createdAt)
            : b.createdAt.compareTo(a.createdAt));
        break;
      case SortBy.dueDate:
        filteredTodos.sort((a, b) {
          if (a.dueDate == null && b.dueDate == null) return 0;
          if (a.dueDate == null) return 1;
          if (b.dueDate == null) return -1;
          return filter.sortOrder == SortOrder.ascending
              ? a.dueDate!.compareTo(b.dueDate!)
              : b.dueDate!.compareTo(a.dueDate!);
        });
        break;
      case SortBy.priority:
        filteredTodos.sort((a, b) => filter.sortOrder == SortOrder.ascending
            ? a.priority.compareTo(b.priority)
            : b.priority.compareTo(a.priority));
        break;
      case SortBy.title:
        filteredTodos.sort((a, b) => filter.sortOrder == SortOrder.ascending
            ? a.title.compareTo(b.title)
            : b.title.compareTo(a.title));
        break;
    }

    return filteredTodos;
  }
}

// Todo Filter State Provider
@riverpod
class TodoFilterState extends _$TodoFilterState {
  @override
  TodoFilter build() {
    return TodoFilter();
  }

  void updateFilter(TodoFilter filter) {
    state = filter;
  }

  void setStatus(TodoStatus status) {
    state = state.copyWith(status: status);
  }

  void setCategory(int? categoryId) {
    state = state.copyWith(categoryId: categoryId);
  }

  void setPriority(int? priority) {
    state = state.copyWith(priority: priority);
  }

  void setSearchQuery(String? query) {
    state = state.copyWith(searchQuery: query);
  }

  void setDueDateFilter(DueDateFilter? filter) {
    state = state.copyWith(dueDateFilter: filter);
  }

  void setSortBy(SortBy sortBy) {
    state = state.copyWith(sortBy: sortBy);
  }

  void setSortOrder(SortOrder order) {
    state = state.copyWith(sortOrder: order);
  }

  void reset() {
    state = TodoFilter();
  }
}

// Statistics Provider
@riverpod
class TodoStatistics extends _$TodoStatistics {
  @override
  TodoStats build() {
    final asyncTodos = ref.watch(todoListProvider);

    return asyncTodos.when(
      data: (todos) => _calculateStats(todos),
      loading: () => TodoStats.empty(),
      error: (_, __) => TodoStats.empty(),
    );
  }

  TodoStats _calculateStats(List<TodoModel> todos) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final thisWeek = today.subtract(Duration(days: today.weekday - 1));
    final thisMonth = DateTime(now.year, now.month, 1);

    return TodoStats(
      totalTodos: todos.length,
      completedTodos: todos.where((t) => t.isCompleted).length,
      pendingTodos: todos.where((t) => !t.isCompleted).length,
      overdueTodos: todos.where((t) => t.isOverdue).length,
      todayTodos: todos.where((t) => t.isDueToday).length,
      thisWeekTodos: todos.where((t) =>
          t.createdAt.isAfter(thisWeek) && t.createdAt.isBefore(today.add(Duration(days: 1)))).length,
      thisMonthTodos: todos.where((t) =>
          t.createdAt.isAfter(thisMonth) && t.createdAt.isBefore(today.add(Duration(days: 1)))).length,
      completionRate: todos.isEmpty ? 0.0 : todos.where((t) => t.isCompleted).length / todos.length,
      categoryStats: _calculateCategoryStats(todos),
      priorityStats: _calculatePriorityStats(todos),
      weeklyCompletionTrend: _calculateWeeklyTrend(todos),
    );
  }

  Map<int, int> _calculateCategoryStats(List<TodoModel> todos) {
    final stats = <int, int>{};
    for (final todo in todos) {
      if (todo.categoryId != null) {
        stats[todo.categoryId!] = (stats[todo.categoryId!] ?? 0) + 1;
      }
    }
    return stats;
  }

  Map<int, int> _calculatePriorityStats(List<TodoModel> todos) {
    final stats = <int, int>{};
    for (final todo in todos) {
      stats[todo.priority] = (stats[todo.priority] ?? 0) + 1;
    }
    return stats;
  }

  List<int> _calculateWeeklyTrend(List<TodoModel> todos) {
    final now = DateTime.now();
    final trend = List<int>.filled(7, 0);

    for (int i = 0; i < 7; i++) {
      final day = now.subtract(Duration(days: 6 - i));
      final dayStart = DateTime(day.year, day.month, day.day);
      final dayEnd = dayStart.add(Duration(days: 1));

      trend[i] = todos.where((t) =>
          t.completedAt != null &&
          t.completedAt!.isAfter(dayStart) &&
          t.completedAt!.isBefore(dayEnd)).length;
    }

    return trend;
  }
}
```

### 📊 Data Models for State

```dart
// lib/presentation/providers/models/todo_filter.dart
class TodoFilter {
  final TodoStatus status;
  final int? categoryId;
  final int? priority;
  final String? searchQuery;
  final DueDateFilter? dueDateFilter;
  final SortBy sortBy;
  final SortOrder sortOrder;

  TodoFilter({
    this.status = TodoStatus.all,
    this.categoryId,
    this.priority,
    this.searchQuery,
    this.dueDateFilter,
    this.sortBy = SortBy.createdDate,
    this.sortOrder = SortOrder.descending,
  });

  TodoFilter copyWith({
    TodoStatus? status,
    int? categoryId,
    int? priority,
    String? searchQuery,
    DueDateFilter? dueDateFilter,
    SortBy? sortBy,
    SortOrder? sortOrder,
  }) {
    return TodoFilter(
      status: status ?? this.status,
      categoryId: categoryId ?? this.categoryId,
      priority: priority ?? this.priority,
      searchQuery: searchQuery ?? this.searchQuery,
      dueDateFilter: dueDateFilter ?? this.dueDateFilter,
      sortBy: sortBy ?? this.sortBy,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoFilter &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          categoryId == other.categoryId &&
          priority == other.priority &&
          searchQuery == other.searchQuery &&
          dueDateFilter == other.dueDateFilter &&
          sortBy == other.sortBy &&
          sortOrder == other.sortOrder;

  @override
  int get hashCode => Object.hash(
        status,
        categoryId,
        priority,
        searchQuery,
        dueDateFilter,
        sortBy,
        sortOrder,
      );
}

enum TodoStatus { all, pending, completed }
enum DueDateFilter { today, overdue, thisWeek }
enum SortBy { createdDate, dueDate, priority, title }
enum SortOrder { ascending, descending }

// lib/presentation/providers/models/todo_stats.dart
class TodoStats {
  final int totalTodos;
  final int completedTodos;
  final int pendingTodos;
  final int overdueTodos;
  final int todayTodos;
  final int thisWeekTodos;
  final int thisMonthTodos;
  final double completionRate;
  final Map<int, int> categoryStats;
  final Map<int, int> priorityStats;
  final List<int> weeklyCompletionTrend;

  TodoStats({
    required this.totalTodos,
    required this.completedTodos,
    required this.pendingTodos,
    required this.overdueTodos,
    required this.todayTodos,
    required this.thisWeekTodos,
    required this.thisMonthTodos,
    required this.completionRate,
    required this.categoryStats,
    required this.priorityStats,
    required this.weeklyCompletionTrend,
  });

  factory TodoStats.empty() {
    return TodoStats(
      totalTodos: 0,
      completedTodos: 0,
      pendingTodos: 0,
      overdueTodos: 0,
      todayTodos: 0,
      thisWeekTodos: 0,
      thisMonthTodos: 0,
      completionRate: 0.0,
      categoryStats: {},
      priorityStats: {},
      weeklyCompletionTrend: List.filled(7, 0),
    );
  }

  int get productivityScore {
    if (totalTodos == 0) return 0;

    final baseScore = (completionRate * 100).round();
    final consistencyBonus = weeklyCompletionTrend.where((day) => day > 0).length * 2;
    final overdueePenalty = overdueTodos * 5;

    return (baseScore + consistencyBonus - overdueePenalty).clamp(0, 100);
  }

  String get productivityLevel {
    final score = productivityScore;
    if (score >= 80) return 'Excellent';
    if (score >= 60) return 'Good';
    if (score >= 40) return 'Fair';
    return 'Needs Improvement';
  }

  @override
  String toString() => 'TodoStats(total: $totalTodos, completed: $completedTodos)';
}
```

---

Saya telah membuat bagian pertama dari Section 12 yang mencakup project overview, setup, database design, dan state management. Apakah Anda ingin saya melanjutkan dengan bagian selanjutnya (UI Design & Layout, Core Functionality, dll) atau ada yang ingin Anda tanyakan tentang bagian yang sudah dibuat?