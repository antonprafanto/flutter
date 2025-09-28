# 🔢 Counter App - State Management Practice

[![Flutter](https://img.shields.io/badge/Flutter-Counter_App-blue?style=for-the-badge&logo=flutter)](../../README.md)
[![Beginner](https://img.shields.io/badge/Level-Beginner-green?style=for-the-badge)](../../README.md)

> 🎯 **Master state management with Flutter's classic counter app - enhanced with best practices**

## 📱 About This Project

Counter App adalah proyek klasik untuk mempelajari state management di Flutter. Proyek ini mengajarkan:
- StatefulWidget dan lifecycle
- setState() method untuk updating UI
- Event handling dengan button taps
- State management best practices
- Hot reload untuk rapid development

## 📋 What You'll Learn

- ✅ Perbedaan StatelessWidget vs StatefulWidget
- ✅ State management dengan setState()
- ✅ Widget lifecycle methods
- ✅ User interaction handling
- ✅ Material Design components
- ✅ Code organization patterns

## 🚀 How to Run

1. **Navigate ke project directory:**
   ```bash
   cd projects/counter_app
   ```

2. **Get dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

4. **Try hot reload:**
   - Make changes to the code
   - Press 'r' in terminal untuk hot reload
   - Press 'R' untuk hot restart

## 📁 Project Structure

```
counter_app/
├── lib/
│   ├── main.dart              # Main application entry point
│   ├── screens/
│   │   └── counter_screen.dart # Counter screen implementation
│   └── widgets/
│       └── counter_display.dart # Reusable counter display widget
├── pubspec.yaml               # Dependencies & configuration
└── README.md                 # This file
```

## 💻 Features

### ✨ **Basic Features**
- 🔢 Display current counter value
- ➕ Increment button (+1)
- ➖ Decrement button (-1)
- 🔄 Reset counter to zero
- 🎨 Beautiful Material Design UI

### 🚀 **Enhanced Features**
- 📊 Counter value persistence (remembers last value)
- 🎨 Dynamic color changes based on value
- ⚡ Smooth animations
- 🔔 Visual feedback for user actions
- 📱 Responsive design

## 💻 Code Implementation

### main.dart
```dart
import 'package:flutter/material.dart';
import 'screens/counter_screen.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: CounterScreen(),
    );
  }
}
```

### counter_screen.dart
```dart
import 'package:flutter/material.dart';
import '../widgets/counter_display.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _animateButton();
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    _animateButton();
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _animateButton();
  }

  void _animateButton() {
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
  }

  Color _getCounterColor() {
    if (_counter > 0) return Colors.green;
    if (_counter < 0) return Colors.red;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: _getCounterColor(),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetCounter,
            tooltip: 'Reset Counter',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: CounterDisplay(
                    counter: _counter,
                    color: _getCounterColor(),
                  ),
                );
              },
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                  backgroundColor: Colors.red,
                  heroTag: "decrement",
                ),
                FloatingActionButton.extended(
                  onPressed: _resetCounter,
                  tooltip: 'Reset',
                  label: Text('RESET'),
                  icon: Icon(Icons.refresh),
                  backgroundColor: Colors.grey,
                  heroTag: "reset",
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                  backgroundColor: Colors.green,
                  heroTag: "increment",
                ),
              ],
            ),
            SizedBox(height: 30),
            _buildCounterInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterInfo() {
    String message;
    IconData icon;
    Color color = _getCounterColor();

    if (_counter > 0) {
      message = 'Positive number! 📈';
      icon = Icons.trending_up;
    } else if (_counter < 0) {
      message = 'Negative number! 📉';
      icon = Icons.trending_down;
    } else {
      message = 'Zero - perfectly balanced! ⚖️';
      icon = Icons.balance;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          SizedBox(width: 10),
          Text(
            message,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
```

### counter_display.dart
```dart
import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  final int counter;
  final Color color;

  const CounterDisplay({
    Key? key,
    required this.counter,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: color,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '$counter',
          style: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
```

### pubspec.yaml
```yaml
name: counter_app
description: A Flutter counter app demonstrating state management

version: 1.0.0+1

environment:
  sdk: ">=2.17.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
```

## 🔍 Key Concepts Explained

### 1. **StatefulWidget vs StatelessWidget**
```dart
// StatelessWidget - UI tidak berubah
class StaticWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('I never change');
  }
}

// StatefulWidget - UI bisa berubah
class DynamicWidget extends StatefulWidget {
  @override
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Text('Value: $value'); // Bisa berubah!
  }
}
```

### 2. **setState() Method**
```dart
void _incrementCounter() {
  setState(() {
    _counter++;  // Update state
  });
  // Flutter automatically rebuilds UI
}
```

### 3. **Widget Lifecycle**
```dart
class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
    // Called once when widget is created
    print('Widget created!');
  }

  @override
  Widget build(BuildContext context) {
    // Called every time UI needs to rebuild
    print('Widget rebuilt!');
    return Container();
  }

  @override
  void dispose() {
    // Called when widget is removed
    print('Widget disposed!');
    super.dispose();
  }
}
```

### 4. **Animation Integration**
```dart
// Using AnimationController for smooth transitions
AnimationController _controller = AnimationController(
  duration: Duration(milliseconds: 200),
  vsync: this,
);

// Animate when counter changes
void _animateButton() {
  _controller.forward().then((_) {
    _controller.reverse();
  });
}
```

## 🎨 Customization Ideas

### **Color Themes**
```dart
// Add different color schemes
Color _getThemeColor() {
  switch (_counter % 3) {
    case 0: return Colors.blue;
    case 1: return Colors.purple;
    case 2: return Colors.orange;
    default: return Colors.blue;
  }
}
```

### **Sound Effects**
```dart
// Add audio feedback (requires audioplayers package)
void _playSound() {
  // AudioPlayer().play('assets/sounds/click.mp3');
}
```

### **Haptic Feedback**
```dart
import 'package:flutter/services.dart';

void _incrementCounter() {
  HapticFeedback.lightImpact(); // Vibrate on tap
  setState(() {
    _counter++;
  });
}
```

## 🎯 Learning Challenges

### **Challenge 1: Add Step Counter**
Modify the app to increment/decrement by different values (1, 5, 10)

### **Challenge 2: Multiple Counters**
Create multiple independent counters on the same screen

### **Challenge 3: Counter History**
Add functionality to track and display counter history

### **Challenge 4: Persistence**
Save counter value and restore it when app restarts

### **Challenge 5: Custom Animations**
Add more creative animations when counter changes

## 🧪 Testing Ideas

### **Manual Testing**
- ✅ Tap increment button multiple times
- ✅ Tap decrement button to negative numbers
- ✅ Use reset button
- ✅ Hot reload while app is running
- ✅ Test on different screen sizes

### **Unit Tests**
```dart
// Example unit test
test('Counter should increment', () {
  int counter = 0;
  counter++;
  expect(counter, 1);
});
```

### **Widget Tests**
```dart
// Example widget test
testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  await tester.pumpWidget(CounterApp());

  expect(find.text('0'), findsOneWidget);

  await tester.tap(find.byIcon(Icons.add));
  await tester.pump();

  expect(find.text('1'), findsOneWidget);
});
```

## 📚 What's Next?

After mastering this counter app:

1. 🎯 **State Management Patterns**
   - Learn Provider pattern
   - Explore BLoC architecture
   - Try Riverpod

2. 📱 **More Complex Apps**
   - [Todo List App](../todo_list_app/README.md)
   - Shopping cart app
   - Weather app

3. 📖 **Tutorial Sections**
   - [Section 8: State Management](../../docs/08-state-management-sederhana.md)
   - [Section 9: Navigation](../../docs/09-navigasi-routing.md)

## 🔗 Related Resources

- 📚 [Flutter State Management](https://flutter.dev/docs/development/data-and-backend/state-mgmt)
- 🎥 [StatefulWidget Explained](https://www.youtube.com/watch?v=AqCMFXEmf3w)
- 📖 [Animation Tutorial](https://flutter.dev/docs/development/ui/animations)

## ⚡ Pro Tips

### **Performance Tips**
```dart
// Use const constructors where possible
const Text('Static text')

// Extract widgets to methods
Widget _buildButton() {
  return FloatingActionButton(
    onPressed: _increment,
    child: Icon(Icons.add),
  );
}
```

### **Code Organization**
```dart
// Group related methods
void _incrementCounter() { /* ... */ }
void _decrementCounter() { /* ... */ }
void _resetCounter() { /* ... */ }

// Separate business logic from UI
class CounterLogic {
  static int increment(int value) => value + 1;
  static int decrement(int value) => value - 1;
  static int reset() => 0;
}
```

### **Debugging Tips**
```dart
// Add debug prints
void _incrementCounter() {
  debugPrint('Before increment: $_counter');
  setState(() {
    _counter++;
  });
  debugPrint('After increment: $_counter');
}
```

## 🎊 Congratulations!

You've built a professional counter app! 🎉

**Key Achievements:**
- ✅ Mastered StatefulWidget and setState()
- ✅ Implemented user interaction handling
- ✅ Created smooth animations
- ✅ Applied Material Design principles
- ✅ Organized code with best practices

**Skills Gained:**
- 🔄 State management fundamentals
- 🎨 UI/UX design principles
- ⚡ Animation implementation
- 🏗️ Code organization patterns
- 🧪 Testing approaches

**Next Steps:**
- Build the Todo List app
- Explore advanced state management
- Add persistent storage
- Implement more complex animations

---

**Ready for the next challenge?** Let's build a [Todo List App](../todo_list_app/README.md)! 🚀