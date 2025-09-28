# 🌐 Section 10: Mengakses Data & API

<div align="center">

![Flutter HTTP](https://img.shields.io/badge/Flutter-HTTP_&_API-blue?style=for-the-badge&logo=flutter)
![Difficulty](https://img.shields.io/badge/Level-Intermediate-orange?style=for-the-badge)
![Duration](https://img.shields.io/badge/Durasi-4--5_Jam-green?style=for-the-badge)

*Menguasai integrasi API dan pengelolaan data untuk aplikasi Flutter yang dinamis dan real-time*

</div>

---

## 🎯 Tujuan Pembelajaran

Setelah menyelesaikan section ini, Anda akan dapat:

- ✅ Memahami konsep HTTP requests dan REST API
- ✅ Mengintegrasikan API menggunakan http package
- ✅ Melakukan JSON parsing dan serialization
- ✅ Menangani loading states dan error handling
- ✅ Implementasi local storage dan caching
- ✅ Mengelola offline functionality dan sync data
- ✅ Menggunakan FutureBuilder dan StreamBuilder

---

## 📚 Daftar Isi

1. [Konsep Dasar HTTP & REST API](#konsep-dasar-http--rest-api)
2. [Setup HTTP Package](#setup-http-package)
3. [HTTP Requests (GET, POST, PUT, DELETE)](#http-requests)
4. [JSON Parsing & Serialization](#json-parsing--serialization)
5. [Model Classes & Data Structure](#model-classes--data-structure)
6. [FutureBuilder untuk Async Data](#futurebuilder-untuk-async-data)
7. [Error Handling & Loading States](#error-handling--loading-states)
8. [Local Storage (SharedPreferences)](#local-storage-sharedpreferences)
9. [Database Lokal (SQLite)](#database-lokal-sqlite)
10. [Caching & Offline Support](#caching--offline-support)
11. [Real-time Data (WebSocket/SSE)](#real-time-data-websocketsse)
12. [Hands-on Project: News App](#hands-on-project-news-app)
13. [Best Practices](#best-practices)
14. [Troubleshooting](#troubleshooting)

---

## 1. Konsep Dasar HTTP & REST API

### 🌐 HTTP Methods

```dart
// HTTP Methods Overview
/*
GET    - Mengambil data dari server
POST   - Mengirim data baru ke server
PUT    - Update/replace data di server
PATCH  - Update sebagian data di server
DELETE - Menghapus data di server
*/
```

### 📡 REST API Principles

```dart
// RESTful API Structure
/*
GET    /api/users          → Ambil semua users
GET    /api/users/123      → Ambil user dengan ID 123
POST   /api/users          → Buat user baru
PUT    /api/users/123      → Update user 123 (full)
PATCH  /api/users/123      → Update user 123 (partial)
DELETE /api/users/123      → Hapus user 123
*/
```

### 🔄 HTTP Status Codes

```dart
// Common HTTP Status Codes
enum HttpStatus {
  ok(200),                    // Success
  created(201),              // Resource created
  noContent(204),            // Success, no content
  badRequest(400),           // Client error
  unauthorized(401),         // Authentication required
  forbidden(403),            // Access denied
  notFound(404),             // Resource not found
  internalServerError(500),  // Server error
  serviceUnavailable(503);   // Server temporarily unavailable

  const HttpStatus(this.code);
  final int code;
}
```

---

## 2. Setup HTTP Package

### 📦 Dependencies

```yaml
# pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0           # HTTP requests
  dio: ^5.3.2            # Alternative HTTP client (advanced)
  json_annotation: ^4.8.1 # JSON serialization
  shared_preferences: ^2.2.2 # Local storage
  sqflite: ^2.3.0        # SQLite database

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.7   # Code generation
  json_serializable: ^6.7.1 # JSON code generation
```

### 🔧 Basic HTTP Setup

```dart
// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // GET Request
  static Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.get(url, headers: headers);
      return response;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // POST Request
  static Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(data),
      );
      return response;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // PUT Request
  static Future<http.Response> put(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.put(
        url,
        headers: headers,
        body: json.encode(data),
      );
      return response;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // DELETE Request
  static Future<http.Response> delete(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.delete(url, headers: headers);
      return response;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
```

### 🛡️ Advanced HTTP Client (Dio)

```dart
// lib/services/dio_service.dart
import 'package:dio/dio.dart';

class DioService {
  static late Dio _dio;

  static void initialize() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add interceptors
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add authentication token if available
        final token = getAuthToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onResponse: (response, handler) {
        // Handle successful responses
        handler.next(response);
      },
      onError: (error, handler) {
        // Handle errors globally
        _handleError(error);
        handler.next(error);
      },
    ));
  }

  static Dio get dio => _dio;

  static String? getAuthToken() {
    // Get token from secure storage
    return null; // Implement based on your auth system
  }

  static void _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        print('Connection timeout');
        break;
      case DioExceptionType.receiveTimeout:
        print('Receive timeout');
        break;
      case DioExceptionType.badResponse:
        print('Bad response: ${error.response?.statusCode}');
        break;
      case DioExceptionType.cancel:
        print('Request cancelled');
        break;
      default:
        print('Unknown error: ${error.message}');
    }
  }
}
```

---

## 3. HTTP Requests

### 📥 GET Requests

```dart
// lib/services/user_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Get all users
  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Get single user
  static Future<User> getUser(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return User.fromJson(jsonData);
      } else if (response.statusCode == 404) {
        throw Exception('User not found');
      } else {
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Get users with query parameters
  static Future<List<User>> searchUsers({
    String? name,
    String? email,
    int? limit,
  }) async {
    final queryParams = <String, String>{};
    if (name != null) queryParams['name'] = name;
    if (email != null) queryParams['email'] = email;
    if (limit != null) queryParams['_limit'] = limit.toString();

    final uri = Uri.parse('$baseUrl/users').replace(queryParameters: queryParams);

    try {
      final response = await http.get(uri, headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
```

### 📤 POST Requests

```dart
// Create new user
static Future<User> createUser(User user) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      return User.fromJson(jsonData);
    } else {
      throw Exception('Failed to create user: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Network error: $e');
  }
}

// Login user
static Future<AuthResponse> login(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return AuthResponse.fromJson(jsonData);
    } else if (response.statusCode == 401) {
      throw Exception('Invalid credentials');
    } else {
      throw Exception('Login failed: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Network error: $e');
  }
}
```

### 🔄 PUT & PATCH Requests

```dart
// Update user (PUT - full replacement)
static Future<User> updateUser(int id, User user) async {
  try {
    final response = await http.put(
      Uri.parse('$baseUrl/users/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return User.fromJson(jsonData);
    } else if (response.statusCode == 404) {
      throw Exception('User not found');
    } else {
      throw Exception('Failed to update user: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Network error: $e');
  }
}

// Partial update user (PATCH)
static Future<User> patchUser(int id, Map<String, dynamic> updates) async {
  try {
    final response = await http.patch(
      Uri.parse('$baseUrl/users/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updates),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return User.fromJson(jsonData);
    } else if (response.statusCode == 404) {
      throw Exception('User not found');
    } else {
      throw Exception('Failed to update user: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Network error: $e');
  }
}
```

### 🗑️ DELETE Requests

```dart
// Delete user
static Future<bool> deleteUser(int id) async {
  try {
    final response = await http.delete(
      Uri.parse('$baseUrl/users/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      return true;
    } else if (response.statusCode == 404) {
      throw Exception('User not found');
    } else {
      throw Exception('Failed to delete user: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Network error: $e');
  }
}
```

---

## 4. JSON Parsing & Serialization

### 📋 Manual JSON Parsing

```dart
// lib/models/user.dart
class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final Address? address;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.address,
  });

  // From JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] != null
          ? Address.fromJson(json['address'])
          : null,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      if (address != null) 'address': address!.toJson(),
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email}';
  }

  // CopyWith method for updates
  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    Address? address,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}

class Address {
  final String street;
  final String city;
  final String zipcode;

  Address({
    required this.street,
    required this.city,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'zipcode': zipcode,
    };
  }
}
```

### 🤖 Automated JSON Serialization

```dart
// lib/models/post.dart
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart'; // Generated file

@JsonSerializable()
class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    this.createdAt,
    this.updatedAt,
  });

  // Generated methods
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  String toString() {
    return 'Post{id: $id, title: $title}';
  }
}

// Generate code with: flutter packages pub run build_runner build
```

### 🔄 Complex JSON Structures

```dart
// lib/models/api_response.dart
@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;
  final List<String>? errors;
  final Pagination? pagination;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
    this.errors,
    this.pagination,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}

@JsonSerializable()
class Pagination {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int itemsPerPage;

  Pagination({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemsPerPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
```

### 🎯 JSON Utilities

```dart
// lib/utils/json_utils.dart
class JsonUtils {
  // Safe JSON parsing with error handling
  static T? safeParse<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      if (json is Map<String, dynamic>) {
        return fromJson(json);
      }
      return null;
    } catch (e) {
      print('JSON parsing error: $e');
      return null;
    }
  }

  // Parse list of objects
  static List<T> parseList<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (json is List) {
      return json
          .where((item) => item is Map<String, dynamic>)
          .map((item) => fromJson(item as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  // Handle nullable strings
  static String? parseString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value.isEmpty ? null : value;
    return value.toString();
  }

  // Handle nullable integers
  static int? parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    if (value is double) return value.toInt();
    return null;
  }

  // Handle dates
  static DateTime? parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }
}
```

---

## 5. Model Classes & Data Structure

### 📊 Complete User Model

```dart
// lib/models/user_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Address address;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  // Helper methods
  String get fullName => name;
  String get displayEmail => email.toLowerCase();
  String get initials {
    final names = name.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '';
  }

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? website,
    Address? address,
    Company? company,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      address: address ?? this.address,
      company: company ?? this.company,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'User{id: $id, name: $name, email: $email}';
}

@JsonSerializable()
class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  String get fullAddress => '$street, $suite, $city $zipcode';

  @override
  String toString() => fullAddress;
}

@JsonSerializable()
class Geo {
  final String lat;
  final String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
  Map<String, dynamic> toJson() => _$GeoToJson(this);

  double? get latitude => double.tryParse(lat);
  double? get longitude => double.tryParse(lng);

  @override
  String toString() => 'Geo{lat: $lat, lng: $lng}';
}

@JsonSerializable()
class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @override
  String toString() => 'Company{name: $name}';
}
```

### 📝 Post Model with Comments

```dart
// lib/models/post_model.dart
@JsonSerializable()
class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<Comment>? comments;

  @JsonKey(includeFromJson: false, includeToJson: false)
  User? author;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    this.comments,
    this.author,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  // Helper methods
  String get excerpt {
    const maxLength = 100;
    if (body.length <= maxLength) return body;
    return '${body.substring(0, maxLength)}...';
  }

  int get commentCount => comments?.length ?? 0;

  bool get hasComments => commentCount > 0;

  String get authorName => author?.name ?? 'Unknown Author';

  Post copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
    List<Comment>? comments,
    User? author,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      comments: comments ?? this.comments,
      author: author ?? this.author,
    );
  }
}

@JsonSerializable()
class Comment {
  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  String get authorInitials {
    final names = name.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '';
  }

  @override
  String toString() => 'Comment{id: $id, name: $name}';
}
```

---

## 6. FutureBuilder untuk Async Data

### 🔄 Basic FutureBuilder

```dart
// lib/pages/users_page.dart
class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late Future<List<User>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = UserService.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshUsers,
          ),
        ],
      ),
      body: FutureBuilder<List<User>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          // Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading users...'),
                ],
              ),
            );
          }

          // Error state
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Error: ${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _refreshUsers,
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // Success state
          if (snapshot.hasData) {
            final users = snapshot.data!;

            if (users.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_outline,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text('No users found'),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: _refreshUsers,
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserListTile(
                    user: user,
                    onTap: () => _navigateToUserDetail(user),
                  );
                },
              ),
            );
          }

          // Fallback state
          return Center(child: Text('No data available'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewUser,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _refreshUsers() async {
    setState(() {
      _usersFuture = UserService.getUsers();
    });
  }

  void _navigateToUserDetail(User user) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UserDetailPage(user: user),
      ),
    );
  }

  void _addNewUser() {
    // Navigate to add user page
  }
}
```

### 🎯 Advanced FutureBuilder with State Management

```dart
// lib/pages/posts_page.dart
class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<Post>> _postsFuture;
  List<Post> _cachedPosts = [];
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  void _loadPosts() {
    _postsFuture = _fetchPostsWithAuthors();
  }

  Future<List<Post>> _fetchPostsWithAuthors() async {
    try {
      // Fetch posts
      final posts = await PostService.getPosts();

      // Fetch authors for each post
      final postsWithAuthors = <Post>[];

      for (final post in posts) {
        try {
          final author = await UserService.getUser(post.userId);
          postsWithAuthors.add(post.copyWith(author: author));
        } catch (e) {
          // If author fetch fails, add post without author
          postsWithAuthors.add(post);
        }
      }

      _cachedPosts = postsWithAuthors;
      return postsWithAuthors;
    } catch (e) {
      // Return cached data if available
      if (_cachedPosts.isNotEmpty) {
        return _cachedPosts;
      }
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _showSearch,
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          return CustomScrollView(
            slivers: [
              // Refresh indicator
              SliverToBoxAdapter(
                child: _isRefreshing
                    ? LinearProgressIndicator()
                    : SizedBox.shrink(),
              ),

              // Content
              if (snapshot.connectionState == ConnectionState.waiting &&
                  _cachedPosts.isEmpty)
                SliverFillRemaining(
                  child: _buildLoadingState(),
                )
              else if (snapshot.hasError && _cachedPosts.isEmpty)
                SliverFillRemaining(
                  child: _buildErrorState(snapshot.error.toString()),
                )
              else if (snapshot.hasData || _cachedPosts.isNotEmpty)
                _buildPostsList(snapshot.data ?? _cachedPosts)
              else
                SliverFillRemaining(
                  child: _buildEmptyState(),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading posts...'),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red),
            SizedBox(height: 16),
            Text(
              'Failed to load posts',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _refreshPosts,
              child: Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.article_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('No posts available'),
        ],
      ),
    );
  }

  Widget _buildPostsList(List<Post> posts) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final post = posts[index];
          return PostCard(
            post: post,
            onTap: () => _navigateToPostDetail(post),
          );
        },
        childCount: posts.length,
      ),
    );
  }

  Future<void> _refreshPosts() async {
    if (_isRefreshing) return;

    setState(() {
      _isRefreshing = true;
    });

    try {
      setState(() {
        _loadPosts();
      });
    } finally {
      setState(() {
        _isRefreshing = false;
      });
    }
  }

  void _navigateToPostDetail(Post post) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PostDetailPage(post: post),
      ),
    );
  }

  void _showSearch() {
    showSearch(
      context: context,
      delegate: PostSearchDelegate(_cachedPosts),
    );
  }
}
```

### 🔄 StreamBuilder for Real-time Data

```dart
// lib/widgets/real_time_comments.dart
class RealTimeComments extends StatelessWidget {
  final int postId;

  RealTimeComments({required this.postId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Comment>>(
      stream: CommentService.getCommentsStream(postId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text('No comments yet'),
          );
        }

        final comments = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: comments.length,
          itemBuilder: (context, index) {
            return CommentTile(comment: comments[index]);
          },
        );
      },
    );
  }
}

// Comment service with stream
class CommentService {
  static Stream<List<Comment>> getCommentsStream(int postId) async* {
    while (true) {
      try {
        final comments = await getComments(postId);
        yield comments;
        await Future.delayed(Duration(seconds: 5)); // Poll every 5 seconds
      } catch (e) {
        yield* Stream.error(e);
        break;
      }
    }
  }

  static Future<List<Comment>> getComments(int postId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/posts/$postId/comments'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Comment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
```

---

## 7. Error Handling & Loading States

### 🛡️ Comprehensive Error Handling

```dart
// lib/utils/api_exception.dart
abstract class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class NetworkException extends ApiException {
  NetworkException([String? message])
      : super(message ?? 'Network connection failed');
}

class ServerException extends ApiException {
  ServerException(String message, int statusCode)
      : super(message, statusCode);
}

class ValidationException extends ApiException {
  final Map<String, List<String>> errors;

  ValidationException(this.errors)
      : super('Validation failed');
}

class UnauthorizedException extends ApiException {
  UnauthorizedException()
      : super('Unauthorized access', 401);
}

class NotFoundException extends ApiException {
  NotFoundException(String resource)
      : super('$resource not found', 404);
}

class TimeoutException extends ApiException {
  TimeoutException()
      : super('Request timeout');
}
```

### 🔧 Error Handler Service

```dart
// lib/services/error_handler.dart
class ErrorHandler {
  static ApiException handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is SocketException) {
      return NetworkException('No internet connection');
    } else if (error is TimeoutException) {
      return TimeoutException();
    } else if (error is FormatException) {
      return ApiException('Invalid data format');
    } else {
      return ApiException('An unexpected error occurred: $error');
    }
  }

  static ApiException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return TimeoutException();

      case DioExceptionType.badResponse:
        return _handleResponseError(error.response!);

      case DioExceptionType.cancel:
        return ApiException('Request was cancelled');

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return NetworkException();
        }
        return ApiException('Unknown error occurred');

      default:
        return ApiException('Network error occurred');
    }
  }

  static ApiException _handleResponseError(Response response) {
    final statusCode = response.statusCode!;
    final data = response.data;

    switch (statusCode) {
      case 400:
        if (data is Map && data.containsKey('errors')) {
          return ValidationException(
            Map<String, List<String>>.from(data['errors']),
          );
        }
        return ApiException('Bad request', statusCode);

      case 401:
        return UnauthorizedException();

      case 403:
        return ApiException('Access forbidden', statusCode);

      case 404:
        return NotFoundException('Resource');

      case 422:
        if (data is Map && data.containsKey('errors')) {
          return ValidationException(
            Map<String, List<String>>.from(data['errors']),
          );
        }
        return ApiException('Validation failed', statusCode);

      case 500:
        return ServerException('Internal server error', statusCode);

      case 502:
        return ServerException('Bad gateway', statusCode);

      case 503:
        return ServerException('Service unavailable', statusCode);

      default:
        return ServerException(
          'Server error: ${data?['message'] ?? 'Unknown error'}',
          statusCode,
        );
    }
  }

  static void showErrorDialog(BuildContext context, ApiException error) {
    String title = 'Error';
    String message = error.message;
    List<Widget> actions = [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text('OK'),
      ),
    ];

    if (error is NetworkException) {
      title = 'Connection Error';
      message = 'Please check your internet connection and try again.';
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            // Retry action could be added here
          },
          child: Text('Retry'),
        ),
      );
    } else if (error is UnauthorizedException) {
      title = 'Authentication Required';
      message = 'Please log in to continue.';
      actions = [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            // Navigate to login
          },
          child: Text('Login'),
        ),
      ];
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: actions,
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context, ApiException error) {
    final messenger = ScaffoldMessenger.of(context);

    Color backgroundColor = Colors.red;
    IconData icon = Icons.error;

    if (error is NetworkException) {
      backgroundColor = Colors.orange;
      icon = Icons.wifi_off;
    } else if (error is TimeoutException) {
      backgroundColor = Colors.blue;
      icon = Icons.timer_off;
    }

    messenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 8),
            Expanded(child: Text(error.message)),
          ],
        ),
        backgroundColor: backgroundColor,
        action: error is NetworkException
            ? SnackBarAction(
                label: 'Retry',
                textColor: Colors.white,
                onPressed: () {
                  // Retry logic
                },
              )
            : null,
      ),
    );
  }
}
```

### 🎯 Loading State Manager

```dart
// lib/utils/loading_state.dart
enum LoadingState {
  idle,
  loading,
  success,
  error,
}

class ApiState<T> {
  final LoadingState state;
  final T? data;
  final ApiException? error;

  const ApiState._({
    required this.state,
    this.data,
    this.error,
  });

  const ApiState.idle() : this._(state: LoadingState.idle);

  const ApiState.loading() : this._(state: LoadingState.loading);

  const ApiState.success(T data) : this._(
    state: LoadingState.success,
    data: data,
  );

  const ApiState.error(ApiException error) : this._(
    state: LoadingState.error,
    error: error,
  );

  bool get isIdle => state == LoadingState.idle;
  bool get isLoading => state == LoadingState.loading;
  bool get isSuccess => state == LoadingState.success;
  bool get isError => state == LoadingState.error;
  bool get hasData => data != null;

  R when<R>({
    required R Function() idle,
    required R Function() loading,
    required R Function(T data) success,
    required R Function(ApiException error) error,
  }) {
    switch (state) {
      case LoadingState.idle:
        return idle();
      case LoadingState.loading:
        return loading();
      case LoadingState.success:
        return success(data as T);
      case LoadingState.error:
        return error(this.error!);
    }
  }
}

// Usage in StatefulWidget
class UsersPageWithState extends StatefulWidget {
  @override
  _UsersPageWithStateState createState() => _UsersPageWithStateState();
}

class _UsersPageWithStateState extends State<UsersPageWithState> {
  ApiState<List<User>> _usersState = ApiState.idle();

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() {
      _usersState = ApiState.loading();
    });

    try {
      final users = await UserService.getUsers();
      setState(() {
        _usersState = ApiState.success(users);
      });
    } catch (error) {
      setState(() {
        _usersState = ApiState.error(ErrorHandler.handleError(error));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: _usersState.when(
        idle: () => Center(child: Text('Ready to load')),
        loading: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading users...'),
            ],
          ),
        ),
        success: (users) => ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) => UserTile(user: users[index]),
        ),
        error: (error) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 64, color: Colors.red),
              SizedBox(height: 16),
              Text(error.message, textAlign: TextAlign.center),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadUsers,
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 8. Local Storage (SharedPreferences)

### 💾 SharedPreferences Helper

```dart
// lib/services/storage_service.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception('StorageService not initialized. Call init() first.');
    }
    return _prefs!;
  }

  // String operations
  static Future<bool> setString(String key, String value) async {
    return await prefs.setString(key, value);
  }

  static String? getString(String key) {
    return prefs.getString(key);
  }

  // Integer operations
  static Future<bool> setInt(String key, int value) async {
    return await prefs.setInt(key, value);
  }

  static int? getInt(String key) {
    return prefs.getInt(key);
  }

  // Boolean operations
  static Future<bool> setBool(String key, bool value) async {
    return await prefs.setBool(key, value);
  }

  static bool? getBool(String key) {
    return prefs.getBool(key);
  }

  // Double operations
  static Future<bool> setDouble(String key, double value) async {
    return await prefs.setDouble(key, value);
  }

  static double? getDouble(String key) {
    return prefs.getDouble(key);
  }

  // List<String> operations
  static Future<bool> setStringList(String key, List<String> value) async {
    return await prefs.setStringList(key, value);
  }

  static List<String>? getStringList(String key) {
    return prefs.getStringList(key);
  }

  // JSON object operations
  static Future<bool> setObject<T>(String key, T object) async {
    final jsonString = json.encode(object);
    return await setString(key, jsonString);
  }

  static T? getObject<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final jsonString = getString(key);
    if (jsonString == null) return null;

    try {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return fromJson(jsonMap);
    } catch (e) {
      print('Error parsing stored object: $e');
      return null;
    }
  }

  // JSON list operations
  static Future<bool> setObjectList<T>(String key, List<T> objects) async {
    final jsonString = json.encode(objects);
    return await setString(key, jsonString);
  }

  static List<T> getObjectList<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final jsonString = getString(key);
    if (jsonString == null) return [];

    try {
      final jsonList = json.decode(jsonString) as List<dynamic>;
      return jsonList
          .map((json) => fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error parsing stored object list: $e');
      return [];
    }
  }

  // Remove operations
  static Future<bool> remove(String key) async {
    return await prefs.remove(key);
  }

  static Future<bool> clear() async {
    return await prefs.clear();
  }

  // Check if key exists
  static bool containsKey(String key) {
    return prefs.containsKey(key);
  }

  // Get all keys
  static Set<String> getKeys() {
    return prefs.getKeys();
  }
}
```

### 🔐 User Preferences Manager

```dart
// lib/services/user_preferences.dart
class UserPreferences {
  static const String _keyUserId = 'user_id';
  static const String _keyUserData = 'user_data';
  static const String _keyAuthToken = 'auth_token';
  static const String _keyRefreshToken = 'refresh_token';
  static const String _keyIsFirstLaunch = 'is_first_launch';
  static const String _keyThemeMode = 'theme_mode';
  static const String _keyLanguage = 'language';
  static const String _keyNotificationsEnabled = 'notifications_enabled';
  static const String _keyFavoriteItems = 'favorite_items';
  static const String _keySearchHistory = 'search_history';

  // User authentication
  static Future<void> setUserId(int userId) async {
    await StorageService.setInt(_keyUserId, userId);
  }

  static int? getUserId() {
    return StorageService.getInt(_keyUserId);
  }

  static Future<void> setUserData(User user) async {
    await StorageService.setObject(_keyUserData, user.toJson());
  }

  static User? getUserData() {
    return StorageService.getObject(_keyUserData, (json) => User.fromJson(json));
  }

  static Future<void> setAuthToken(String token) async {
    await StorageService.setString(_keyAuthToken, token);
  }

  static String? getAuthToken() {
    return StorageService.getString(_keyAuthToken);
  }

  static Future<void> setRefreshToken(String token) async {
    await StorageService.setString(_keyRefreshToken, token);
  }

  static String? getRefreshToken() {
    return StorageService.getString(_keyRefreshToken);
  }

  // App preferences
  static Future<void> setIsFirstLaunch(bool isFirst) async {
    await StorageService.setBool(_keyIsFirstLaunch, isFirst);
  }

  static bool isFirstLaunch() {
    return StorageService.getBool(_keyIsFirstLaunch) ?? true;
  }

  static Future<void> setThemeMode(ThemeMode mode) async {
    await StorageService.setString(_keyThemeMode, mode.toString());
  }

  static ThemeMode getThemeMode() {
    final modeString = StorageService.getString(_keyThemeMode);
    switch (modeString) {
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static Future<void> setLanguage(String languageCode) async {
    await StorageService.setString(_keyLanguage, languageCode);
  }

  static String getLanguage() {
    return StorageService.getString(_keyLanguage) ?? 'en';
  }

  static Future<void> setNotificationsEnabled(bool enabled) async {
    await StorageService.setBool(_keyNotificationsEnabled, enabled);
  }

  static bool areNotificationsEnabled() {
    return StorageService.getBool(_keyNotificationsEnabled) ?? true;
  }

  // User data
  static Future<void> addFavoriteItem(String itemId) async {
    final favorites = getFavoriteItems();
    if (!favorites.contains(itemId)) {
      favorites.add(itemId);
      await setFavoriteItems(favorites);
    }
  }

  static Future<void> removeFavoriteItem(String itemId) async {
    final favorites = getFavoriteItems();
    favorites.remove(itemId);
    await setFavoriteItems(favorites);
  }

  static Future<void> setFavoriteItems(List<String> items) async {
    await StorageService.setStringList(_keyFavoriteItems, items);
  }

  static List<String> getFavoriteItems() {
    return StorageService.getStringList(_keyFavoriteItems) ?? [];
  }

  static bool isFavorite(String itemId) {
    return getFavoriteItems().contains(itemId);
  }

  static Future<void> addSearchQuery(String query) async {
    if (query.trim().isEmpty) return;

    final history = getSearchHistory();

    // Remove if already exists
    history.remove(query);

    // Add to beginning
    history.insert(0, query);

    // Keep only last 20 searches
    if (history.length > 20) {
      history.removeRange(20, history.length);
    }

    await setSearchHistory(history);
  }

  static Future<void> setSearchHistory(List<String> history) async {
    await StorageService.setStringList(_keySearchHistory, history);
  }

  static List<String> getSearchHistory() {
    return StorageService.getStringList(_keySearchHistory) ?? [];
  }

  static Future<void> clearSearchHistory() async {
    await StorageService.setStringList(_keySearchHistory, []);
  }

  // Authentication helpers
  static bool isLoggedIn() {
    return getAuthToken() != null && getUserId() != null;
  }

  static Future<void> logout() async {
    await Future.wait([
      StorageService.remove(_keyUserId),
      StorageService.remove(_keyUserData),
      StorageService.remove(_keyAuthToken),
      StorageService.remove(_keyRefreshToken),
      // Keep app preferences, clear user data
      StorageService.remove(_keyFavoriteItems),
      StorageService.remove(_keySearchHistory),
    ]);
  }

  // Backup and restore
  static Map<String, dynamic> exportPreferences() {
    final keys = StorageService.getKeys();
    final prefs = <String, dynamic>{};

    for (final key in keys) {
      // Skip sensitive data
      if (key == _keyAuthToken || key == _keyRefreshToken) continue;

      final value = StorageService.prefs.get(key);
      if (value != null) {
        prefs[key] = value;
      }
    }

    return prefs;
  }

  static Future<void> importPreferences(Map<String, dynamic> preferences) async {
    for (final entry in preferences.entries) {
      final key = entry.key;
      final value = entry.value;

      if (value is String) {
        await StorageService.setString(key, value);
      } else if (value is int) {
        await StorageService.setInt(key, value);
      } else if (value is bool) {
        await StorageService.setBool(key, value);
      } else if (value is double) {
        await StorageService.setDouble(key, value);
      } else if (value is List<String>) {
        await StorageService.setStringList(key, value);
      }
    }
  }
}
```

### 🔄 Cache Manager

```dart
// lib/services/cache_service.dart
class CacheService {
  static const String _cachePrefix = 'cache_';
  static const String _cacheTimePrefix = 'cache_time_';
  static const Duration defaultExpiration = Duration(hours: 1);

  static Future<void> set<T>(
    String key,
    T data, {
    Duration? expiration,
  }) async {
    final cacheKey = _cachePrefix + key;
    final timeKey = _cacheTimePrefix + key;

    // Store data
    if (data is String) {
      await StorageService.setString(cacheKey, data);
    } else {
      await StorageService.setObject(cacheKey, data);
    }

    // Store expiration time
    final expirationTime = DateTime.now().add(expiration ?? defaultExpiration);
    await StorageService.setString(timeKey, expirationTime.toIso8601String());
  }

  static T? get<T>(
    String key,
    T Function(Map<String, dynamic>)? fromJson,
  ) {
    final cacheKey = _cachePrefix + key;
    final timeKey = _cacheTimePrefix + key;

    // Check if expired
    if (isExpired(key)) {
      remove(key);
      return null;
    }

    // Get data
    if (T == String) {
      return StorageService.getString(cacheKey) as T?;
    } else if (fromJson != null) {
      return StorageService.getObject(cacheKey, fromJson);
    }

    return null;
  }

  static bool isExpired(String key) {
    final timeKey = _cacheTimePrefix + key;
    final expirationString = StorageService.getString(timeKey);

    if (expirationString == null) return true;

    final expirationTime = DateTime.tryParse(expirationString);
    if (expirationTime == null) return true;

    return DateTime.now().isAfter(expirationTime);
  }

  static Future<void> remove(String key) async {
    final cacheKey = _cachePrefix + key;
    final timeKey = _cacheTimePrefix + key;

    await Future.wait([
      StorageService.remove(cacheKey),
      StorageService.remove(timeKey),
    ]);
  }

  static Future<void> clear() async {
    final keys = StorageService.getKeys();
    final cacheKeys = keys.where((key) =>
        key.startsWith(_cachePrefix) || key.startsWith(_cacheTimePrefix));

    await Future.wait(
      cacheKeys.map((key) => StorageService.remove(key)),
    );
  }

  static List<String> getCacheKeys() {
    final keys = StorageService.getKeys();
    return keys
        .where((key) => key.startsWith(_cachePrefix))
        .map((key) => key.substring(_cachePrefix.length))
        .toList();
  }

  static Future<void> clearExpired() async {
    final cacheKeys = getCacheKeys();

    for (final key in cacheKeys) {
      if (isExpired(key)) {
        await remove(key);
      }
    }
  }

  // Cache with auto-refresh
  static Future<T> getOrFetch<T>(
    String key,
    Future<T> Function() fetchFunction,
    T Function(Map<String, dynamic>) fromJson, {
    Duration? expiration,
  }) async {
    // Try to get from cache first
    final cached = get<T>(key, fromJson);
    if (cached != null) {
      return cached;
    }

    // Fetch fresh data
    final fresh = await fetchFunction();

    // Cache the result
    await set(key, fresh, expiration: expiration);

    return fresh;
  }
}
```

---

## 9. Database Lokal (SQLite)

### 🗄️ SQLite Setup

```dart
// pubspec.yaml
dependencies:
  sqflite: ^2.3.0
  path: ^1.8.3

// lib/database/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'app_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    // Users table
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        phone TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // Posts table
    await db.execute('''
      CREATE TABLE posts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        title TEXT NOT NULL,
        body TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
      )
    ''');

    // Cache table
    await db.execute('''
      CREATE TABLE cache (
        key TEXT PRIMARY KEY,
        data TEXT NOT NULL,
        expiration TEXT NOT NULL
      )
    ''');

    // Create indexes
    await db.execute('CREATE INDEX idx_posts_user_id ON posts (user_id)');
    await db.execute('CREATE INDEX idx_cache_expiration ON cache (expiration)');
  }

  Future<void> _upgradeDatabase(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Add new columns or tables for version 2
      await db.execute('ALTER TABLE users ADD COLUMN avatar_url TEXT');
    }
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
```

### 🔧 User Repository

```dart
// lib/repositories/user_repository.dart
class UserRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<int> insertUser(User user) async {
    final db = await _dbHelper.database;
    final now = DateTime.now().toIso8601String();

    final userData = {
      'name': user.name,
      'email': user.email,
      'phone': user.phone,
      'created_at': now,
      'updated_at': now,
    };

    return await db.insert('users', userData);
  }

  Future<List<User>> getAllUsers() async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'users',
      orderBy: 'created_at DESC',
    );

    return result.map((json) => User.fromDatabaseJson(json)).toList();
  }

  Future<User?> getUserById(int id) async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return User.fromDatabaseJson(result.first);
    }
    return null;
  }

  Future<User?> getUserByEmail(String email) async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return User.fromDatabaseJson(result.first);
    }
    return null;
  }

  Future<List<User>> searchUsers(String query) async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'users',
      where: 'name LIKE ? OR email LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
      orderBy: 'name ASC',
    );

    return result.map((json) => User.fromDatabaseJson(json)).toList();
  }

  Future<int> updateUser(User user) async {
    final db = await _dbHelper.database;
    final userData = {
      'name': user.name,
      'email': user.email,
      'phone': user.phone,
      'updated_at': DateTime.now().toIso8601String(),
    };

    return await db.update(
      'users',
      userData,
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> syncWithServer(List<User> serverUsers) async {
    final db = await _dbHelper.database;

    await db.transaction((txn) async {
      // Clear existing data
      await txn.delete('users');

      // Insert new data
      for (final user in serverUsers) {
        await txn.insert('users', {
          'id': user.id,
          'name': user.name,
          'email': user.email,
          'phone': user.phone,
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        });
      }
    });
  }

  Future<int> getUserCount() async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery('SELECT COUNT(*) as count FROM users');
    return Sqflite.firstIntValue(result) ?? 0;
  }
}
```

### 📊 Advanced Database Operations

```dart
// lib/repositories/post_repository.dart
class PostRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<Post>> getPostsWithUsers({
    int limit = 20,
    int offset = 0,
  }) async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery('''
      SELECT
        p.id,
        p.user_id,
        p.title,
        p.body,
        p.created_at,
        u.name as user_name,
        u.email as user_email
      FROM posts p
      LEFT JOIN users u ON p.user_id = u.id
      ORDER BY p.created_at DESC
      LIMIT ? OFFSET ?
    ''', [limit, offset]);

    return result.map((json) => Post.fromDatabaseJoinJson(json)).toList();
  }

  Future<List<Post>> getPostsByUser(int userId) async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'posts',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'created_at DESC',
    );

    return result.map((json) => Post.fromDatabaseJson(json)).toList();
  }

  Future<void> insertPosts(List<Post> posts) async {
    final db = await _dbHelper.database;

    await db.transaction((txn) async {
      final batch = txn.batch();

      for (final post in posts) {
        batch.insert('posts', {
          'id': post.id,
          'user_id': post.userId,
          'title': post.title,
          'body': post.body,
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        });
      }

      await batch.commit(noResult: true);
    });
  }

  Future<Map<String, dynamic>> getStatistics() async {
    final db = await _dbHelper.database;

    final results = await Future.wait([
      db.rawQuery('SELECT COUNT(*) as count FROM posts'),
      db.rawQuery('SELECT COUNT(*) as count FROM users'),
      db.rawQuery('''
        SELECT u.name, COUNT(p.id) as post_count
        FROM users u
        LEFT JOIN posts p ON u.id = p.user_id
        GROUP BY u.id, u.name
        ORDER BY post_count DESC
        LIMIT 5
      '''),
    ]);

    return {
      'total_posts': Sqflite.firstIntValue(results[0]) ?? 0,
      'total_users': Sqflite.firstIntValue(results[1]) ?? 0,
      'top_authors': results[2],
    };
  }
}
```

---

## 10. Caching & Offline Support

### 💾 Smart Cache Manager

```dart
// lib/services/smart_cache_service.dart
class SmartCacheService {
  static const String _apiCachePrefix = 'api_cache_';
  static const String _imageCachePrefix = 'image_cache_';

  // API Response Caching
  static Future<T?> getCachedApiResponse<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final cacheKey = _apiCachePrefix + endpoint.replaceAll('/', '_');
    return CacheService.get(cacheKey, fromJson);
  }

  static Future<void> cacheApiResponse<T>(
    String endpoint,
    T response, {
    Duration? expiration,
  }) async {
    final cacheKey = _apiCachePrefix + endpoint.replaceAll('/', '_');
    await CacheService.set(cacheKey, response, expiration: expiration);
  }

  // Smart fetch with cache fallback
  static Future<T> fetchWithCache<T>(
    String endpoint,
    Future<T> Function() apiCall,
    T Function(Map<String, dynamic>) fromJson, {
    Duration cacheExpiration = const Duration(minutes: 30),
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh) {
      // Try cache first
      final cached = await getCachedApiResponse(endpoint, fromJson);
      if (cached != null) {
        // Return cached data and refresh in background
        _refreshInBackground(endpoint, apiCall, cacheExpiration);
        return cached;
      }
    }

    try {
      // Fetch from API
      final response = await apiCall();

      // Cache the response
      await cacheApiResponse(endpoint, response, expiration: cacheExpiration);

      return response;
    } catch (e) {
      // If API fails, try to return stale cache
      final staleCache = await getCachedApiResponse(endpoint, fromJson);
      if (staleCache != null) {
        return staleCache;
      }

      throw e;
    }
  }

  static void _refreshInBackground<T>(
    String endpoint,
    Future<T> Function() apiCall,
    Duration cacheExpiration,
  ) async {
    try {
      final response = await apiCall();
      await cacheApiResponse(endpoint, response, expiration: cacheExpiration);
    } catch (e) {
      // Silent fail for background refresh
      print('Background refresh failed for $endpoint: $e');
    }
  }

  // Network-aware caching
  static Future<T> fetchNetworkAware<T>(
    String endpoint,
    Future<T> Function() apiCall,
    T Function(Map<String, dynamic>) fromJson, {
    Duration cacheExpiration = const Duration(minutes: 30),
  }) async {
    final hasConnection = await NetworkHelper.hasConnection();

    if (!hasConnection) {
      // Offline: return cache or throw
      final cached = await getCachedApiResponse(endpoint, fromJson);
      if (cached != null) {
        return cached;
      } else {
        throw NetworkException('No internet connection and no cached data available');
      }
    }

    // Online: fetch with cache fallback
    return fetchWithCache(endpoint, apiCall, fromJson, cacheExpiration: cacheExpiration);
  }
}

// Network connectivity helper
class NetworkHelper {
  static Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static Stream<bool> get connectivityStream {
    return Stream.periodic(Duration(seconds: 5))
        .asyncMap((_) => hasConnection())
        .distinct();
  }
}
```

### 🔄 Offline Data Sync

```dart
// lib/services/sync_service.dart
class SyncService {
  static const String _syncQueueKey = 'sync_queue';
  static const String _lastSyncKey = 'last_sync';

  static Future<void> queueForSync(SyncOperation operation) async {
    final queue = getSyncQueue();
    queue.add(operation);
    await _saveSyncQueue(queue);
  }

  static List<SyncOperation> getSyncQueue() {
    return StorageService.getObjectList(
      _syncQueueKey,
      (json) => SyncOperation.fromJson(json),
    );
  }

  static Future<void> _saveSyncQueue(List<SyncOperation> queue) async {
    await StorageService.setObjectList(_syncQueueKey, queue);
  }

  static Future<void> syncAll() async {
    final hasConnection = await NetworkHelper.hasConnection();
    if (!hasConnection) {
      throw NetworkException('No internet connection');
    }

    final queue = getSyncQueue();
    if (queue.isEmpty) return;

    final successfulOperations = <SyncOperation>[];

    for (final operation in queue) {
      try {
        await _executeSyncOperation(operation);
        successfulOperations.add(operation);
      } catch (e) {
        print('Sync operation failed: ${operation.id} - $e');
        // Continue with other operations
      }
    }

    // Remove successful operations from queue
    final remainingQueue = queue
        .where((op) => !successfulOperations.contains(op))
        .toList();

    await _saveSyncQueue(remainingQueue);
    await _updateLastSyncTime();
  }

  static Future<void> _executeSyncOperation(SyncOperation operation) async {
    switch (operation.type) {
      case SyncOperationType.createUser:
        await UserService.createUser(operation.data);
        break;
      case SyncOperationType.updateUser:
        await UserService.updateUser(operation.data['id'], operation.data);
        break;
      case SyncOperationType.deleteUser:
        await UserService.deleteUser(operation.data['id']);
        break;
      case SyncOperationType.createPost:
        await PostService.createPost(operation.data);
        break;
      case SyncOperationType.updatePost:
        await PostService.updatePost(operation.data['id'], operation.data);
        break;
      case SyncOperationType.deletePost:
        await PostService.deletePost(operation.data['id']);
        break;
    }
  }

  static Future<void> _updateLastSyncTime() async {
    await StorageService.setString(
      _lastSyncKey,
      DateTime.now().toIso8601String(),
    );
  }

  static DateTime? getLastSyncTime() {
    final timeString = StorageService.getString(_lastSyncKey);
    return timeString != null ? DateTime.tryParse(timeString) : null;
  }

  static bool needsSync() {
    final lastSync = getLastSyncTime();
    if (lastSync == null) return true;

    final now = DateTime.now();
    final difference = now.difference(lastSync);
    return difference.inHours >= 1; // Sync if last sync was more than 1 hour ago
  }

  static Future<void> autoSync() async {
    if (!needsSync()) return;

    final hasConnection = await NetworkHelper.hasConnection();
    if (!hasConnection) return;

    try {
      await syncAll();
    } catch (e) {
      print('Auto sync failed: $e');
    }
  }
}

class SyncOperation {
  final String id;
  final SyncOperationType type;
  final Map<String, dynamic> data;
  final DateTime createdAt;

  SyncOperation({
    required this.id,
    required this.type,
    required this.data,
    required this.createdAt,
  });

  factory SyncOperation.fromJson(Map<String, dynamic> json) {
    return SyncOperation(
      id: json['id'],
      type: SyncOperationType.values[json['type']],
      data: Map<String, dynamic>.from(json['data']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.index,
      'data': data,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SyncOperation && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

enum SyncOperationType {
  createUser,
  updateUser,
  deleteUser,
  createPost,
  updatePost,
  deletePost,
}
```

---

## 11. Real-time Data (WebSocket/SSE)

### 🔄 WebSocket Implementation

```dart
// lib/services/websocket_service.dart
import 'dart:convert';
import 'dart:io';

class WebSocketService {
  static WebSocket? _socket;
  static StreamController<Map<String, dynamic>>? _messageController;
  static bool _isConnected = false;

  static Stream<Map<String, dynamic>> get messageStream {
    _messageController ??= StreamController<Map<String, dynamic>>.broadcast();
    return _messageController!.stream;
  }

  static bool get isConnected => _isConnected;

  static Future<void> connect(String url) async {
    if (_isConnected) return;

    try {
      _socket = await WebSocket.connect(url);
      _isConnected = true;

      _socket!.listen(
        (data) {
          try {
            final message = json.decode(data) as Map<String, dynamic>;
            _messageController?.add(message);
          } catch (e) {
            print('Failed to parse WebSocket message: $e');
          }
        },
        onError: (error) {
          print('WebSocket error: $error');
          _handleDisconnection();
        },
        onDone: () {
          print('WebSocket connection closed');
          _handleDisconnection();
        },
      );

      print('WebSocket connected to $url');
    } catch (e) {
      print('Failed to connect to WebSocket: $e');
      _handleDisconnection();
      throw e;
    }
  }

  static void _handleDisconnection() {
    _isConnected = false;
    _socket = null;
  }

  static void sendMessage(Map<String, dynamic> message) {
    if (_isConnected && _socket != null) {
      _socket!.add(json.encode(message));
    } else {
      print('Cannot send message: WebSocket not connected');
    }
  }

  static Future<void> disconnect() async {
    if (_socket != null) {
      await _socket!.close();
      _socket = null;
    }

    _isConnected = false;
    await _messageController?.close();
    _messageController = null;
  }

  // Auto-reconnection
  static Future<void> connectWithRetry(
    String url, {
    int maxRetries = 5,
    Duration retryDelay = const Duration(seconds: 2),
  }) async {
    int attempts = 0;

    while (attempts < maxRetries && !_isConnected) {
      try {
        await connect(url);
        return;
      } catch (e) {
        attempts++;
        print('Connection attempt $attempts failed: $e');

        if (attempts < maxRetries) {
          await Future.delayed(retryDelay);
          retryDelay = Duration(seconds: retryDelay.inSeconds * 2); // Exponential backoff
        }
      }
    }

    throw Exception('Failed to connect after $maxRetries attempts');
  }
}

// Real-time chat example
class ChatService {
  static const String _baseUrl = 'wss://echo.websocket.org';

  static Future<void> initialize() async {
    await WebSocketService.connectWithRetry(_baseUrl);
  }

  static void sendMessage(String message, String userId) {
    WebSocketService.sendMessage({
      'type': 'message',
      'data': {
        'message': message,
        'userId': userId,
        'timestamp': DateTime.now().toIso8601String(),
      },
    });
  }

  static Stream<ChatMessage> get messageStream {
    return WebSocketService.messageStream
        .where((data) => data['type'] == 'message')
        .map((data) => ChatMessage.fromJson(data['data']));
  }

  static void dispose() {
    WebSocketService.disconnect();
  }
}

class ChatMessage {
  final String message;
  final String userId;
  final DateTime timestamp;

  ChatMessage({
    required this.message,
    required this.userId,
    required this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      message: json['message'],
      userId: json['userId'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
```

### 📡 Server-Sent Events (SSE)

```dart
// lib/services/sse_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class SSEService {
  static StreamController<Map<String, dynamic>>? _controller;
  static http.Client? _client;
  static bool _isConnected = false;

  static Stream<Map<String, dynamic>> connect(String url) {
    if (_isConnected) {
      return _controller!.stream;
    }

    _controller = StreamController<Map<String, dynamic>>.broadcast();
    _client = http.Client();

    _connectToSSE(url);

    return _controller!.stream;
  }

  static void _connectToSSE(String url) async {
    try {
      final request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({
        'Accept': 'text/event-stream',
        'Cache-Control': 'no-cache',
      });

      final response = await _client!.send(request);

      if (response.statusCode == 200) {
        _isConnected = true;
        print('SSE connected to $url');

        response.stream
            .transform(utf8.decoder)
            .transform(LineSplitter())
            .listen(
              _handleSSEData,
              onError: (error) {
                print('SSE error: $error');
                _handleDisconnection();
              },
              onDone: () {
                print('SSE connection closed');
                _handleDisconnection();
              },
            );
      } else {
        throw Exception('SSE connection failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to connect to SSE: $e');
      _handleDisconnection();
    }
  }

  static void _handleSSEData(String data) {
    if (data.isEmpty) return;

    if (data.startsWith('data: ')) {
      final jsonData = data.substring(6);
      try {
        final message = json.decode(jsonData) as Map<String, dynamic>;
        _controller?.add(message);
      } catch (e) {
        print('Failed to parse SSE data: $e');
      }
    }
  }

  static void _handleDisconnection() {
    _isConnected = false;
    _client?.close();
    _client = null;
  }

  static void disconnect() {
    _handleDisconnection();
    _controller?.close();
    _controller = null;
  }
}

// Live notifications example
class NotificationService {
  static Stream<AppNotification> get notificationStream {
    return SSEService.connect('https://api.example.com/notifications/stream')
        .where((data) => data['type'] == 'notification')
        .map((data) => AppNotification.fromJson(data));
  }
}

class AppNotification {
  final String id;
  final String title;
  final String message;
  final NotificationType type;
  final DateTime timestamp;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.timestamp,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      type: NotificationType.values[json['type']],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}

enum NotificationType { info, warning, error, success }
```

---

## 12. Hands-on Project: News App

Mari kita buat aplikasi berita lengkap yang mengintegrasikan semua konsep yang telah dipelajari:

### 📱 Project Structure

```
lib/
├── main.dart
├── models/
│   ├── article.dart
│   ├── category.dart
│   └── api_response.dart
├── services/
│   ├── news_api_service.dart
│   ├── storage_service.dart
│   ├── cache_service.dart
│   └── offline_service.dart
├── repositories/
│   ├── news_repository.dart
│   └── database_helper.dart
├── pages/
│   ├── home_page.dart
│   ├── article_detail_page.dart
│   ├── search_page.dart
│   └── bookmarks_page.dart
├── widgets/
│   ├── article_card.dart
│   ├── loading_widget.dart
│   └── error_widget.dart
└── utils/
    ├── constants.dart
    └── helpers.dart
```

### 📄 Article Model

```dart
// lib/models/article.dart
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final ArticleSource source;
  final String? author;
  final String? content;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isBookmarked;

  @JsonKey(includeFromJson: false, includeToJson: false)
  int? localId;

  Article({
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.source,
    this.author,
    this.content,
    this.isBookmarked = false,
    this.localId,
  });

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  // Database methods
  factory Article.fromDatabaseJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['url_to_image'],
      publishedAt: json['published_at'],
      source: ArticleSource(
        id: json['source_id'],
        name: json['source_name'],
      ),
      author: json['author'],
      content: json['content'],
      isBookmarked: json['is_bookmarked'] == 1,
      localId: json['id'],
    );
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'url_to_image': urlToImage,
      'published_at': publishedAt,
      'source_id': source.id,
      'source_name': source.name,
      'author': author,
      'content': content,
      'is_bookmarked': isBookmarked ? 1 : 0,
      'created_at': DateTime.now().toIso8601String(),
    };
  }

  // Helper methods
  DateTime get publishedDate => DateTime.parse(publishedAt);

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(publishedDate);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  String get summary {
    if (description.length <= 100) return description;
    return '${description.substring(0, 100)}...';
  }

  Article copyWith({
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    ArticleSource? source,
    String? author,
    String? content,
    bool? isBookmarked,
    int? localId,
  }) {
    return Article(
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      source: source ?? this.source,
      author: author ?? this.author,
      content: content ?? this.content,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      localId: localId ?? this.localId,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Article && runtimeType == other.runtimeType && url == other.url;

  @override
  int get hashCode => url.hashCode;
}

@JsonSerializable()
class ArticleSource {
  final String? id;
  final String name;

  ArticleSource({this.id, required this.name});

  factory ArticleSource.fromJson(Map<String, dynamic> json) =>
      _$ArticleSourceFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleSourceToJson(this);
}
```

### 🌐 News API Service

```dart
// lib/services/news_api_service.dart
class NewsApiService {
  static const String baseUrl = 'https://newsapi.org/v2';
  static const String apiKey = 'YOUR_API_KEY'; // Get from newsapi.org

  static Future<List<Article>> getTopHeadlines({
    String country = 'us',
    String? category,
    int pageSize = 20,
    int page = 1,
  }) async {
    final queryParams = {
      'country': country,
      'pageSize': pageSize.toString(),
      'page': page.toString(),
      'apiKey': apiKey,
    };

    if (category != null) {
      queryParams['category'] = category;
    }

    final uri = Uri.parse('$baseUrl/top-headlines').replace(
      queryParameters: queryParams,
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final articles = (jsonData['articles'] as List)
            .map((json) => Article.fromJson(json))
            .toList();

        return articles;
      } else {
        throw Exception('Failed to load headlines: ${response.statusCode}');
      }
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }

  static Future<List<Article>> searchArticles({
    required String query,
    String sortBy = 'relevancy',
    int pageSize = 20,
    int page = 1,
    String? from,
    String? to,
  }) async {
    final queryParams = {
      'q': query,
      'sortBy': sortBy,
      'pageSize': pageSize.toString(),
      'page': page.toString(),
      'apiKey': apiKey,
    };

    if (from != null) queryParams['from'] = from;
    if (to != null) queryParams['to'] = to;

    final uri = Uri.parse('$baseUrl/everything').replace(
      queryParameters: queryParams,
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final articles = (jsonData['articles'] as List)
            .map((json) => Article.fromJson(json))
            .toList();

        return articles;
      } else {
        throw Exception('Failed to search articles: ${response.statusCode}');
      }
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }

  static Future<List<Article>> getArticlesBySource({
    required String sourceId,
    int pageSize = 20,
    int page = 1,
  }) async {
    final queryParams = {
      'sources': sourceId,
      'pageSize': pageSize.toString(),
      'page': page.toString(),
      'apiKey': apiKey,
    };

    final uri = Uri.parse('$baseUrl/everything').replace(
      queryParameters: queryParams,
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final articles = (jsonData['articles'] as List)
            .map((json) => Article.fromJson(json))
            .toList();

        return articles;
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }
}
```

### 🗄️ News Repository

```dart
// lib/repositories/news_repository.dart
class NewsRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<Article>> getTopHeadlines({
    String category = 'general',
    bool forceRefresh = false,
  }) async {
    final cacheKey = 'headlines_$category';

    return await SmartCacheService.fetchNetworkAware(
      cacheKey,
      () => NewsApiService.getTopHeadlines(category: category),
      (json) => Article.fromJson(json),
      cacheExpiration: Duration(minutes: 15),
    );
  }

  Future<List<Article>> searchArticles(String query) async {
    final cacheKey = 'search_${query.toLowerCase()}';

    return await SmartCacheService.fetchWithCache(
      cacheKey,
      () => NewsApiService.searchArticles(query: query),
      (json) => Article.fromJson(json),
      cacheExpiration: Duration(minutes: 30),
    );
  }

  Future<List<Article>> getBookmarkedArticles() async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'bookmarks',
      orderBy: 'created_at DESC',
    );

    return result.map((json) => Article.fromDatabaseJson(json)).toList();
  }

  Future<bool> toggleBookmark(Article article) async {
    final db = await _dbHelper.database;

    if (article.isBookmarked) {
      // Remove bookmark
      await db.delete(
        'bookmarks',
        where: 'url = ?',
        whereArgs: [article.url],
      );
      return false;
    } else {
      // Add bookmark
      await db.insert('bookmarks', article.toDatabaseJson());
      return true;
    }
  }

  Future<bool> isBookmarked(String url) async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'bookmarks',
      where: 'url = ?',
      whereArgs: [url],
    );

    return result.isNotEmpty;
  }

  Future<void> clearCache() async {
    await CacheService.clear();
  }

  Future<void> syncBookmarks() async {
    // This would sync bookmarks with user's account
    // Implementation depends on your backend
  }
}
```

### 🏠 Home Page

```dart
// lib/pages/home_page.dart
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final NewsRepository _newsRepository = NewsRepository();

  final List<String> _categories = [
    'general',
    'business',
    'technology',
    'sports',
    'health',
    'science',
    'entertainment',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BookmarksPage(),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _categories
              .map((category) => Tab(
                    text: category.toUpperCase(),
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _categories
            .map((category) => NewsListView(
                  category: category,
                  repository: _newsRepository,
                ))
            .toList(),
      ),
    );
  }
}

class NewsListView extends StatefulWidget {
  final String category;
  final NewsRepository repository;

  NewsListView({
    required this.category,
    required this.repository,
  });

  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView>
    with AutomaticKeepAliveClientMixin {
  late Future<List<Article>> _articlesFuture;
  final RefreshController _refreshController = RefreshController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadArticles();
  }

  void _loadArticles() {
    _articlesFuture = widget.repository.getTopHeadlines(
      category: widget.category,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder<List<Article>>(
      future: _articlesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: LoadingWidget());
        }

        if (snapshot.hasError) {
          return Center(
            child: ErrorDisplayWidget(
              error: snapshot.error.toString(),
              onRetry: () {
                setState(() {
                  _loadArticles();
                });
              },
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: EmptyStateWidget(
              message: 'No articles found',
              icon: Icons.article_outlined,
            ),
          );
        }

        final articles = snapshot.data!;

        return SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleCard(
                article: articles[index],
                onTap: () => _navigateToDetail(articles[index]),
                onBookmarkToggle: () => _toggleBookmark(articles[index]),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _onRefresh() async {
    try {
      final articles = await widget.repository.getTopHeadlines(
        category: widget.category,
        forceRefresh: true,
      );

      setState(() {
        _articlesFuture = Future.value(articles);
      });

      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Refresh failed: $e')),
      );
    }
  }

  void _navigateToDetail(Article article) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArticleDetailPage(article: article),
      ),
    );
  }

  Future<void> _toggleBookmark(Article article) async {
    try {
      final isBookmarked = await widget.repository.toggleBookmark(article);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isBookmarked ? 'Article bookmarked' : 'Bookmark removed',
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to toggle bookmark: $e')),
      );
    }
  }
}
```

---

## 13. Best Practices

### ✅ API Integration Best Practices

1. **Use Proper Error Handling**
```dart
// DO: Handle different error types
try {
  final data = await ApiService.getData();
  return data;
} on NetworkException catch (e) {
  // Handle network errors
  throw e;
} on ServerException catch (e) {
  // Handle server errors
  throw e;
} catch (e) {
  // Handle unknown errors
  throw ApiException('Unexpected error: $e');
}
```

2. **Implement Smart Caching**
```dart
// DO: Cache with appropriate expiration
Future<T> fetchWithSmartCache<T>(
  String key,
  Future<T> Function() fetcher,
  Duration expiration,
) async {
  final cached = await cache.get<T>(key);
  if (cached != null && !cache.isExpired(key)) {
    return cached;
  }

  final fresh = await fetcher();
  await cache.set(key, fresh, expiration);
  return fresh;
}
```

3. **Use Type-Safe Models**
```dart
// DO: Use code generation for JSON
@JsonSerializable()
class User {
  final int id;
  final String name;
  @JsonKey(name: 'email_address')
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```

### 🚫 Common Mistakes to Avoid

1. **DON'T: Block UI thread with sync operations**
```dart
// DON'T
final data = someHeavyOperation(); // Blocks UI

// DO
final data = await someHeavyOperationAsync();
```

2. **DON'T: Ignore error states**
```dart
// DON'T
FutureBuilder(
  future: apiCall(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return DataWidget(snapshot.data);
    }
    return CircularProgressIndicator(); // Missing error handling
  },
)

