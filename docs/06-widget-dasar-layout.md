# 🎨 Chapter 6: Widget Dasar & Layout

[![Progress](https://img.shields.io/badge/Progress-Chapter%206%2F15-blue?style=for-the-badge)](../README.md)
[![Difficulty](https://img.shields.io/badge/Difficulty-Intermediate-yellow?style=for-the-badge)](../README.md)
[![Estimated Time](https://img.shields.io/badge/Time-4--5%20hours-orange?style=for-the-badge)](../README.md)

> 🎯 **Learning Objectives**: Setelah chapter ini, Anda akan menguasai widget dasar Flutter dan sistem layout untuk membuat UI yang beautiful dan responsive.

## 📋 Daftar Isi
- [Flutter Widget Library](#-flutter-widget-library)
- [Basic UI Widgets](#-basic-ui-widgets)
- [Layout Widgets](#-layout-widgets)
- [Container & Decorations](#-container--decorations)
- [Images & Assets](#-images--assets)
- [Buttons & Interactions](#-buttons--interactions)
- [Lists & Scrolling](#-lists--scrolling)
- [Forms & Input](#-forms--input)
- [Responsive Design Basics](#-responsive-design-basics)
- [Layout Challenges](#-layout-challenges)

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
>       title: 'Flutter App',
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

## 📚 Flutter Widget Library

### 🧩 **Widget Categories Overview**

Flutter provides 400+ widgets organized in categories:

```dart
// UI Widgets (Visual Elements)
Text()                    // Display text
Image()                   // Display images
Icon()                    // Display icons
Card()                    // Material design card

// Layout Widgets (Structure & Positioning)
Container()               // Box with decoration
Row()                     // Horizontal layout
Column()                  // Vertical layout
Stack()                   // Overlapping widgets
Padding()                 // Add padding
Center()                  // Center widgets

// Interactive Widgets (User Input)
ElevatedButton()          // Raised button
TextField()               // Text input
Checkbox()                // Checkbox input
Switch()                  // Toggle switch

// Scrolling Widgets (Large Content)
ListView()                // Scrollable list
GridView()                // Grid layout
SingleChildScrollView()   // Scrollable container
PageView()                // Swipeable pages

// Navigation & Structure
Scaffold()                // Page structure
AppBar()                  // Top bar
Drawer()                  // Side menu
BottomNavigationBar()     // Bottom navigation
```

### 🔄 **Widget Composition Pattern**

Flutter uses composition over inheritance:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Scaffold(body: MyCustomWidget()),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Instead of extending widgets, we compose them
class MyCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(              // Layout widget
      padding: EdgeInsets.all(16), // Spacing
      child: Card(                 // Visual wrapper
        child: Column(             // Layout arrangement
          children: [
            Text('Title'),         // Content widget
            Image.asset('...'),    // Media widget
            ElevatedButton(        // Interactive widget
              onPressed: () {},
              child: Text('Action'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 📝 Basic UI Widgets

### 📖 **Text Widget - Typography Master**

```dart
class TextExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic text
        Text('Hello Flutter!'),

        // Styled text
        Text(
          'Styled Text',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),

        // Text with theme
        Text(
          'Theme Text',
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        // Rich text (multiple styles)
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(text: 'Hello '),
              TextSpan(
                text: 'Flutter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              TextSpan(text: ' World!'),
            ],
          ),
        ),

        // Text with overflow handling
        Container(
          width: 100,
          child: Text(
            'This is a very long text that will overflow',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),

        // Selectable text
        SelectableText(
          'This text can be selected and copied',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
```

### 🖼️ **Image Widget - Visual Content**

```dart
class ImageExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Asset image
        Image.asset(
          'assets/images/flutter_logo.png',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),

        // Network image
        Image.network(
          'https://picsum.photos/200/200',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.error, size: 200);
          },
        ),

        // Circular avatar
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage('https://picsum.photos/100/100'),
          child: Text('AB'), // Fallback text
        ),

        // Decorated image
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              'https://picsum.photos/300/200',
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
```

### 🎯 **Icon Widget - Visual Indicators**

#### 📱 **Full Working Example:**

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(IconDemoApp());
}

class IconDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icon Widget Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IconExamplesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IconExamplesScreen extends StatefulWidget {
  @override
  _IconExamplesScreenState createState() => _IconExamplesScreenState();
}

class _IconExamplesScreenState extends State<IconExamplesScreen> {
  bool _isFavorite = false;
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Widget Examples'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Basic Icons'),
            _buildBasicIcons(),

            SizedBox(height: 32),
            _buildSectionTitle('Interactive Icons'),
            _buildInteractiveIcons(),

            SizedBox(height: 32),
            _buildSectionTitle('Icon Buttons'),
            _buildIconButtons(),

            SizedBox(height: 32),
            _buildSectionTitle('Decorated Icons'),
            _buildDecoratedIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue[800],
      ),
    );
  }

  Widget _buildBasicIcons() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            // Basic icons with different sizes and colors
            Column(
              children: [
                Icon(Icons.home, size: 30),
                Text('Home', style: TextStyle(fontSize: 12)),
              ],
            ),
            Column(
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 30),
                Text('Favorite', style: TextStyle(fontSize: 12)),
              ],
            ),
            Column(
              children: [
                Icon(Icons.star, size: 40, color: Colors.orange),
                Text('Star', style: TextStyle(fontSize: 12)),
              ],
            ),
            Column(
              children: [
                Icon(Icons.settings, size: 35, color: Colors.grey[600]),
                Text('Settings', style: TextStyle(fontSize: 12)),
              ],
            ),
            Column(
              children: [
                Icon(Icons.notifications, size: 30, color: Colors.purple),
                Text('Notifications', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractiveIcons() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.grey,
                        size: 40,
                      ),
                      Text(_isFavorite ? 'Favorited!' : 'Tap to favorite'),
                    ],
                  ),
                ),

                Column(
                  children: [
                    Text('Rating: $_rating/5'),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _rating = index + 1;
                            });
                          },
                          child: Icon(
                            index < _rating ? Icons.star : Icons.star_border,
                            color: Colors.orange,
                            size: 30,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButtons() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Share button pressed!')),
                );
              },
              icon: Icon(Icons.share),
              tooltip: 'Share',
            ),

            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Download started!')),
                );
              },
              icon: Icon(Icons.download),
              color: Colors.blue,
              tooltip: 'Download',
            ),

            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Deleted!')),
                );
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDecoratedIcons() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            // Icon with circular background
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Colors.white, size: 24),
            ),

            // Icon with rounded rectangle background
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.check, color: Colors.white, size: 24),
            ),

            // Icon with gradient background
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.pink],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.favorite, color: Colors.white, size: 24),
            ),

            // Icon with shadow
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(Icons.star, color: Colors.white, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}
```

> 🎮 **Try it Interactive!**
> [**► Run this code on DartPad**](https://dartpad.dev/?id=icon-widget-demo)
> Experiment dengan interactive icons dan lihat berbagai styling options!
        Icon(
          Icons.flutter_dash,
          size: 50,
          color: Colors.blue,
        ),

        // Icon with badge
        Stack(
          children: [
            Icon(Icons.notifications, size: 40),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
```

---

## 📐 Layout Widgets

### 📏 **Column & Row - Linear Layouts**

```dart
class LinearLayoutExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Basic Column
          Container(
            height: 200,
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(color: Colors.red, width: 50, height: 50),
                Container(color: Colors.green, width: 50, height: 50),
                Container(color: Colors.blue, width: 50, height: 50),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Basic Row
          Container(
            height: 100,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(color: Colors.red, width: 50, height: 50),
                Container(color: Colors.green, width: 50, height: 50),
                Container(color: Colors.blue, width: 50, height: 50),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Flexible and Expanded
          Container(
            height: 100,
            color: Colors.grey[200],
            child: Row(
              children: [
                // Fixed width
                Container(color: Colors.red, width: 50, height: 50),

                // Takes available space
                Expanded(
                  child: Container(color: Colors.green, height: 50),
                ),

                // Takes 2x space compared to other Expanded
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.blue, height: 50),
                ),

                // Flexible (takes only needed space)
                Flexible(
                  child: Container(color: Colors.orange, width: 30, height: 50),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Nested layouts
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
              children: [
                Text('User Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person, size: 30),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Flutter Developer', style: TextStyle(color: Colors.grey[600])),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              Text('4.9'),
                              SizedBox(width: 16),
                              Icon(Icons.location_on, color: Colors.grey, size: 16),
                              Text('Jakarta'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### 📚 **Stack - Overlapping Widgets**

```dart
class StackExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Basic Stack
        Container(
          height: 200,
          child: Stack(
            children: [
              // Background
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.blue[100],
              ),

              // Positioned widgets
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),

              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
              ),

              // Centered widget
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(Icons.play_arrow, size: 40),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Profile card with Stack
        Container(
          height: 200,
          margin: EdgeInsets.all(16),
          child: Stack(
            children: [
              // Background image
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.purple, Colors.blue],
                  ),
                ),
              ),

              // Profile info at bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Flutter Developer',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Favorite button
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
```

### 🎯 **Alignment & Positioning**

```dart
class AlignmentExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Align widget
        Container(
          height: 150,
          width: double.infinity,
          color: Colors.grey[200],
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ),
        ),

        SizedBox(height: 20),

        // Center widget
        Container(
          height: 150,
          width: double.infinity,
          color: Colors.grey[200],
          child: Center(
            child: Text('Centered Text', style: TextStyle(fontSize: 18)),
          ),
        ),

        SizedBox(height: 20),

        // Custom alignment
        Container(
          height: 150,
          width: double.infinity,
          color: Colors.grey[200],
          child: Align(
            alignment: Alignment(0.5, -0.5), // Custom position
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
```

---

## 📦 Container & Decorations

### 🎨 **Container - The Swiss Army Knife**

```dart
class ContainerExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Basic container with color
          Container(
            width: 150,
            height: 100,
            color: Colors.blue,
            child: Center(child: Text('Basic', style: TextStyle(color: Colors.white))),
          ),

          SizedBox(height: 20),

          // Container with decoration
          Container(
            width: 200,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(child: Text('With Shadow')),
          ),

          SizedBox(height: 20),

          // Gradient container
          Container(
            width: 200,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.pink],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'Gradient',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),

          SizedBox(height: 20),

          // Border container
          Container(
            width: 200,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('With Border')),
          ),

          SizedBox(height: 20),

          // Complex decoration
          Container(
            width: 250,
            height: 150,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 1.0,
                colors: [Colors.yellow, Colors.orange, Colors.red],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Complex\nDecoration',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          // Margin and padding
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Margin: 20px all around\nPadding: 24px horizontal, 16px vertical',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
```

### 🎨 **Card Widget - Material Design Cards**

```dart
class CardExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Basic card
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Basic Card'),
            ),
          ),

          // Card with elevation
          Card(
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('High Elevation Card'),
            ),
          ),

          // Custom shaped card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(Icons.star, size: 50, color: Colors.orange),
                  SizedBox(height: 10),
                  Text(
                    'Custom Shape Card',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // Product card example
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://picsum.photos/300/200',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Title',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Product description goes here. This is a beautiful product card example.',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$29.99',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Buy Now'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## 🖼️ Images & Assets

### 📁 **Asset Management**

First, setup assets in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/
    - assets/data/
```

### 🖼️ **Image Widgets in Action**

```dart
class ImageAssetExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Asset image with error handling
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/flutter_logo.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.error, size: 50),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 20),

          // Network image with loading and error states
          Container(
            width: 250,
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://picsum.photos/250/250',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, size: 50, color: Colors.grey),
                        Text('Failed to load image'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 20),

          // Image gallery row
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  margin: EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://picsum.photos/120/120?random=$index',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 20),

          // Profile with image and info
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://picsum.photos/80/80'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Flutter Developer',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            Text('4.9'),
                            SizedBox(width: 16),
                            Icon(Icons.location_on, color: Colors.grey, size: 16),
                            Text('Jakarta'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## 🔘 Buttons & Interactions

### 🎯 **Button Varieties**

```dart
class ButtonExamples extends StatefulWidget {
  @override
  _ButtonExamplesState createState() => _ButtonExamplesState();
}

class _ButtonExamplesState extends State<ButtonExamples> {
  bool _isLoading = false;
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Elevated Button (Primary)
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Elevated Button Pressed!')),
              );
            },
            child: Text('Elevated Button'),
          ),

          SizedBox(height: 16),

          // Outlined Button (Secondary)
          OutlinedButton(
            onPressed: () {},
            child: Text('Outlined Button'),
          ),

          SizedBox(height: 16),

          // Text Button (Tertiary)
          TextButton(
            onPressed: () {},
            child: Text('Text Button'),
          ),

          SizedBox(height: 16),

          // Icon Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
                tooltip: 'Like',
              ),
              IconButton(
                icon: Icon(
                  _isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorited ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorited = !_isFavorited;
                  });
                },
                tooltip: 'Favorite',
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
                tooltip: 'Share',
              ),
            ],
          ),

          SizedBox(height: 16),

          // Custom styled buttons
          Container(
            height: 50,
            child: ElevatedButton.icon(
              icon: Icon(Icons.download),
              label: Text('Download'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {},
            ),
          ),

          SizedBox(height: 16),

          // Loading button
          Container(
            height: 50,
            child: ElevatedButton(
              onPressed: _isLoading ? null : () async {
                setState(() {
                  _isLoading = true;
                });

                // Simulate loading
                await Future.delayed(Duration(seconds: 2));

                setState(() {
                  _isLoading = false;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Action completed!')),
                );
              },
              child: _isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text('Loading...'),
                      ],
                    )
                  : Text('Submit'),
            ),
          ),

          SizedBox(height: 16),

          // Floating Action Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                mini: true,
                child: Icon(Icons.add),
                onPressed: () {},
              ),
              FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () {},
              ),
              FloatingActionButton.extended(
                icon: Icon(Icons.save),
                label: Text('Save'),
                onPressed: () {},
              ),
            ],
          ),

          SizedBox(height: 16),

          // Custom button with gradient
          Container(
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {},
                child: Center(
                  child: Text(
                    'Gradient Button',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 16),

          // Button with multiple actions
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Confirm Action',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Are you sure you want to proceed?'),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text('Confirm'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## 📜 Lists & Scrolling

### 📋 **ListView - Scrollable Lists**

```dart
class ListViewExamples extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ListView Examples'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Basic'),
              Tab(text: 'Builder'),
              Tab(text: 'Separated'),
              Tab(text: 'Custom'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBasicList(),
            _buildBuilderList(),
            _buildSeparatedList(),
            _buildCustomList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicList() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        for (int i = 0; i < 20; i++)
          Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${i + 1}')),
              title: Text('Item ${i + 1}'),
              subtitle: Text('Subtitle for item ${i + 1}'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
      ],
    );
  }

  Widget _buildBuilderList() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text(items[index]),
            subtitle: Text('Description for ${items[index]}'),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped ${items[index]}')),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildSeparatedList() {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.primaries[index % Colors.primaries.length],
            child: Text('${index + 1}'),
          ),
          title: Text(items[index]),
          subtitle: Text('Tap to see details'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        );
      },
    );
  }

  Widget _buildCustomList() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.primaries[index % Colors.primaries.length],
                        Colors.primaries[(index + 1) % Colors.primaries.length],
                      ],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Card Title ${index + 1}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'This is a description for card ${index + 1}. It can contain multiple lines of text.',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${(index + 1) * 10}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Buy'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
