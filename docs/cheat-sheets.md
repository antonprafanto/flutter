# 📋 Flutter Quick Reference Cheat Sheets

[![Flutter](https://img.shields.io/badge/Flutter-Cheat_Sheets-blue?style=for-the-badge&logo=flutter)](../README.md)
[![Quick Reference](https://img.shields.io/badge/Quick-Reference-green?style=for-the-badge)](../README.md)

> ⚡ **Ultimate quick reference cards untuk Flutter development - bookmark this page!**

## 📋 Daftar Isi
- [Widget Essentials](#-widget-essentials)
- [Layout Quick Guide](#-layout-quick-guide)
- [Navigation Patterns](#-navigation-patterns)
- [State Management](#-state-management)
- [Common Widgets](#-common-widgets)
- [Styling & Theming](#-styling--theming)
- [HTTP & JSON](#-http--json)
- [Testing Quick Guide](#-testing-quick-guide)
- [Flutter CLI Commands](#-flutter-cli-commands)
- [Debugging Tips](#-debugging-tips)

---

## 🧩 Widget Essentials

### **Basic Widget Structure**
```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hello World'),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Text('Counter: $_counter');
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }
}
```

### **Widget Lifecycle**
```dart
class LifecycleExample extends StatefulWidget {
  @override
  _LifecycleExampleState createState() => _LifecycleExampleState();
}

class _LifecycleExampleState extends State<LifecycleExample> {
  @override
  void initState() {
    super.initState();
    // Called once when widget is created
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Called when dependencies change
  }

  @override
  Widget build(BuildContext context) {
    // Called every time widget needs to be rendered
    return Container();
  }

  @override
  void didUpdateWidget(LifecycleExample oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Called when parent widget changes
  }

  @override
  void dispose() {
    // Cleanup resources
    super.dispose();
  }
}
```

---

## 📐 Layout Quick Guide

### **Common Layout Patterns**
```dart
// Vertical Layout
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Item 1'),
    Text('Item 2'),
  ],
)

// Horizontal Layout
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.star),
    Text('Rating'),
  ],
)

// Stacked Layout
Stack(
  alignment: Alignment.center,
  children: [
    Container(width: 200, height: 200, color: Colors.red),
    Text('Overlay Text'),
  ],
)

// Flexible Layout
Row(
  children: [
    Expanded(flex: 2, child: Container(color: Colors.blue)),
    Expanded(flex: 1, child: Container(color: Colors.red)),
  ],
)
```

### **Container Properties**
```dart
Container(
  width: 200,
  height: 100,
  margin: EdgeInsets.all(16),
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: Colors.black, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        offset: Offset(2, 2),
        blurRadius: 4,
      ),
    ],
  ),
  child: Text('Styled Container'),
)
```

### **Responsive Design**
```dart
// MediaQuery for responsive design
Widget responsiveWidget(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final width = size.width;

  if (width > 800) {
    return DesktopLayout();
  } else if (width > 600) {
    return TabletLayout();
  } else {
    return MobileLayout();
  }
}

// Flexible breakpoints
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 800) {
      return wideLayout();
    } else {
      return narrowLayout();
    }
  },
)
```

---

## 🧭 Navigation Patterns

### **Basic Navigation**
```dart
// Navigate to new screen
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NewScreen()),
);

// Navigate with data
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailScreen(data: myData),
  ),
);

// Go back
Navigator.pop(context);

// Go back with result
Navigator.pop(context, result);

// Replace current screen
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => NewScreen()),
);

// Clear stack and navigate
Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen()),
  (route) => false,
);
```

### **Named Routes**
```dart
// In MaterialApp
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/profile': (context) => ProfileScreen(),
    '/settings': (context) => SettingsScreen(),
  },
)

// Navigate using named routes
Navigator.pushNamed(context, '/profile');
Navigator.pushReplacementNamed(context, '/settings');
```

### **Passing Data Between Screens**
```dart
// Method 1: Constructor
class DetailScreen extends StatelessWidget {
  final String data;
  DetailScreen({required this.data});
}

// Method 2: RouteSettings
Navigator.pushNamed(
  context,
  '/detail',
  arguments: {'id': 123, 'title': 'Example'},
);

// In receiving screen
final args = ModalRoute.of(context)!.settings.arguments as Map;
final id = args['id'];
```

---

## 🔄 State Management

### **setState Pattern**
```dart
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $_count'),
        ElevatedButton(
          onPressed: _increment,
          child: Text('Increment'),
        ),
      ],
    );
  }
}
```

### **Provider Pattern**
```dart
// 1. Create ChangeNotifier
class Counter extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

// 2. Provide at top level
ChangeNotifierProvider(
  create: (context) => Counter(),
  child: MyApp(),
)

// 3. Consume in widgets
Consumer<Counter>(
  builder: (context, counter, child) {
    return Text('Count: ${counter.count}');
  },
)

// 4. Access without rebuilding
context.read<Counter>().increment();

// 5. Watch for changes
final count = context.watch<Counter>().count;
```

### **ValueNotifier & ValueListenableBuilder**
```dart
// Simple state management
ValueNotifier<int> counter = ValueNotifier<int>(0);

ValueListenableBuilder<int>(
  valueListenable: counter,
  builder: (context, value, child) {
    return Text('Count: $value');
  },
)

// Update value
counter.value++;
```

---

## 🎨 Common Widgets

### **Text Widgets**
```dart
// Basic Text
Text('Hello World')

// Styled Text
Text(
  'Styled Text',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  ),
)

// Rich Text
RichText(
  text: TextSpan(
    style: DefaultTextStyle.of(context).style,
    children: [
      TextSpan(text: 'Hello '),
      TextSpan(
        text: 'World',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  ),
)
```

### **Button Widgets**
```dart
// Elevated Button
ElevatedButton(
  onPressed: () {},
  child: Text('Elevated'),
)

// Text Button
TextButton(
  onPressed: () {},
  child: Text('Text Button'),
)

// Outlined Button
OutlinedButton(
  onPressed: () {},
  child: Text('Outlined'),
)

// Icon Button
IconButton(
  icon: Icon(Icons.favorite),
  onPressed: () {},
)

// Floating Action Button
FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
)
```

### **Input Widgets**
```dart
// Text Field
TextField(
  decoration: InputDecoration(
    labelText: 'Enter text',
    hintText: 'Type here...',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.search),
  ),
  onChanged: (value) {},
)

// Form Field
TextFormField(
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter text';
    }
    return null;
  },
)

// Checkbox
Checkbox(
  value: isChecked,
  onChanged: (value) {
    setState(() {
      isChecked = value!;
    });
  },
)

// Switch
Switch(
  value: isSwitched,
  onChanged: (value) {
    setState(() {
      isSwitched = value;
    });
  },
)
```

### **List Widgets**
```dart
// Simple List
ListView(
  children: [
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
  ],
)

// List Builder
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index]),
    );
  },
)

// Grid View
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 1.0,
  ),
  itemBuilder: (context, index) {
    return Card(child: Text('Item $index'));
  },
)
```

---

## 🎨 Styling & Theming

### **Theme Setup**
```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    accentColor: Colors.orange,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 16),
    ),
  ),
  home: MyHomePage(),
)
```

### **Custom Colors**
```dart
// Define custom colors
class AppColors {
  static const Color primary = Color(0xFF2196F3);
  static const Color secondary = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
}

// Use in theme
ThemeData(
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.secondary,
  ),
)
```

### **Custom Text Styles**
```dart
class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );
}

// Usage
Text('Heading', style: AppTextStyles.heading)
```

---

## 🌐 HTTP & JSON

### **HTTP Requests**
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

// GET Request
Future<Map<String, dynamic>> fetchData() async {
  final response = await http.get(
    Uri.parse('https://api.example.com/data'),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

// POST Request
Future<Map<String, dynamic>> postData(Map<String, dynamic> data) async {
  final response = await http.post(
    Uri.parse('https://api.example.com/data'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(data),
  );

  return json.decode(response.body);
}
```

### **JSON Serialization**
```dart
// Manual JSON handling
class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}

// Usage
final userJson = {'name': 'John', 'email': 'john@example.com'};
final user = User.fromJson(userJson);
final json = user.toJson();
```

### **FutureBuilder Pattern**
```dart
FutureBuilder<List<User>>(
  future: fetchUsers(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else if (snapshot.hasData) {
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          final user = snapshot.data![index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      );
    } else {
      return Text('No data available');
    }
  },
)
```

---

## 🧪 Testing Quick Guide

### **Unit Test**
```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculator Tests', () {
    test('should add two numbers correctly', () {
      final calculator = Calculator();
      final result = calculator.add(2, 3);
      expect(result, equals(5));
    });

    test('should throw exception for invalid input', () {
      final calculator = Calculator();
      expect(
        () => calculator.divide(10, 0),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
```

### **Widget Test**
```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
```

### **Mock & Verify**
```dart
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  test('should fetch user data', () async {
    final mockRepo = MockUserRepository();
    final user = User(id: '1', name: 'John');

    when(mockRepo.getUser('1')).thenAnswer((_) async => user);

    final result = await mockRepo.getUser('1');

    expect(result.name, equals('John'));
    verify(mockRepo.getUser('1')).called(1);
  });
}
```

---

## ⚡ Flutter CLI Commands

### **Project Management**
```bash
# Create new project
flutter create my_app
flutter create --org com.example my_app

# Create with specific platforms
flutter create --platforms android,ios,web my_app

# Add platform to existing project
flutter create --platforms web .

# Clean project
flutter clean

# Get dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade

# Analyze code
flutter analyze

# Format code
flutter format .
```

### **Running & Building**
```bash
# Run app
flutter run
flutter run --debug
flutter run --release
flutter run --profile

# Run on specific device
flutter run -d chrome
flutter run -d "iPhone 12"

# Hot reload
r (in running app)

# Hot restart
R (in running app)

# Build APK
flutter build apk
flutter build apk --split-per-abi

# Build iOS
flutter build ios

# Build web
flutter build web

# Install APK
flutter install
```

### **Testing & Analysis**
```bash
# Run tests
flutter test
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage

# Integration tests
flutter drive --target=test_driver/app.dart

# Performance profiling
flutter run --profile --trace-startup
```

### **Device & Emulator**
```bash
# List devices
flutter devices

# List emulators
flutter emulators

# Launch emulator
flutter emulators --launch "Pixel_4_API_30"

# Check Flutter installation
flutter doctor
flutter doctor -v
```

---

## 🐛 Debugging Tips

### **Common Debug Widgets**
```dart
// Debug container borders
Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.red), // Debug border
  ),
  child: child,
)

// Debug print
debugPrint('Debug message: $value');

// Assert in debug mode
assert(() {
  print('This only runs in debug mode');
  return true;
}());

// Debug information
Widget build(BuildContext context) {
  print('Building ${widget.runtimeType}');
  return YourWidget();
}
```

### **Inspector Tools**
```dart
// Add to widget for easy inspection
Widget build(BuildContext context) {
  return Container(
    key: Key('debug-container'), // Easy to find in inspector
    child: YourWidget(),
  );
}

// Performance debugging
import 'dart:developer' as developer;

Widget build(BuildContext context) {
  developer.Timeline.startSync('Building MyWidget');
  final widget = YourExpensiveWidget();
  developer.Timeline.finishSync();
  return widget;
}
```

### **Error Handling**
```dart
// Global error handling
void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // Log to crash analytics
  };

  runApp(MyApp());
}

// Widget error boundary
class ErrorBoundary extends StatelessWidget {
  final Widget child;
  final String? errorMessage;

  const ErrorBoundary({Key? key, required this.child, this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        try {
          return child;
        } catch (error) {
          return Center(
            child: Text(errorMessage ?? 'Something went wrong'),
          );
        }
      },
    );
  }
}
```

---

## 📱 Platform-Specific Code

### **Platform Detection**
```dart
import 'dart:io';

if (Platform.isAndroid) {
  // Android specific code
} else if (Platform.isIOS) {
  // iOS specific code
}

// Or using Theme
if (Theme.of(context).platform == TargetPlatform.iOS) {
  return CupertinoButton(onPressed: onPressed, child: Text('iOS Button'));
} else {
  return ElevatedButton(onPressed: onPressed, child: Text('Material Button'));
}
```

### **Adaptive Widgets**
```dart
// Platform adaptive widgets
Widget buildButton() {
  return Platform.isIOS
      ? CupertinoButton(onPressed: onPressed, child: Text('Button'))
      : ElevatedButton(onPressed: onPressed, child: Text('Button'));
}

// Or use adaptive constructors
Switch.adaptive(value: value, onChanged: onChanged)
Slider.adaptive(value: value, onChanged: onChanged)
```

---

## 🎯 Performance Tips

### **Build Optimization**
```dart
// Use const constructors
const Text('Static text')
const Icon(Icons.home)

// Extract widgets to methods or separate classes
Widget _buildHeader() {
  return Container(
    child: Text('Header'),
  );
}

// Use RepaintBoundary for expensive widgets
RepaintBoundary(
  child: ExpensiveWidget(),
)

// ListView with itemExtent for better performance
ListView.builder(
  itemExtent: 80.0, // Fixed height
  itemBuilder: (context, index) => ListItem(index),
)
```

### **Memory Management**
```dart
// Dispose controllers
@override
void dispose() {
  _controller.dispose();
  _textController.dispose();
  super.dispose();
}

// Use late keyword for expensive initialization
late final ExpensiveObject _expensiveObject = ExpensiveObject();

// Avoid creating objects in build method
class MyWidget extends StatelessWidget {
  static const _textStyle = TextStyle(fontSize: 16); // Static/const

  @override
  Widget build(BuildContext context) {
    return Text('Hello', style: _textStyle);
  }
}
```

---

## 📚 Quick Keyboard Shortcuts

### **VS Code Shortcuts**
```
Ctrl+Shift+P (Cmd+Shift+P) - Command Palette
Ctrl+Space (Cmd+Space) - Trigger autocomplete
Ctrl+. (Cmd+.) - Quick fix
F12 - Go to definition
Shift+F12 - Find all references
Ctrl+Shift+F (Cmd+Shift+F) - Search in files
Ctrl+` (Cmd+`) - Open terminal
```

### **Flutter-Specific VS Code**
```
Ctrl+Shift+P > "Flutter: Hot Reload"
Ctrl+Shift+P > "Flutter: Hot Restart"
Ctrl+Shift+P > "Flutter: Open DevTools"
Ctrl+Shift+P > "Dart: Open DevTools"
```

---

## 🔗 Useful Resources

### **Official Links**
- [Flutter.dev](https://flutter.dev) - Official documentation
- [API Reference](https://api.flutter.dev) - Complete API docs
- [Pub.dev](https://pub.dev) - Package repository

### **Learning Resources**
- [Flutter Codelabs](https://codelabs.developers.google.com/?cat=Flutter)
- [Flutter YouTube](https://www.youtube.com/c/flutterdev)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

### **Tools & Extensions**
- [Flutter Inspector](https://flutter.dev/docs/development/tools/devtools/inspector)
- [Dart DevTools](https://dart.dev/tools/dart-devtools)
- [VS Code Flutter Extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

---

**💡 Pro Tip**: Print this cheat sheet atau bookmark untuk reference cepat saat coding!

**🔖 Bookmark shortcut**: `Ctrl+D` (Windows/Linux) atau `Cmd+D` (Mac)