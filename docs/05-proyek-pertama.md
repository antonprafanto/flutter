# 🚀 Chapter 5: Proyek Pertama

[![Progress](https://img.shields.io/badge/Progress-Chapter%205%2F15-blue?style=for-the-badge)](../README.md)
[![Difficulty](https://img.shields.io/badge/Difficulty-Beginner-green?style=for-the-badge)](../README.md)
[![Estimated Time](https://img.shields.io/badge/Time-2--3%20hours-orange?style=for-the-badge)](../README.md)

> 🎯 **Learning Objectives**: Setelah chapter ini, Anda akan membuat aplikasi Flutter pertama dari nol, memahami struktur project, dan menjalankannya di device/emulator.

## 📋 Daftar Isi
- [Membuat Project Baru](#-membuat-project-baru)
- [Struktur Project Flutter](#-struktur-project-flutter)
- [Memahami pubspec.yaml](#-memahami-pubspecyaml)
- [Anatomy of main.dart](#-anatomy-of-maindart)
- [Modifikasi Aplikasi Pertama](#-modifikasi-aplikasi-pertama)
- [Running & Testing](#-running--testing)
- [Hot Reload in Action](#-hot-reload-in-action)
- [Build Your First Custom App](#-build-your-first-custom-app)
- [Common Issues & Solutions](#-common-issues--solutions)

---

## 🛠️ Membuat Project Baru

### 📱 **Method 1: Command Line (Recommended)**

```bash
# Buat project Flutter baru
flutter create my_first_app

# Masuk ke direktori project
cd my_first_app

# Lihat struktur yang dibuat
ls -la  # macOS/Linux
dir     # Windows

# Jalankan aplikasi
flutter run
```

### 🎨 **Method 2: Android Studio**

```bash
# Steps di Android Studio:
# 1. File → New → New Flutter Project
# 2. Pilih "Flutter Application"
# 3. Set project name: my_first_app
# 4. Set project location
# 5. Set description: "My first Flutter application"
# 6. Click "Next" → "Finish"
```

### 💻 **Method 3: VS Code**

```bash
# Steps di VS Code:
# 1. Ctrl+Shift+P (Command Palette)
# 2. Type "Flutter: New Project"
# 3. Select "Application"
# 4. Choose folder location
# 5. Enter project name: my_first_app
```

### ⚙️ **Project Creation Options**

```bash
# Create with specific options
flutter create \
  --org com.example \
  --project-name my_first_app \
  --description "My first Flutter application" \
  --platforms android,ios,web \
  my_first_app

# Create with different templates
flutter create --template=app my_first_app      # Default app
flutter create --template=module my_module     # Add to existing native app
flutter create --template=package my_package   # Dart package
flutter create --template=plugin my_plugin     # Platform plugin
```

---

## 📁 Struktur Project Flutter

### 🗂️ **Project Directory Overview**

```
my_first_app/
├── 📁 android/          # Android-specific code & config
├── 📁 ios/              # iOS-specific code & config
├── 📁 lib/              # 🎯 Your Dart code goes here
│   └── 📄 main.dart     # 🎯 Entry point of your app
├── 📁 test/             # Unit & widget tests
├── 📁 web/              # Web-specific files
├── 📁 windows/          # Windows desktop files
├── 📁 macos/            # macOS desktop files
├── 📁 linux/            # Linux desktop files
├── 📄 pubspec.yaml      # 🎯 Dependencies & config
├── 📄 pubspec.lock      # Locked dependency versions
├── 📄 analysis_options.yaml  # Code analysis rules
└── 📄 README.md         # Project documentation
```

### 🎯 **Key Directories Explained**

#### 📱 **lib/ - Your Main Code**
```dart
lib/
├── main.dart           # App entry point
├── screens/            # Different app screens
│   ├── home_screen.dart
│   └── profile_screen.dart
├── widgets/            # Reusable widgets
│   ├── custom_button.dart
│   └── user_card.dart
├── models/             # Data models
│   └── user.dart
├── services/           # API calls, database
│   └── api_service.dart
└── utils/              # Helper functions
    └── constants.dart
```

#### 📦 **Dependencies Management**
```yaml
# pubspec.yaml structure
name: my_first_app
description: My first Flutter application
version: 1.0.0+1

environment:
  sdk: ">=2.17.0 <4.0.0"

dependencies:          # Runtime dependencies
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

dev_dependencies:      # Development-only dependencies
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:               # Flutter-specific config
  uses-material-design: true
  assets:
    - images/
  fonts:
    - family: Roboto
      fonts:
        - asset: fonts/Roboto-Regular.ttf
```

---

## 📄 Memahami pubspec.yaml

### 🔧 **Basic Configuration**

```yaml
# Project metadata
name: my_first_app                    # Project identifier
description: My first Flutter app     # Project description
version: 1.0.0+1                     # version+buildNumber

# Dart/Flutter constraints
environment:
  sdk: ">=2.17.0 <4.0.0"              # Dart SDK version
  flutter: ">=3.0.0"                  # Flutter version (optional)
```

### 📦 **Dependencies Section**

```yaml
dependencies:
  flutter:
    sdk: flutter                      # Flutter framework

  # UI & Material Design
  cupertino_icons: ^1.0.2            # iOS-style icons
  material_color_utilities: ^0.2.0    # Color utilities

  # State Management
  provider: ^6.0.5                   # Popular state management
  bloc: ^8.1.2                       # BLoC pattern

  # Network & Data
  http: ^0.13.5                      # HTTP requests
  dio: ^5.3.2                        # Advanced HTTP client
  shared_preferences: ^2.2.2         # Local storage

  # Utilities
  intl: ^0.18.1                      # Internationalization
  path: ^1.8.3                       # File path utilities

dev_dependencies:
  flutter_test:
    sdk: flutter                      # Testing framework
  flutter_lints: ^2.0.0              # Code analysis
  build_runner: ^2.4.7               # Code generation
```

### 🎨 **Assets Configuration**

```yaml
flutter:
  uses-material-design: true          # Enable Material Design

  # Images & other assets
  assets:
    - assets/images/                  # All images in folder
    - assets/images/logo.png          # Specific image
    - assets/data/config.json         # JSON files
    - assets/icons/                   # Custom icons

  # Custom fonts
  fonts:
    - family: CustomFont
      fonts:
        - asset: assets/fonts/CustomFont-Regular.ttf
        - asset: assets/fonts/CustomFont-Bold.ttf
          weight: 700
        - asset: assets/fonts/CustomFont-Italic.ttf
          style: italic

    - family: AnotherFont
      fonts:
        - asset: assets/fonts/AnotherFont.ttf
```

### ⚠️ **Common pubspec.yaml Mistakes**

```yaml
# ❌ Wrong indentation
flutter:
uses-material-design: true            # Should be indented

# ✅ Correct indentation
flutter:
  uses-material-design: true

# ❌ Wrong asset path
assets:
  - image/logo.png                    # Folder doesn't exist

# ✅ Correct asset path
assets:
  - assets/images/logo.png

# ❌ Missing dependency version
dependencies:
  http:                               # No version specified

# ✅ Correct dependency version
dependencies:
  http: ^0.13.5
```

---

## 🧭 Anatomy of main.dart

### 📱 **Default Generated Code**

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

### 🔍 **Code Breakdown**

#### 🚀 **Entry Point**
```dart
void main() {
  runApp(const MyApp());              // Start the Flutter app
}

// Alternative with error handling
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
```

#### 🏗️ **App Widget (Root)**
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(              // App wrapper
      title: 'Flutter Demo',         // App title (for task switcher)
      theme: ThemeData(              // App theme
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple
        ),
        useMaterial3: true,          // Use Material 3 design
      ),
      home: const MyHomePage(        // Initial screen
        title: 'Flutter Demo Home Page'
      ),
    );
  }
}
```

#### 📱 **Home Screen Widget**
```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;                // Immutable property

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;                  // Mutable state

  void _incrementCounter() {
    setState(() {                    // Trigger rebuild
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(                 // Page structure
      appBar: AppBar(               // Top bar
        title: Text(widget.title),   // Access widget property
      ),
      body: Center(                 // Center content
        child: Column(              // Vertical layout
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',           // Display state
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // Handle tap
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

---

## ✏️ Modifikasi Aplikasi Pertama

### 🎨 **Customization 1: Change Theme & Colors**

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',  // Updated title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,     // Changed from deepPurple
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,          // Center app bar title
          elevation: 4,               // Add shadow
        ),
      ),
      home: const MyHomePage(title: 'Welcome to Flutter! 🚀'),
    );
  }
}
```

### 🔄 **Customization 2: Enhanced Counter with More Features**

```dart
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _message = 'Start counting!';

  void _incrementCounter() {
    setState(() {
      _counter++;
      _updateMessage();
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
      _updateMessage();
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _updateMessage();
    });
  }

  void _updateMessage() {
    if (_counter == 0) {
      _message = 'Start counting!';
    } else if (_counter < 5) {
      _message = 'Getting started! 🌱';
    } else if (_counter < 10) {
      _message = 'You\'re doing great! 💪';
    } else if (_counter < 20) {
      _message = 'Awesome progress! 🚀';
    } else {
      _message = 'Counter master! 🏆';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetCounter,
            tooltip: 'Reset Counter',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to your first Flutter app!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Counter display with background
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      _message,
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Button row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _decrementCounter,
                    icon: const Icon(Icons.remove),
                    label: const Text('Decrease'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      foregroundColor: Colors.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _incrementCounter,
                    icon: const Icon(Icons.add),
                    label: const Text('Increase'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _resetCounter,
        icon: const Icon(Icons.refresh),
        label: const Text('Reset'),
        tooltip: 'Reset to zero',
      ),
    );
  }
}
```

---

## ▶️ Running & Testing

### 🚀 **Running Your App**

```bash
# Method 1: Command line
flutter run

# Method 2: With specific device
flutter devices                      # List available devices
flutter run -d chrome               # Run on Chrome browser
flutter run -d "iPhone Simulator"   # Run on iOS simulator
flutter run -d emulator-5554        # Run on Android emulator

# Method 3: Debug mode with verbose output
flutter run --debug --verbose

# Method 4: Release mode (optimized)
flutter run --release
```

### 🔧 **Development Commands**

```bash
# While app is running, press:
r       # Hot reload (apply changes instantly)
R       # Hot restart (restart app, lose state)
q       # Quit
h       # Help
c       # Clear console
o       # Switch between portrait/landscape (simulator)
```

### 🐛 **Debugging Commands**

```bash
# Check for issues
flutter doctor

# Analyze code
flutter analyze

# Format code
flutter format .

# Run tests
flutter test

# Clean build cache
flutter clean
flutter packages get
```

---

## 🔥 Hot Reload in Action

### ⚡ **Experience Hot Reload**

1. **Start your app**:
   ```bash
   flutter run
   ```

2. **Make changes** (try these one by one):
   ```dart
   // Change 1: Update title
   title: 'My Amazing Counter App! 🎉'

   // Change 2: Change colors
   seedColor: Colors.orange

   // Change 3: Add emoji to counter
   Text('$_counter 🎯')

   // Change 4: Change button text
   label: const Text('Add One!')
   ```

3. **Save file** (Ctrl+S) and watch changes appear instantly!

### 🎯 **Hot Reload Best Practices**

```dart
// ✅ Works great with hot reload
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Change this text!'); // Changes appear instantly
  }
}

// ✅ State changes also work
void _updateCounter() {
  setState(() {
    _counter++; // State updates show immediately
  });
}

// ❌ Requires hot restart
@override
void initState() {
  super.initState();
  // Changes here need hot restart
}

// ❌ Global variables need hot restart
final String globalValue = 'Changes here need restart';
```

### 🔄 **Hot Reload vs Hot Restart**

| Scenario | Hot Reload (r) | Hot Restart (R) |
|----------|----------------|-----------------|
| Change widget text | ✅ Works | ✅ Works |
| Change colors/styles | ✅ Works | ✅ Works |
| Add/remove widgets | ✅ Works | ✅ Works |
| Change initState() | ❌ Needs restart | ✅ Works |
| Change main() function | ❌ Needs restart | ✅ Works |
| Change global variables | ❌ Needs restart | ✅ Works |
| Add new imports | ❌ Needs restart | ✅ Works |

---

## 🎨 Build Your First Custom App

### 🎯 **Project: Personal Profile App**

Mari kita buat aplikasi profil personal yang simple tapi menarik:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Profile data (customize with your info!)
  final String _name = 'John Doe';
  final String _role = 'Flutter Developer';
  final String _email = 'john.doe@email.com';
  final String _phone = '+62 123 456 789';
  final String _bio = 'Passionate Flutter developer learning to build beautiful mobile applications. Love coding, coffee, and creating user-friendly interfaces.';

  // Skills with progress levels
  final Map<String, double> _skills = {
    'Flutter': 0.7,
    'Dart': 0.8,
    'UI/UX Design': 0.6,
    'Problem Solving': 0.9,
  };

  // Stats
  int _projectsCompleted = 5;
  int _coffeesCounted = 42;
  int _linesOfCode = 1337;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 30),
            _buildStatsCards(),
            const SizedBox(height: 30),
            _buildSkillsSection(),
            const SizedBox(height: 30),
            _buildContactSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 60,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            _name,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            _role,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            _bio,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCards() {
    return Row(
      children: [
        Expanded(child: _buildStatCard('Projects', _projectsCompleted, Icons.code, Colors.blue)),
        const SizedBox(width: 15),
        Expanded(child: _buildStatCard('Coffees', _coffeesCounted, Icons.coffee, Colors.brown)),
        const SizedBox(width: 15),
        Expanded(child: _buildStatCard('Lines of Code', _linesOfCode, Icons.terminal, Colors.green)),
      ],
    );
  }

  Widget _buildStatCard(String title, int value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 10),
          Text(
            '$value',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Skills',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ..._skills.entries.map((skill) => _buildSkillBar(skill.key, skill.value)),
        ],
      ),
    );
  }

  Widget _buildSkillBar(String skill, double progress) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
            minHeight: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildContactItem(Icons.email, 'Email', _email),
          const SizedBox(height: 15),
          _buildContactItem(Icons.phone, 'Phone', _phone),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Thanks for viewing my profile! 🚀'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: const Icon(Icons.thumb_up),
              label: const Text('Say Hello!'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
```

### 🎯 **Customization Tasks**

Sekarang customize aplikasi dengan info Anda sendiri:

1. **Update Profile Info**:
   ```dart
   final String _name = 'Your Name Here';
   final String _role = 'Your Role/Title';
   final String _email = 'your.email@example.com';
   final String _bio = 'Write your bio here...';
   ```

2. **Update Skills**:
   ```dart
   final Map<String, double> _skills = {
     'Your Skill 1': 0.8,
     'Your Skill 2': 0.6,
     'Your Skill 3': 0.9,
     'Your Skill 4': 0.7,
   };
   ```

3. **Update Stats**:
   ```dart
   int _projectsCompleted = 10;    // Your projects
   int _coffeesCounted = 100;      // Your coffee count
   int _linesOfCode = 5000;        // Your code lines
   ```

4. **Experiment with Colors**:
   ```dart
   // Try different color schemes
   seedColor: Colors.teal,         // Green theme
   seedColor: Colors.orange,       // Orange theme
   seedColor: Colors.purple,       // Purple theme
   ```

---

## 🐛 Common Issues & Solutions

### ⚠️ **Issue 1: "flutter: command not found"**

```bash
# Solution: Add Flutter to PATH
# Check current PATH
echo $PATH

# Add to ~/.bashrc or ~/.zshrc
export PATH="$PATH:/path/to/flutter/bin"

# Reload shell
source ~/.bashrc  # or source ~/.zshrc
```

### ⚠️ **Issue 2: "No connected devices"**

```bash
# Check available devices
flutter devices

# Solutions:
# 1. Start Android emulator
# 2. Connect physical device with USB debugging
# 3. Use Chrome for web development
flutter run -d chrome
```

### ⚠️ **Issue 3: Build failures**

```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run

# Check for dependency issues
flutter doctor
flutter pub deps
```

### ⚠️ **Issue 4: Hot reload not working**

```bash
# Possible causes and solutions:
# 1. Save file after making changes (Ctrl+S)
# 2. Changes in initState() require hot restart (R)
# 3. Syntax errors prevent hot reload
# 4. Try hot restart instead: press 'R'
```

### ⚠️ **Issue 5: Import errors**

```dart
// ❌ Wrong import
import 'package:flutter/material.dart'  // Missing semicolon

// ✅ Correct import
import 'package:flutter/material.dart';

// ❌ Wrong package name
import 'package:myapp/home.dart';       // Should match pubspec.yaml name

// ✅ Correct package name
import 'package:my_first_app/home.dart';
```

---

## 🎯 **Practice Exercises**

### 🏃‍♂️ **Exercise 1: Modify Counter App**
- Add a "Reset" button
- Change counter to start from 10
- Add color changes based on counter value
- Show different messages for even/odd numbers

### 🎨 **Exercise 2: Create Business Card App**
- Display your name, title, company
- Add contact information
- Include social media links
- Use Cards and attractive layouts

### 🎲 **Exercise 3: Build a Dice Rolling App**
- Show dice image/number
- Roll button to generate random number 1-6
- Keep track of roll history
- Add sound effects (optional)

---

## 🎓 Chapter Summary

Congratulations! Anda telah membuat aplikasi Flutter pertama. Sekarang Anda tahu:

### ✅ **What You've Accomplished**
- ✅ Created your first Flutter project
- ✅ Understanding project structure
- ✅ Modified and customized applications
- ✅ Experienced hot reload magic
- ✅ Built a complete profile app from scratch
- ✅ Learned debugging and troubleshooting

### 🎯 **Key Skills Acquired**
- **Project Creation**: Multiple methods (CLI, IDE)
- **File Structure**: Understanding what goes where
- **pubspec.yaml**: Managing dependencies and assets
- **Hot Reload**: Instant development feedback
- **Basic Widgets**: Scaffold, AppBar, Text, Buttons
- **Layout**: Column, Row, Container, Padding
- **Styling**: Colors, themes, decorations

### 🚀 **Ready for More**
Dengan first project yang solid, Anda siap untuk:
- Explore widget library yang luas
- Build more complex layouts
- Learn advanced styling techniques
- Implement navigation between screens

---

<div align="center">

### 🎯 **Achievement Unlocked!**
![First Project Master Badge](../assets/badges/first-project-master.png)

**🚀 First Project Master** - Built Your First Flutter Application

---

**Ready to dive into widgets and layouts?**

[⬅️ Previous: Flutter Concepts](04-konsep-dasar-flutter.md) | [➡️ Next: Widgets & Layouts](06-widget-dasar-layout.md)

---

**💬 Project Issues?** Check [troubleshooting](#-common-issues--solutions) atau open an [issue](../../issues)

</div>