```

### 🎛️ **GridView - Grid Layouts**

```dart
class GridViewExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('GridView Examples'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Count'),
              Tab(text: 'Extent'),
              Tab(text: 'Builder'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGridCount(),
            _buildGridExtent(),
            _buildGridBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _buildGridCount() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: List.generate(20, (index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                size: 50,
                color: Colors.primaries[index % Colors.primaries.length],
              ),
              SizedBox(height: 8),
              Text(
                'Item ${index + 1}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildGridExtent() {
    return GridView.extent(
      maxCrossAxisExtent: 200,
      padding: EdgeInsets.all(16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: List.generate(15, (index) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.primaries[index % Colors.primaries.length],
                Colors.primaries[(index + 1) % Colors.primaries.length],
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildGridBuilder() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.3),
                  child: Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product ${index + 1}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$${(index + 1) * 5}',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
```

---

## 📝 Forms & Input

### ✏️ **Input Widgets**

```dart
class FormExamples extends StatefulWidget {
  @override
  _FormExamplesState createState() => _FormExamplesState();
}

class _FormExamplesState extends State<FormExamples> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _agreeToTerms = false;
  String _selectedGender = 'Male';
  double _ageSlider = 25;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Examples')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text input
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              // Email input
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              // Password input
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              // Dropdown
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: ['Male', 'Female', 'Other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue!;
                  });
                },
              ),

              SizedBox(height: 16),

              // Age slider
              Text('Age: ${_ageSlider.round()}'),
              Slider(
                value: _ageSlider,
                min: 18,
                max: 80,
                divisions: 62,
                label: _ageSlider.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _ageSlider = value;
                  });
                },
              ),

              SizedBox(height: 16),

              // Checkbox
              CheckboxListTile(
                title: Text('I agree to the Terms and Conditions'),
                value: _agreeToTerms,
                onChanged: (bool? value) {
                  setState(() {
                    _agreeToTerms = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),

              SizedBox(height: 32),

              // Submit button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _agreeToTerms ? () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Form submitted successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  } : null,
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Alternative input styles
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alternative Input Styles',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),

                      // Outlined input
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Outlined Input',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Filled input
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Filled Input',
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Underline input
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Underline Input',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
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

## 📱 Responsive Design Basics

### 📏 **Screen Size Adaptation**

```dart
class ResponsiveExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    final isMobile = screenSize.width < 600;

    return Scaffold(
      appBar: AppBar(title: Text('Responsive Design')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Screen info card
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Screen Information',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Width: ${screenSize.width.toStringAsFixed(1)}'),
                    Text('Height: ${screenSize.height.toStringAsFixed(1)}'),
                    Text('Device Type: ${isTablet ? "Tablet" : "Mobile"}'),
                    Text('Orientation: ${MediaQuery.of(context).orientation}'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Responsive grid
            _buildResponsiveGrid(context),

            SizedBox(height: 20),

            // Responsive layout
            _buildResponsiveLayout(context),

            SizedBox(height: 20),

            // Responsive text
            _buildResponsiveText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveGrid(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (screenWidth > 1200) {
      crossAxisCount = 4; // Desktop
    } else if (screenWidth > 800) {
      crossAxisCount = 3; // Tablet landscape
    } else if (screenWidth > 600) {
      crossAxisCount = 2; // Tablet portrait
    } else {
      crossAxisCount = 1; // Mobile
    }

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsive Grid ($crossAxisCount columns)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.5,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text('Item ${index + 1}'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsive Layout',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            isWideScreen
                ? Row(
                    children: [
                      Expanded(flex: 1, child: _buildImageContainer()),
                      SizedBox(width: 16),
                      Expanded(flex: 2, child: _buildTextContent()),
                    ],
                  )
                : Column(
                    children: [
                      _buildImageContainer(),
                      SizedBox(height: 16),
                      _buildTextContent(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Icon(Icons.image, size: 50, color: Colors.blue),
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Responsive Content',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'This layout adapts based on screen size. On wide screens, image and text are side by side. On narrow screens, they stack vertically.',
        ),
      ],
    );
  }

  Widget _buildResponsiveText(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize;

    if (screenWidth > 600) {
      fontSize = 24; // Tablet/Desktop
    } else {
      fontSize = 18; // Mobile
    }

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsive Typography',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'This text size adapts to screen width. Current size: ${fontSize}px',
              style: TextStyle(fontSize: fontSize * 0.7),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 🏃‍♂️ Layout Challenges

### 🎯 **Practice Exercises**

```dart
// Challenge 1: Build a social media post card
class SocialMediaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Build a card with:
    // 1. Profile picture and name at top
    // 2. Post image
    // 3. Like, comment, share buttons
    // 4. Caption text below

    return Container(); // Replace with your implementation
  }
}

// Challenge 2: Create a product showcase grid
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Build a responsive grid showing:
    // 1. Product image
    // 2. Product name
    // 3. Price
    // 4. Add to cart button
    // 5. Different grid columns for different screen sizes

    return Container(); // Replace with your implementation
  }
}

