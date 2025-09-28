# 🛠️ Chapter 14: Developer Tools & Debugging

[![Progress](https://img.shields.io/badge/Progress-Chapter%2014%2F15-blue?style=for-the-badge)](../README.md)
[![Difficulty](https://img.shields.io/badge/Difficulty-Intermediate-orange?style=for-the-badge)](../README.md)
[![Estimated Time](https://img.shields.io/badge/Time-2--3%20hours-orange?style=for-the-badge)](../README.md)

> 🎯 **Learning Objectives**: Setelah chapter ini, Anda akan menguasai berbagai developer tools Flutter dan teknik debugging yang efektif untuk mengidentifikasi dan memperbaiki masalah dalam aplikasi Flutter.

## 📋 Daftar Isi
- [Flutter Developer Tools](#-flutter-developer-tools)
- [Flutter Inspector](#-flutter-inspector)
- [Debugging Techniques](#-debugging-techniques)
- [Performance Profiling](#-performance-profiling)
- [Error Handling & Logging](#-error-handling--logging)
- [VS Code Extensions](#-vs-code-extensions)
- [Android Studio Tools](#-android-studio-tools)
- [Command Line Tools](#-command-line-tools)
- [Best Practices](#-best-practices)
- [Exercises](#-exercises)

---

## 🛠️ Flutter Developer Tools

### DevTools Overview
Flutter DevTools adalah suite tools yang powerful untuk debugging dan profiling aplikasi Flutter.

```bash
# Install DevTools (biasanya sudah included)
flutter pub global activate devtools

# Jalankan DevTools
flutter pub global run devtools

# Atau melalui flutter command
flutter run --debug
# Kemudian buka DevTools URL yang ditampilkan
```

### Accessing DevTools
```dart
// Di aplikasi yang sedang running dalam debug mode
void main() {
  runApp(MyApp());

  // DevTools bisa diakses melalui:
  // 1. Browser URL yang ditampilkan di console
  // 2. VS Code Command Palette: "Flutter: Open DevTools"
  // 3. Android Studio: Flutter Inspector
}
```

---

## 🔍 Flutter Inspector

### Widget Tree Analysis
```dart
// Example app untuk debugging
class DebuggingExample extends StatefulWidget {
  @override
  _DebuggingExampleState createState() => _DebuggingExampleState();
}

class _DebuggingExampleState extends State<DebuggingExample> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debug Example'),
        // Inspector akan menunjukkan widget tree
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gunakan Inspector untuk melihat properties
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Counter: $_counter',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Inspector Features
```dart
// Menandai widgets untuk debugging
class DebugWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Gunakan key untuk mudah identify di inspector
      key: Key('debug-container'),
      child: Text(
        'Debug me!',
        // Inspector akan show semua properties
        style: TextStyle(
          fontSize: 16,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
```

---

## 🐛 Debugging Techniques

### Print Debugging
```dart
class PrintDebugging extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Basic print debugging
    print('Building PrintDebugging widget');

    return Column(
      children: [
        Text('Hello'),
        Builder(
          builder: (context) {
            // Debug dalam builder
            print('Builder context: $context');
            print('MediaQuery size: ${MediaQuery.of(context).size}');
            return Container(height: 50);
          },
        ),
      ],
    );
  }
}

// Advanced debugging dengan debugPrint
void debugExample() {
  // debugPrint tidak akan di-strip dalam release mode
  debugPrint('This is a debug message');

  // Conditional debugging
  assert(() {
    print('This only runs in debug mode');
    return true;
  }());
}
```

### Breakpoint Debugging
```dart
import 'dart:developer' as developer;

class BreakpointDebugging extends StatefulWidget {
  @override
  _BreakpointDebuggingState createState() => _BreakpointDebuggingState();
}

class _BreakpointDebuggingState extends State<BreakpointDebugging> {
  List<String> items = [];

  void addItem(String item) {
    // Set breakpoint di sini
    developer.debugger(); // Programmatic breakpoint

    setState(() {
      items.add(item);
      // Inspect variables dalam debugger
      print('Items length: ${items.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Breakpoint untuk inspect build process
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        // Breakpoint untuk inspect setiap item
        final item = items[index];
        return ListTile(
          title: Text(item),
          subtitle: Text('Index: $index'),
        );
      },
    );
  }
}
```

### Exception Handling
```dart
class ExceptionHandling extends StatefulWidget {
  @override
  _ExceptionHandlingState createState() => _ExceptionHandlingState();
}

class _ExceptionHandlingState extends State<ExceptionHandling> {
  String result = '';

  Future<void> riskyOperation() async {
    try {
      // Operasi yang mungkin error
      final response = await http.get(Uri.parse('https://invalid-url'));
      setState(() {
        result = 'Success: ${response.body}';
      });
    } catch (e, stackTrace) {
      // Proper error handling dengan stack trace
      debugPrint('Error occurred: $e');
      debugPrint('Stack trace: $stackTrace');

      setState(() {
        result = 'Error: $e';
      });

      // Report ke crash analytics (contoh)
      // FirebaseCrashlytics.instance.recordError(e, stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: riskyOperation,
          child: Text('Try Risky Operation'),
        ),
        Text(result),
      ],
    );
  }
}
```

---

## 📊 Performance Profiling

### CPU Profiling
```dart
import 'dart:developer';

class PerformanceDebugging extends StatefulWidget {
  @override
  _PerformanceDebuggingState createState() => _PerformanceDebuggingState();
}

class _PerformanceDebuggingState extends State<PerformanceDebugging> {
  List<int> heavyList = [];

  void heavyComputation() {
    // Start timeline untuk profiling
    Timeline.startSync('Heavy Computation');

    try {
      // Simulasi operasi berat
      for (int i = 0; i < 100000; i++) {
        heavyList.add(i * i);
      }

      // Custom timeline events
      Timeline.instantSync('Computation Complete',
        arguments: {'items': heavyList.length}
      );

    } finally {
      // Selalu finish timeline
      Timeline.finishSync();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Profile build method juga
    Timeline.startSync('Widget Build');

    final widget = Scaffold(
      appBar: AppBar(title: Text('Performance Debug')),
      body: Column(
        children: [
          Text('Items: ${heavyList.length}'),
          ElevatedButton(
            onPressed: heavyComputation,
            child: Text('Start Heavy Computation'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: heavyList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index: ${heavyList[index]}'),
                );
              },
            ),
          ),
        ],
      ),
    );

    Timeline.finishSync();
    return widget;
  }
}
```

### Memory Profiling
```dart
class MemoryDebugging extends StatefulWidget {
  @override
  _MemoryDebuggingState createState() => _MemoryDebuggingState();
}

class _MemoryDebuggingState extends State<MemoryDebugging> {
  List<ImageProvider> images = [];

  void loadImages() {
    // Memory leak simulation - DON'T DO THIS!
    for (int i = 0; i < 100; i++) {
      images.add(NetworkImage('https://picsum.photos/200/200?random=$i'));
    }
    setState(() {});
  }

  void clearImages() {
    // Proper cleanup
    images.clear();
    setState(() {});
  }

  @override
  void dispose() {
    // Always cleanup resources
    clearImages();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Loaded Images: ${images.length}'),
        Row(
          children: [
            ElevatedButton(
              onPressed: loadImages,
              child: Text('Load Images'),
            ),
            ElevatedButton(
              onPressed: clearImages,
              child: Text('Clear Images'),
            ),
          ],
        ),
      ],
    );
  }
}
```

---

## 📝 Error Handling & Logging

### Custom Logger
```dart
import 'dart:developer' as developer;

enum LogLevel { debug, info, warning, error }

class Logger {
  static void log(String message, {LogLevel level = LogLevel.info}) {
    final timestamp = DateTime.now().toIso8601String();
    final levelStr = level.toString().split('.').last.toUpperCase();

    developer.log(
      '[$levelStr] $message',
      time: DateTime.now(),
      level: _getLevelValue(level),
    );
  }

  static int _getLevelValue(LogLevel level) {
    switch (level) {
      case LogLevel.debug: return 500;
      case LogLevel.info: return 800;
      case LogLevel.warning: return 900;
      case LogLevel.error: return 1000;
    }
  }

  static void debug(String message) => log(message, level: LogLevel.debug);
  static void info(String message) => log(message, level: LogLevel.info);
  static void warning(String message) => log(message, level: LogLevel.warning);
  static void error(String message) => log(message, level: LogLevel.error);
}

// Usage
class LoggingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Logger.info('Building LoggingExample widget');

    return ElevatedButton(
      onPressed: () {
        Logger.debug('Button pressed');
        try {
          // Some operation
          Logger.info('Operation completed successfully');
        } catch (e) {
          Logger.error('Operation failed: $e');
        }
      },
      child: Text('Test Logging'),
    );
  }
}
```

### Global Error Handling
```dart
void main() {
  // Handle Flutter framework errors
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    Logger.error('Flutter Error: ${details.exception}');
    Logger.error('Stack Trace: ${details.stack}');
  };

  // Handle Dart errors outside Flutter
  PlatformDispatcher.instance.onError = (error, stack) {
    Logger.error('Platform Error: $error');
    Logger.error('Stack Trace: $stack');
    return true;
  };

  runApp(MyApp());
}

class ErrorBoundary extends StatefulWidget {
  final Widget child;

  const ErrorBoundary({Key? key, required this.child}) : super(key: key);

  @override
  _ErrorBoundaryState createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  bool hasError = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    if (hasError) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 64, color: Colors.red),
              SizedBox(height: 16),
              Text('Something went wrong!'),
              Text(errorMessage),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    hasError = false;
                    errorMessage = '';
                  });
                },
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return widget.child;
  }
}
```

---

## 🔧 VS Code Extensions

### Recommended Extensions
```json
// .vscode/extensions.json
{
  "recommendations": [
    "dart-code.dart-code",
    "dart-code.flutter",
    "alexisvt.flutter-snippets",
    "Nash.awesome-flutter-snippets",
    "hirantha.json-to-dart",
    "circlecodesolution.ccs-flutter-color",
    "pflannery.vscode-versionlens"
  ]
}
```

### VS Code Settings
```json
// .vscode/settings.json
{
  "dart.debugExternalLibraries": false,
  "dart.debugSdkLibraries": false,
  "dart.previewFlutterUiGuides": true,
  "dart.previewFlutterUiGuidesCustomTracking": true,
  "dart.hotReloadOnSave": true,
  "dart.flutterCreatePlatforms": ["android", "ios"],
  "files.associations": {
    "*.dart": "dart"
  }
}
```

---

## 🎯 Command Line Tools

### Flutter CLI Debugging
```bash
# Verbose logging
flutter run --verbose

# Debug mode dengan specific device
flutter run --debug --device-id <device_id>

# Enable tracing
flutter run --trace-startup

# Profile mode
flutter run --profile

# Hot reload dengan logging
flutter run --debug --hot

# Analyze code
flutter analyze

# Check for issues
flutter doctor -v

# Clean dan rebuild
flutter clean && flutter pub get && flutter run
```

### Testing Commands
```bash
# Run tests dengan coverage
flutter test --coverage

# Run integration tests
flutter drive --target=test_driver/app.dart

# Run specific test file
flutter test test/widget_test.dart

# Run tests dengan reporter
flutter test --reporter=expanded
```

---

## ✅ Best Practices

### 1. **Debugging Strategy**
```dart
// Systematic debugging approach
class DebuggingStrategy {
  // 1. Isolate the problem
  static void isolateProblem() {
    // Create minimal reproducible example
    // Remove unnecessary code
    // Focus on specific issue
  }

  // 2. Use appropriate tools
  static void useTools() {
    // DevTools for UI issues
    // Debugger for logic issues
    // Profiler for performance issues
  }

  // 3. Check logs systematically
  static void checkLogs() {
    // Start with error logs
    // Check timeline for performance
    // Review network requests
  }
}
```

### 2. **Code Quality**
```dart
// Always use const constructors when possible
const MyWidget({Key? key}) : super(key: key);

// Avoid rebuilding expensive widgets
class ExpensiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ExpensiveChild(); // const prevents rebuilds
  }
}

// Use keys for dynamic lists
ListView.builder(
  itemBuilder: (context, index) {
    return ListTile(
      key: ValueKey(items[index].id), // Proper key usage
      title: Text(items[index].title),
    );
  },
);
```

### 3. **Performance Monitoring**
```dart
// Monitor build frequency
class BuildCounter extends StatelessWidget {
  static int buildCount = 0;

  @override
  Widget build(BuildContext context) {
    buildCount++;
    print('BuildCounter built $buildCount times');
    return Text('Build #$buildCount');
  }
}

// Use RepaintBoundary for expensive widgets
RepaintBoundary(
  child: ExpensiveCustomPainter(),
);
```

---

## 🏋️ Exercises

### **Exercise 1: Widget Inspector Mastery**
Buat aplikasi dengan layout yang kompleks dan gunakan Flutter Inspector untuk:
- Menganalisis widget tree
- Mengidentifikasi masalah layout
- Optimize widget structure

```dart
// Starter code
class ComplexLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complex Layout')),
      body: Column(
        children: [
          Container(
            height: 200,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: Center(child: Text('Left')),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Text('Top'),
                        Expanded(child: Text('Middle')),
                        Text('Bottom'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Add more complex layouts here
        ],
      ),
    );
  }
}
```

### **Exercise 2: Performance Debugging**
Implementasikan aplikasi dengan masalah performa dan gunakan tools untuk mengidentifikasi bottlenecks:

```dart
// Problematic code - find and fix issues
class PerformanceProblem extends StatefulWidget {
  @override
  _PerformanceProblemState createState() => _PerformanceProblemState();
}

class _PerformanceProblemState extends State<PerformanceProblem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, index) {
        // Performance issues here - can you spot them?
        return Container(
          height: 100,
          child: CustomPaint(
            painter: ExpensivePainter(),
            child: Column(
              children: List.generate(10, (i) => Text('Item $index-$i')),
            ),
          ),
        );
      },
    );
  }
}

class ExpensivePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Expensive painting operations
    for (int i = 0; i < 1000; i++) {
      canvas.drawCircle(Offset(i.toDouble(), i.toDouble()), 1, Paint());
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true; // Wrong!
}
```

### **Exercise 3: Error Handling System**
Buat sistem error handling yang comprehensive:

```dart
// Implement comprehensive error handling
class ErrorHandlingSystem extends StatefulWidget {
  @override
  _ErrorHandlingSystemState createState() => _ErrorHandlingSystemState();
}

class _ErrorHandlingSystemState extends State<ErrorHandlingSystem> {
  // TODO: Implement error boundary
  // TODO: Add logging system
  // TODO: Add retry mechanisms
  // TODO: Add user-friendly error messages

  @override
  Widget build(BuildContext context) {
    // Your implementation here
    return Container();
  }
}
```

---

## 🎯 Self-Assessment

### **Knowledge Check**
1. ✅ **Flutter DevTools**: Apakah Anda bisa menggunakan semua tab di DevTools?
2. ✅ **Widget Inspector**: Bisakah Anda menganalisis widget tree dengan efektif?
3. ✅ **Performance Profiling**: Apakah Anda bisa mengidentifikasi bottlenecks?
4. ✅ **Error Handling**: Bisakah Anda membuat sistem error handling yang robust?
5. ✅ **Debugging Strategy**: Apakah Anda punya metodologi debugging yang sistematis?

### **Practical Skills**
- [ ] Setup dan gunakan Flutter DevTools
- [ ] Debug aplikasi dengan breakpoints
- [ ] Profile performance aplikasi
- [ ] Implement logging system
- [ ] Handle errors gracefully
- [ ] Use command line tools effectively

### **Next Steps**
- 🚀 Pelajari advanced profiling techniques
- 🔧 Explore additional debugging tools
- 📊 Implement monitoring dan analytics
- 🎯 Master production debugging

---

## 🎊 Chapter Complete!

Selamat! Anda telah menyelesaikan Chapter 14. Anda sekarang memiliki:

- ✅ **Mastery of Flutter DevTools** untuk debugging yang efektif
- ✅ **Performance profiling skills** untuk optimasi aplikasi
- ✅ **Error handling expertise** untuk aplikasi yang robust
- ✅ **Professional debugging workflow** untuk development yang efisien

### **Achievement Unlocked** 🏆
**🛠️ Flutter Debugging Master** - Anda bisa debug aplikasi Flutter seperti professional developer!

**Next up**: [Chapter 15: Next Steps & Advanced Topics](15-next-steps-advanced-topics.md) - Langkah selanjutnya dalam journey Flutter Anda!

---

### 📚 References
- [Flutter DevTools](https://flutter.dev/docs/development/tools/devtools)
- [Flutter Debugging Guide](https://flutter.dev/docs/testing/debugging)
- [Performance Best Practices](https://flutter.dev/docs/perf/best-practices)
- [Error Handling](https://flutter.dev/docs/testing/errors)