// DO
FutureBuilder(
  future: apiCall(),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return ErrorWidget(snapshot.error);
    }
    if (snapshot.hasData) {
      return DataWidget(snapshot.data);
    }
    return CircularProgressIndicator();
  },
)
```

3. **DON'T: Store sensitive data in SharedPreferences**
```dart
// DON'T
await SharedPreferences.getInstance()
    .then((prefs) => prefs.setString('password', password));

// DO
await FlutterSecureStorage().write(key: 'password', value: password);
```

---

## 14. Troubleshooting

### 🐛 Common Issues

| Issue | Cause | Solution |
|-------|--------|----------|
| **JSON parsing errors** | Null values or type mismatches | Use nullable types and validation |
| **Network timeouts** | Slow connection or server issues | Implement retry logic and timeouts |
| **Memory leaks** | Not disposing streams/controllers | Always dispose in `dispose()` method |
| **Cache inconsistency** | Stale data being served | Implement cache invalidation strategies |
| **SQLite errors** | Database schema mismatches | Handle database migrations properly |
| **HTTP 401 errors** | Expired tokens | Implement automatic token refresh |

### 🔧 Debug Tools

```dart
// API Debug Interceptor
class DebugInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('📤 ${options.method} ${options.uri}');
    print('Headers: ${options.headers}');
    if (options.data != null) {
      print('Body: ${options.data}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('📥 ${response.statusCode} ${response.requestOptions.uri}');
    print('Response: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('❌ ${err.type} ${err.requestOptions.uri}');
    print('Error: ${err.message}');
    super.onError(err, handler);
  }
}
```

---

## 🎯 Latihan Mandiri

### **Latihan 1: Weather App (⭐⭐⭐)**
Buat aplikasi cuaca menggunakan OpenWeatherMap API:

**Requirements:**
- Current weather display
- 5-day forecast
- Location-based weather
- Offline support dengan cache
- Unit conversion (Celsius/Fahrenheit)

**API:** https://openweathermap.org/api

### **Latihan 2: Todo App dengan Sync (⭐⭐⭐⭐)**
Buat aplikasi todo dengan sinkronisasi server:

**Requirements:**
- CRUD operations (local & remote)
- Offline support
- Auto-sync when online
- Conflict resolution
- Real-time updates (WebSocket)

### **Latihan 3: E-commerce Product Catalog (⭐⭐⭐⭐⭐)**
Buat aplikasi katalog produk lengkap:

**Requirements:**
- Product listing dengan pagination
- Search dan filter functionality
- Shopping cart dengan local storage
- Wishlist dengan sync
- Image caching
- Price comparison dari multiple sources

---

## 📝 Rangkuman

Dalam section ini, Anda telah mempelajari:

### 🌐 **HTTP & API Integration**
- **REST API**: GET, POST, PUT, DELETE methods
- **HTTP Package**: Setup dan configuration
- **Dio**: Advanced HTTP client dengan interceptors
- **Error Handling**: Comprehensive error management

### 📄 **Data Management**
- **JSON Parsing**: Manual dan automated serialization
- **Model Classes**: Type-safe data structures
- **FutureBuilder**: Async UI updates
- **StreamBuilder**: Real-time data streams

### 💾 **Local Storage**
- **SharedPreferences**: Simple key-value storage
- **SQLite**: Relational database operations
- **Cache Management**: Smart caching strategies
- **Offline Support**: Data sync dan conflict resolution

### 🔄 **Real-time Features**
- **WebSocket**: Bidirectional communication
- **Server-Sent Events**: Server-to-client streaming
- **Live Updates**: Real-time UI updates
- **Background Sync**: Automatic data synchronization

### 🛡️ **Best Practices**
- Error handling patterns
- Caching strategies
- Security considerations
- Performance optimization
- Code organization

---

## 🚀 What's Next?

Di **Section 11: Forms & Input Validation**, kita akan belajar:
- Form widgets dan input handling
- Validation strategies dan custom validators
- File uploads dan image handling
- Advanced form patterns
- Accessibility dalam forms

**Selamat!** 🎉 Anda telah menguasai integrasi API dan pengelolaan data di Flutter. Skill ini sangat penting untuk membuat aplikasi yang dinamis dan terhubung dengan backend services.

---

<div align="center">
<strong>💡 Pro Tip:</strong> Selalu implement proper error handling dan offline support untuk memberikan pengalaman pengguna yang optimal dalam segala kondisi jaringan!
</div>