// Challenge 3: Design a chat message bubble
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final DateTime timestamp;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isMe,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Build a chat bubble that:
    // 1. Aligns right if isMe=true, left if false
    // 2. Has different colors for sent/received
    // 3. Shows timestamp
    // 4. Has appropriate padding and margins

    return Container(); // Replace with your implementation
  }
}
```

### 🔍 **Solutions**

<details>
<summary>Click to see solutions</summary>

```dart
// Solution 1: Social Media Card
class SocialMediaCard extends StatefulWidget {
  @override
  _SocialMediaCardState createState() => _SocialMediaCardState();
}

class _SocialMediaCardState extends State<SocialMediaCard> {
  bool isLiked = false;
  int likeCount = 42;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with profile
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://picsum.photos/40/40'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('2 hours ago', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
          ),

          // Post image
          Image.network(
            'https://picsum.photos/400/300',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),

          // Action buttons
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                      likeCount += isLiked ? 1 : -1;
                    });
                  },
                ),
                IconButton(icon: Icon(Icons.comment), onPressed: () {}),
                IconButton(icon: Icon(Icons.share), onPressed: () {}),
                Spacer(),
                IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
              ],
            ),
          ),

          // Like count and caption
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$likeCount likes', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(text: 'john_doe ', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: 'Beautiful sunset today! 🌅 #nature #photography'),
                    ],
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Solution 2: Product Grid
class ProductGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'name': 'Product 1', 'price': 29.99, 'image': 'https://picsum.photos/200/200?random=1'},
    {'name': 'Product 2', 'price': 39.99, 'image': 'https://picsum.photos/200/200?random=2'},
    // Add more products...
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;
        if (constraints.maxWidth > 1200) {
          crossAxisCount = 4;
        } else if (constraints.maxWidth > 800) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth > 600) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 1;
        }

        return GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.network(
                      product['image'],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '\$${product['price']}',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Add to Cart'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

// Solution 3: Chat Bubble
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final DateTime timestamp;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isMe,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) ...[
            CircleAvatar(radius: 16, child: Icon(Icons.person, size: 16)),
            SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.circular(20).copyWith(
                  bottomRight: isMe ? Radius.circular(4) : Radius.circular(20),
                  bottomLeft: isMe ? Radius.circular(20) : Radius.circular(4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontSize: 12,
                      color: isMe ? Colors.white70 : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isMe) ...[
            SizedBox(width: 8),
            CircleAvatar(radius: 16, child: Icon(Icons.person, size: 16)),
          ],
        ],
      ),
    );
  }
}
```

</details>

---

## 🎓 Chapter Summary

Congratulations! Anda telah menguasai widget fundamental dan layout sistem Flutter:

### ✅ **What You've Mastered**
- **Basic UI Widgets**: Text, Image, Icon, Card
- **Layout System**: Row, Column, Stack, Container
- **Decorations**: Gradients, shadows, borders, shapes
- **Interactive Elements**: Buttons, forms, input fields
- **Scrolling**: ListView, GridView variations
- **Responsive Design**: Adaptive layouts untuk different screen sizes
- **Real-world Examples**: Social media cards, product grids, chat bubbles

### 🎯 **Key Skills Acquired**
- **Widget Composition**: Combining widgets untuk complex UIs
- **Layout Principles**: Alignment, spacing, positioning
- **Responsive Thinking**: Adapting UIs untuk different devices
- **Performance Awareness**: Efficient list building dan rendering
- **User Experience**: Interactive feedback dan visual hierarchy

### 🚀 **Ready for Styling**
Dengan widget mastery yang solid, Anda siap untuk:
- Advanced styling dan theming
- Custom animations
- Complex state management
- Professional app development

---

<div align="center">

### 🎯 **Achievement Unlocked!**
![Widget Master Badge](../assets/badges/widget-master.png)

**🎨 Widget Master** - Mastered Flutter Widget Library & Layouts

---

**Ready to dive into styling and theming?**

[⬅️ Previous: First Project](05-proyek-pertama.md) | [➡️ Next: Styling & Theming](07-styling-theming.md)

---

**💬 Widget Questions?** Check our [cheat sheets](cheat-sheets.md) atau open an [issue](../../issues)

</div>