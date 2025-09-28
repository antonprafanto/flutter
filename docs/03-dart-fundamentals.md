# 🎯 Chapter 3: Dart Fundamentals

[![Progress](https://img.shields.io/badge/Progress-Chapter%203%2F15-blue?style=for-the-badge)](../README.md)
[![Difficulty](https://img.shields.io/badge/Difficulty-Beginner-green?style=for-the-badge)](../README.md)
[![Estimated Time](https://img.shields.io/badge/Time-3--4%20hours-orange?style=for-the-badge)](../README.md)

> 🎯 **Learning Objectives**: Setelah chapter ini, Anda akan menguasai syntax Dart yang essential untuk Flutter development, termasuk null safety dan async programming.

## 📋 Daftar Isi
- [Mengapa Dart untuk Flutter?](#-mengapa-dart-untuk-flutter)
- [Basic Syntax & Variables](#-basic-syntax--variables)
- [Data Types & Collections](#-data-types--collections)
- [Functions & Classes](#-functions--classes)
- [Null Safety](#-null-safety)
- [Async Programming](#-async-programming)
- [Dart untuk Flutter Contexts](#-dart-untuk-flutter-contexts)
- [Practice Exercises](#-practice-exercises)
- [Common Mistakes](#-common-mistakes)

---

## 🤔 Mengapa Dart untuk Flutter?

### 🎯 **Perfect Match for UI Development**

```dart
// Dart syntax yang clean untuk UI
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Hello')),
    body: Center(child: Text('World')),
  );
}
```

### ✨ **Key Advantages**
- **🚀 Hot Reload**: Dart compiler mendukung incremental compilation
- **🎯 Type Safety**: Strong typing dengan optional dynamic
- **⚡ Performance**: Compiled to native code (iOS/Android)
- **🧹 Clean Syntax**: Mudah dibaca dan ditulis
- **🔄 Familiar**: Syntax mirip Java/JavaScript/C#

---

## 🔤 Basic Syntax & Variables

### 📝 **Variable Declaration**

```dart
// Explicit type declaration
String name = 'Flutter Developer';
int age = 25;
double salary = 50000.0;
bool isEmployed = true;

// Type inference (var keyword)
var name = 'Flutter Developer';  // String
var age = 25;                    // int
var salary = 50000.0;            // double
var isEmployed = true;           // bool

// Final vs Const
final String finalName = 'Cannot change after initialization';
const String constName = 'Compile-time constant';

// Late initialization
late String description;
description = 'Set later in the program';
```

> 🎮 **Try it Interactive!**
> [**► Run this code on DartPad**](https://dartpad.dev/?id=e7076b40fb17a446c6d9ebcf3ad32589)
> Eksperimen dengan variable types dan lihat hasilnya secara real-time!

### 🔄 **String Operations**

```dart
// String interpolation
String firstName = 'John';
String lastName = 'Doe';
String fullName = '$firstName $lastName';           // John Doe
String message = 'Hello ${fullName.toUpperCase()}'; // Hello JOHN DOE

// Multi-line strings
String multiLine = '''
This is a
multi-line
string
''';

// Raw strings (no escape sequences)
String rawString = r'This is a raw string with \n no newline';

// Common string methods
String text = 'Flutter Development';
print(text.length);           // 19
print(text.toUpperCase());    // FLUTTER DEVELOPMENT
print(text.contains('Flutter')); // true
print(text.split(' '));       // ['Flutter', 'Development']
```

> 🎮 **Try it Interactive!**
> [**► Run String Operations on DartPad**](https://dartpad.dev/?id=f47ac10b58cc4372a5670e02b2c3d479)
> Coba ubah string dan lihat berbagai operasi yang bisa dilakukan!

### 🧮 **Numbers & Math**

```dart
// Integer operations
int a = 10;
int b = 3;
print(a + b);     // 13 (addition)
print(a - b);     // 7 (subtraction)
print(a * b);     // 30 (multiplication)
print(a ~/ b);    // 3 (integer division)
print(a % b);     // 1 (modulo)

// Double operations
double x = 10.5;
double y = 3.2;
print(x / y);     // 3.28125 (division)
print(x.round()); // 11 (rounded)

// Converting between types
String numberStr = '42';
int parsed = int.parse(numberStr);
String backToString = parsed.toString();

// Math operations
import 'dart:math';
print(sqrt(16));    // 4.0
print(pow(2, 3));   // 8.0
print(Random().nextInt(100)); // Random 0-99
```

---

## 📊 Data Types & Collections

### 📃 **Lists (Arrays)**

```dart
// List declaration
List<String> fruits = ['apple', 'banana', 'orange'];
var numbers = <int>[1, 2, 3, 4, 5];

// Dynamic list (not recommended for production)
List<dynamic> mixed = ['string', 42, true, 3.14];

// List operations
fruits.add('grape');           // Add single item
fruits.addAll(['kiwi', 'mango']); // Add multiple items
fruits.remove('banana');       // Remove by value
fruits.removeAt(0);           // Remove by index

// List properties
print(fruits.length);         // Get length
print(fruits.isEmpty);        // Check if empty
print(fruits.first);          // First element
print(fruits.last);           // Last element

// List methods
fruits.forEach((fruit) => print(fruit));
List<String> upperFruits = fruits.map((f) => f.toUpperCase()).toList();
List<String> filtered = fruits.where((f) => f.contains('a')).toList();

// List comprehension style
var squares = [for (int i = 1; i <= 5; i++) i * i]; // [1, 4, 9, 16, 25]
```

### 🗺️ **Maps (Key-Value Pairs)**

```dart
// Map declaration
Map<String, String> person = {
  'name': 'John Doe',
  'email': 'john@example.com',
  'city': 'Jakarta'
};

// Alternative declaration
var person2 = <String, dynamic>{
  'name': 'Jane',
  'age': 30,
  'isEmployed': true
};

// Map operations
person['phone'] = '+62123456789';    // Add/update
String? name = person['name'];        // Get value (nullable)
person.remove('city');               // Remove key

// Map properties and methods
print(person.keys);          // Get all keys
print(person.values);        // Get all values
print(person.length);        // Get size
print(person.containsKey('name')); // Check if key exists

// Iterating maps
person.forEach((key, value) => print('$key: $value'));

// Map from lists
var keys = ['name', 'age'];
var values = ['Alice', 25];
var combined = Map.fromIterables(keys, values);
```

### 📦 **Sets (Unique Collections)**

```dart
// Set declaration
Set<String> uniqueNames = {'Alice', 'Bob', 'Charlie'};
var numbers = <int>{1, 2, 3, 4, 5};

// Set operations
uniqueNames.add('David');
uniqueNames.add('Alice');  // Won't add duplicate
uniqueNames.remove('Bob');

// Set methods
Set<String> otherNames = {'Eve', 'Frank', 'Alice'};
print(uniqueNames.union(otherNames));        // Union
print(uniqueNames.intersection(otherNames)); // Intersection
print(uniqueNames.difference(otherNames));   // Difference

// Convert between collections
List<String> nameList = uniqueNames.toList();
Set<String> nameSet = nameList.toSet();
```

---

## ⚙️ Functions & Classes

### 🔧 **Functions**

```dart
// Basic function
String greet(String name) {
  return 'Hello, $name!';
}

// Arrow function (single expression)
String greetShort(String name) => 'Hello, $name!';

// Optional parameters with default values
String createMessage(String text, [String prefix = 'Info']) {
  return '$prefix: $text';
}

// Named parameters
String buildUrl({required String host, int port = 80, String path = '/'}) {
  return 'http://$host:$port$path';
}
// Usage: buildUrl(host: 'example.com', path: '/api');

// Function as parameter (higher-order functions)
void processNumbers(List<int> numbers, void Function(int) processor) {
  for (int number in numbers) {
    processor(number);
  }
}
// Usage: processNumbers([1, 2, 3], (n) => print(n * 2));

// Generic functions
T getFirst<T>(List<T> items) {
  return items.first;
}
```

### 🏗️ **Classes & Objects**

```dart
// Basic class
class Person {
  // Properties
  String name;
  int age;

  // Constructor
  Person(this.name, this.age);

  // Named constructor
  Person.baby(this.name) : age = 0;

  // Method
  void introduce() {
    print('Hi, I\'m $name and I\'m $age years old.');
  }

  // Getter
  String get info => '$name ($age years old)';

  // Setter
  set updateAge(int newAge) {
    if (newAge >= 0) age = newAge;
  }
}

// Usage
var person = Person('Alice', 25);
person.introduce();
print(person.info);
person.updateAge = 26;

// Inheritance
class Student extends Person {
  String school;

  Student(String name, int age, this.school) : super(name, age);

  @override
  void introduce() {
    super.introduce();
    print('I study at $school');
  }
}

// Abstract class
abstract class Animal {
  String name;
  Animal(this.name);

  void makeSound(); // Abstract method

  void sleep() {    // Concrete method
    print('$name is sleeping');
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print('$name says Woof!');
  }
}
```

---

## 🛡️ Null Safety

### 🎯 **Understanding Null Safety**

```dart
// Null safety basics
String name = 'Flutter';        // Non-nullable
String? nickname = null;        // Nullable (notice the ?)

// This will cause compile error:
// String errorName = null;     // Error: Can't assign null to non-nullable

// Safe access
print(nickname?.length);        // Safe call (returns null if nickname is null)
print(nickname ?? 'No nickname'); // Null-aware operator

// Null assertion (use carefully!)
String definitelyNotNull = nickname!; // Throws exception if null

// Late variables
late String description;
// ... some code ...
description = 'This will be set later';
print(description); // OK to use after initialization
```

### 🔍 **Null-Aware Operators**

```dart
class User {
  String? name;
  String? email;

  User({this.name, this.email});
}

void handleUser(User? user) {
  // Null-aware access
  print(user?.name?.toUpperCase());

  // Null-aware assignment
  user?.name ??= 'Anonymous';

  // Cascade with null-aware
  user?..name = 'Updated'
      ..email = 'new@email.com';

  // If-null operator
  String displayName = user?.name ?? 'Guest';

  // Null assertion (when you're sure it's not null)
  if (user != null) {
    String safeName = user.name!; // OK because we checked
  }
}

// Null-aware method calls
List<String>? items = getItems();
items?.add('new item');           // Only calls add if items is not null
int count = items?.length ?? 0;   // Safe length access
```

### ⚡ **Practical Null Safety Patterns**

```dart
// Pattern 1: Early return
String processUser(User? user) {
  if (user == null) return 'No user';

  // Now user is promoted to non-nullable
  return 'Processing ${user.name}';
}

// Pattern 2: Null-aware chaining
String getUserInfo(User? user) {
  return user?.name?.toUpperCase() ?? 'UNKNOWN';
}

// Pattern 3: Late initialization
class AuthService {
  late String token;

  Future<void> login(String username, String password) async {
    // Get token from API
    token = await getTokenFromAPI(username, password);
  }

  void makeAuthenticatedRequest() {
    // token is guaranteed to be set if login was called
    print('Using token: $token');
  }
}
```

---

## ⏰ Async Programming

### 🔄 **Future & Async/Await**

```dart
// Basic Future
Future<String> fetchUserData() async {
  // Simulate network delay
  await Future.delayed(Duration(seconds: 2));
  return 'User data fetched!';
}

// Using async/await
void handleUserData() async {
  try {
    print('Fetching user data...');
    String data = await fetchUserData();
    print(data);
  } catch (error) {
    print('Error: $error');
  }
}

// Multiple async operations
Future<void> loadMultipleData() async {
  // Sequential (one after another)
  String userData = await fetchUserData();
  String profileData = await fetchProfileData();

  // Parallel (at the same time)
  List<String> results = await Future.wait([
    fetchUserData(),
    fetchProfileData(),
    fetchSettingsData(),
  ]);
}

// Future with timeout
Future<String> fetchWithTimeout() async {
  try {
    return await fetchUserData().timeout(Duration(seconds: 5));
  } catch (e) {
    return 'Request timed out';
  }
}
```

### 🌊 **Streams**

```dart
// Stream basics
Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // Emit value
  }
}

// Listening to streams
void listenToStream() async {
  await for (int value in countStream()) {
    print('Received: $value');
  }
}

// Stream subscription
void subscribeToStream() {
  countStream().listen(
    (value) => print('Value: $value'),
    onError: (error) => print('Error: $error'),
    onDone: () => print('Stream completed'),
  );
}

// Stream transformations
void transformStream() async {
  countStream()
    .where((value) => value % 2 == 0)  // Filter even numbers
    .map((value) => value * 2)         // Double the values
    .listen((value) => print('Transformed: $value'));
}

// StreamController for custom streams
import 'dart:async';

class Counter {
  int _count = 0;
  final StreamController<int> _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  void increment() {
    _count++;
    _controller.add(_count);
  }

  void dispose() {
    _controller.close();
  }
}
```

---

## 🎨 Dart untuk Flutter Contexts

### 🏗️ **Widget Building Patterns**

```dart
// Typical Flutter widget structure
class MyWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const MyWidget({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Text(title),
      ),
    );
  }
}

// StatefulWidget with state management
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: $_counter'),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Increment'),
        ),
      ],
    );
  }
}
```

### 🎯 **Common Flutter Patterns**

```dart
// Callback functions
typedef OnItemSelected = void Function(String item);

class ItemList extends StatelessWidget {
  final List<String> items;
  final OnItemSelected onItemSelected;

  const ItemList({
    Key? key,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          onTap: () => onItemSelected(items[index]),
        );
      },
    );
  }
}

// Builder pattern
Widget buildLoadingState() {
  return Center(child: CircularProgressIndicator());
}

Widget buildErrorState(String error) {
  return Center(child: Text('Error: $error'));
}

Widget buildDataState(List<String> data) {
  return ListView(
    children: data.map((item) => ListTile(title: Text(item))).toList(),
  );
}

// Conditional rendering
Widget buildConditionalWidget(bool isLoggedIn) {
  return isLoggedIn
    ? HomeScreen()
    : LoginScreen();
}
```

---

## 💪 Practice Exercises

### 🎯 **Exercise 1: Basic Dart Operations**

```dart
// TODO: Complete this function
Map<String, dynamic> processUserData(List<Map<String, dynamic>> users) {
  // 1. Filter users who are adults (age >= 18)
  // 2. Get their names in uppercase
  // 3. Return a map with count and names

  // Your solution here
}

// Test data
List<Map<String, dynamic>> testUsers = [
  {'name': 'Alice', 'age': 25},
  {'name': 'Bob', 'age': 17},
  {'name': 'Charlie', 'age': 30},
  {'name': 'Diana', 'age': 16},
];

// Expected output: {'count': 2, 'names': ['ALICE', 'CHARLIE']}
```

### 🎯 **Exercise 2: Async Programming**

```dart
// TODO: Implement a function that fetches data with retries
Future<String> fetchDataWithRetry(String url, {int maxRetries = 3}) async {
  // 1. Try to fetch data from URL
  // 2. If it fails, retry up to maxRetries times
  // 3. Add delay between retries (1 second, 2 seconds, 3 seconds)
  // 4. Return data or throw error after all retries failed

  // Your solution here
}

// Mock function for testing
Future<String> mockFetch(String url) async {
  await Future.delayed(Duration(milliseconds: 500));
  if (Random().nextBool()) {
    throw Exception('Network error');
  }
  return 'Data from $url';
}
```

### 🎯 **Exercise 3: Class Design**

```dart
// TODO: Create a BankAccount class
class BankAccount {
  // 1. Properties: accountNumber (String), balance (double), ownerName (String)
  // 2. Constructor with required parameters
  // 3. Methods: deposit(amount), withdraw(amount), getBalance()
  // 4. Validation: no negative deposits/withdrawals, no overdraft
  // 5. toString() method for account info

  // Your implementation here
}

// TODO: Create a SavingsAccount that extends BankAccount
class SavingsAccount extends BankAccount {
  // 1. Additional property: interestRate (double)
  // 2. Method: calculateInterest() returns interest amount
  // 3. Override withdraw to limit withdrawals per month

  // Your implementation here
}
```

### 🔍 **Solutions**

<details>
<summary>Click to see solutions</summary>

```dart
// Solution 1
Map<String, dynamic> processUserData(List<Map<String, dynamic>> users) {
  List<String> adultNames = users
    .where((user) => user['age'] >= 18)
    .map((user) => (user['name'] as String).toUpperCase())
    .toList();

  return {
    'count': adultNames.length,
    'names': adultNames,
  };
}

// Solution 2
Future<String> fetchDataWithRetry(String url, {int maxRetries = 3}) async {
  for (int attempt = 0; attempt <= maxRetries; attempt++) {
    try {
      return await mockFetch(url);
    } catch (e) {
      if (attempt == maxRetries) rethrow;
      await Future.delayed(Duration(seconds: attempt + 1));
    }
  }
  throw Exception('This should never be reached');
}

// Solution 3
class BankAccount {
  final String accountNumber;
  final String ownerName;
  double _balance;

  BankAccount({
    required this.accountNumber,
    required this.ownerName,
    double initialBalance = 0.0,
  }) : _balance = initialBalance;

  void deposit(double amount) {
    if (amount <= 0) throw ArgumentError('Amount must be positive');
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) throw ArgumentError('Amount must be positive');
    if (amount > _balance) throw StateError('Insufficient funds');
    _balance -= amount;
  }

  double getBalance() => _balance;

  @override
  String toString() => 'Account $accountNumber ($ownerName): \$${_balance.toStringAsFixed(2)}';
}
```

</details>

---

## ⚠️ Common Mistakes

### 🚫 **Mistake 1: Ignoring Null Safety**

```dart
// ❌ Wrong
String? getName() => null;
String name = getName(); // Compile error

// ✅ Correct
String? getName() => null;
String name = getName() ?? 'Default';
```

### 🚫 **Mistake 2: Not Using async/await Properly**

```dart
// ❌ Wrong - not awaiting Future
void fetchData() {
  fetchUserData(); // Returns Future, but not awaited
  print('Done'); // Prints immediately
}

// ✅ Correct
void fetchData() async {
  await fetchUserData();
  print('Done'); // Prints after data is fetched
}
```

### 🚫 **Mistake 3: Modifying Lists During Iteration**

```dart
// ❌ Wrong
List<int> numbers = [1, 2, 3, 4, 5];
for (int number in numbers) {
  if (number % 2 == 0) {
    numbers.remove(number); // ConcurrentModificationError
  }
}

// ✅ Correct
List<int> numbers = [1, 2, 3, 4, 5];
numbers.removeWhere((number) => number % 2 == 0);
```

### 🚫 **Mistake 4: Not Handling Exceptions**

```dart
// ❌ Wrong
Future<void> riskyOperation() async {
  String data = await fetchDataFromAPI(); // Might throw
  processData(data);
}

// ✅ Correct
Future<void> riskyOperation() async {
  try {
    String data = await fetchDataFromAPI();
    processData(data);
  } catch (e) {
    print('Error: $e');
    // Handle error appropriately
  }
}
```

---

## 🧠 Self-Assessment Quiz

### 📝 **Quiz: Dart Fundamentals**

**Instructions:** Jawab pertanyaan berikut untuk mengukur pemahaman kamu tentang Dart basics.

**Question 1:** Apa perbedaan antara `var`, `final`, dan `const`?
<details>
<summary>Click untuk jawaban</summary>

- `var`: Variable yang bisa diubah, type inference
- `final`: Variable yang hanya bisa diset sekali, runtime constant
- `const`: Compile-time constant, tidak bisa diubah
</details>

**Question 2:** Code berikut akan menghasilkan apa?
```dart
String? name;
print(name?.length ?? 'null');
```
<details>
<summary>Click untuk jawaban</summary>

Output: `null` - karena name adalah null, operator `?.` return null, dan `??` operator memberikan fallback value 'null'
</details>

**Question 3:** Apa yang salah dengan code ini?
```dart
Future<String> getData() async {
  return 'Hello';
}

void main() {
  String result = getData();
  print(result);
}
```
<details>
<summary>Click untuk jawaban</summary>

Error: `getData()` return Future<String>, bukan String. Harus menggunakan `await` atau `.then()` untuk mendapatkan nilai actual.

Correct:
```dart
void main() async {
  String result = await getData();
  print(result);
}
```
</details>

**Question 4:** Berapa output dari code berikut?
```dart
List<int> numbers = [1, 2, 3];
numbers.add(4);
print(numbers.length);
```
<details>
<summary>Click untuk jawaban</summary>

Output: `4` - List dimulai dengan 3 elements, setelah add(4) menjadi 4 elements
</details>

**Question 5:** Apa kegunaan operator `??` dalam Dart?
<details>
<summary>Click untuk jawaban</summary>

Null-aware operator: memberikan nilai fallback jika variable di sebelah kiri null.
Example: `String name = username ?? 'Guest';`
</details>

### 🎯 **Score Interpretation:**
- **5/5:** 🏆 Excellent! Kamu siap untuk Flutter development
- **3-4/5:** 👍 Good! Review beberapa konsep yang masih kurang
- **1-2/5:** 📚 Study more! Baca ulang section ini dengan teliti
- **0/5:** 🔄 Restart! Mulai dari awal dan practice lebih banyak

---
Future<void> riskyOperation() async {
  try {
    String data = await fetchDataFromAPI();
    processData(data);
  } catch (e) {
    print('Error occurred: $e');
    // Handle error appropriately
  }
}
```

---

## 🎓 Chapter Summary

Congratulations! Anda telah menguasai Dart fundamentals. Sekarang Anda tahu:

### ✅ **What You've Learned**
- **Basic Syntax**: Variables, strings, numbers
- **Collections**: Lists, Maps, Sets
- **OOP**: Classes, inheritance, abstraction
- **Null Safety**: Safe handling of nullable values
- **Async Programming**: Futures, Streams, async/await
- **Flutter Patterns**: Common Dart patterns untuk Flutter

### 🎯 **Key Takeaways**
- **Null Safety** prevents runtime errors
- **async/await** makes async code readable
- **Type system** helps catch errors early
- **Collections** provide powerful data manipulation
- **Clean syntax** makes code maintainable

### 🚀 **Ready for Flutter**
Dengan Dart fundamentals yang solid, Anda siap untuk:
- Memahami Flutter widget system
- Build reactive UIs dengan state management
- Handle user interactions dan data flow
- Create professional Flutter applications

---

<div align="center">

### 🎯 **Achievement Unlocked!**
![Dart Master Badge](../assets/badges/dart-master.png)

**🎯 Dart Master** - Mastered Dart Language Fundamentals

---

**Ready to dive into Flutter concepts?**

[⬅️ Previous: Environment Setup](02-persiapan-environment.md) | [➡️ Next: Flutter Concepts](04-konsep-dasar-flutter.md)

---

**💬 Questions about Dart?** Check our [glossary](glossary.md) atau open an [issue](../../issues)

</div>