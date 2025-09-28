# 👋 Hello World Flutter App

[![Flutter](https://img.shields.io/badge/Flutter-Hello_World-blue?style=for-the-badge&logo=flutter)](../../README.md)
[![Beginner](https://img.shields.io/badge/Level-Beginner-green?style=for-the-badge)](../../README.md)

> 🎯 **Your very first Flutter application - simple, clean, and educational**

## 📱 About This Project

Ini adalah aplikasi Flutter pertama yang sangat sederhana untuk memahami:
- Struktur dasar aplikasi Flutter
- Widget fundamental (MaterialApp, Scaffold, Text)
- Hot reload development workflow
- Cara menjalankan aplikasi Flutter

## 📋 What You'll Learn

- ✅ Struktur project Flutter
- ✅ Widget tree concept
- ✅ Material Design basics
- ✅ Hot reload workflow
- ✅ Running Flutter apps

## 🚀 How to Run

1. **Pastikan Flutter sudah terinstall:**
   ```bash
   flutter doctor
   ```

2. **Navigate ke project directory:**
   ```bash
   cd projects/hello_world
   ```

3. **Get dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
hello_world/
├── lib/
│   └── main.dart          # Main application file
├── pubspec.yaml           # Dependencies & configuration
└── README.md             # This file
```

## 💻 Code Explanation

### main.dart
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());  // Entry point - launches the app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(     // Root widget providing Material Design
      title: 'Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),   // First screen to show
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(        // Basic layout structure
      appBar: AppBar(
        title: Text('Hello World App'),
      ),
      body: Center(         // Centers child widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, World! 👋',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Flutter!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🔍 Code Breakdown

### 1. **Import Statement**
```dart
import 'package:flutter/material.dart';
```
- Imports Material Design widgets
- Provides UI components like Scaffold, AppBar, Text

### 2. **Main Function**
```dart
void main() {
  runApp(MyApp());
}
```
- Entry point of the application
- `runApp()` tells Flutter to run the app
- `MyApp()` is the root widget

### 3. **Root Widget (MyApp)**
```dart
class MyApp extends StatelessWidget {
  // MaterialApp configuration
}
```
- Extends `StatelessWidget` (doesn't change)
- Returns `MaterialApp` with app configuration
- Sets theme, title, and home screen

### 4. **Home Screen (MyHomePage)**
```dart
class MyHomePage extends StatelessWidget {
  // UI layout definition
}
```
- Also extends `StatelessWidget`
- Uses `Scaffold` for basic layout
- Contains `AppBar` and `body`

### 5. **UI Layout**
```dart
body: Center(
  child: Column(
    children: <Widget>[
      Text('Hello, World! 👋'),
      Text('Welcome to Flutter!'),
    ],
  ),
)
```
- `Center` widget centers its child
- `Column` arranges children vertically
- `Text` widgets display the messages

## 🎨 Customization Ideas

Try modifying the app to practice:

### 1. **Change Colors**
```dart
// In MyApp class
theme: ThemeData(
  primarySwatch: Colors.green,  // Try different colors
),

// In Text widgets
color: Colors.red,  // Change text color
```

### 2. **Add More Text**
```dart
children: <Widget>[
  Text('Hello, World! 👋'),
  Text('Welcome to Flutter!'),
  Text('This is my first app!'),  // Add new text
],
```

### 3. **Change Font Size**
```dart
style: TextStyle(
  fontSize: 50,  // Make it bigger
  fontWeight: FontWeight.bold,
),
```

### 4. **Add Icon**
```dart
children: <Widget>[
  Icon(
    Icons.star,
    size: 50,
    color: Colors.yellow,
  ),
  Text('Hello, World! 👋'),
  // ... rest of the text widgets
],
```

## 🎯 Learning Challenges

### **Challenge 1: Personal Greeting**
Modify the app to show your name instead of "World"

### **Challenge 2: Add More Elements**
Add an icon, change colors, and customize the layout

### **Challenge 3: Experiment with Widgets**
Try adding different widgets like `Container`, `Padding`, or `Card`

### **Challenge 4: Hot Reload Practice**
Make changes and use hot reload (press 'r' in terminal) to see instant updates

## 📚 What's Next?

After mastering this simple app:

1. 📱 **[Counter App](../counter_app/README.md)** - Learn about state management
2. ✅ **[Todo List App](../todo_list_app/README.md)** - Build a complete functional app
3. 📖 **[Tutorial Section 5](../../docs/05-proyek-pertama.md)** - Detailed first project guide

## 🔗 Related Resources

- 📚 [Flutter Widget Catalog](https://flutter.dev/docs/development/ui/widgets)
- 🎥 [Flutter Widget of the Week](https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG)
- 📖 [Material Design Guidelines](https://material.io/design)

## 🎊 Congratulations!

You've successfully run your first Flutter app! 🎉

**Key Takeaways:**
- ✅ Flutter apps start with `main()` function
- ✅ Everything in Flutter is a widget
- ✅ Widgets are arranged in a tree structure
- ✅ Hot reload makes development fast and fun
- ✅ Material Design provides beautiful UI components

**Next Steps:**
- Experiment with the code
- Try the customization ideas
- Move on to the Counter App
- Join the Flutter community!

---

**Happy Coding!** 🚀