# 🎨 Minggu 5: Arsitektur Widget Flutter

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![UI Architecture](https://img.shields.io/badge/UI-Architecture-purple?style=for-the-badge)

---

## 🎯 Tujuan Pembelajaran

Setelah menyelesaikan materi minggu ini, mahasiswa diharapkan dapat:

- 🏗️ **Menjelaskan** prinsip inti "Segalanya adalah widget" di Flutter
- 🌳 **Mendeskripsikan** peran dari Widget Tree, Element Tree, dan Render Tree
- ⚖️ **Membedakan** antara StatelessWidget dan StatefulWidget beserta siklus hidupnya
- 🔄 **Menggunakan** setState() untuk memicu pembaruan UI dalam StatefulWidget

---

## 📋 Outline Materi

1. [🏗️ Paradigma "Everything is a Widget"](#️-paradigma-everything-is-a-widget)
2. [🌳 Tiga Pohon Flutter](#-tiga-pohon-flutter)
3. [📄 StatelessWidget: Widget yang Tidak Berubah](#-statelesswidget-widget-yang-tidak-berubah)
4. [🔄 StatefulWidget: Widget yang Dinamis](#-statefulwidget-widget-yang-dinamis)
5. [🎮 Mengelola State dengan setState()](#-mengelola-state-dengan-setstate)
6. [💻 Praktikum 5: Aplikasi Penghitung Interaktif](#-praktikum-5-aplikasi-penghitung-interaktif)

---

## 🏗️ Paradigma "Everything is a Widget"

Flutter memiliki filosofi unik: **"Segalanya adalah Widget"**. Berbeda dari framework lain yang memisahkan layout dan styling, Flutter menyatukan semuanya dalam konsep widget. Bayangkan widget seperti blok Lego—setiap blok memiliki fungsi spesifik, dan Anda membangun aplikasi dengan menggabungkan blok-blok ini.

### 🧩 Apa itu Widget?

Widget adalah deskripsi konfigurasi untuk bagian dari user interface. Widget bukan elemen UI itu sendiri, melainkan "cetak biru" atau "resep" untuk membuat elemen UI.

💻 **Contoh Widget Sederhana:**
```dart
import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello Flutter!');
  }
}
```

📋 **Cara Kerja Widget:**
```
🎯 Widget Declaration
  ↓
1️⃣ Flutter reads Widget code → Text('Hello Flutter!')
  ↓
2️⃣ Creates Element from Widget → TextElement
  ↓
3️⃣ Element creates RenderObject → RenderText
  ↓
4️⃣ RenderObject draws on screen → Visible text
  ↓
✅ User sees: "Hello Flutter!" on screen
```

🚀 **Coba Sekarang!** 
Copy code di atas dan jalankan di: https://zapp.run/

### 🎨 Semua adalah Widget

Dalam Flutter, bahkan hal-hal yang tidak terlihat pun adalah widget:

💻 **Demonstrasi Konsep Widget:**
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // MyApp adalah widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(    // MaterialApp adalah widget
      home: Scaffold(      // Scaffold adalah widget
        appBar: AppBar(    // AppBar adalah widget
          title: Text('Everything is Widget'), // Text adalah widget
        ),
        body: Center(     // Center adalah widget
          child: Container( // Container adalah widget
            padding: EdgeInsets.all(16), // EdgeInsets adalah widget
            color: Colors.blue,          // Colors bukan widget, tapi Color value
            child: Text(                 // Text adalah widget
              'Saya adalah widget!',
              style: TextStyle(          // TextStyle bukan widget, tapi configuration
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

📋 **Breakdown Widget Tree:**
```
🎯 MyApp
  ↓
📱 MaterialApp
  ↓
🏗️ Scaffold
  ↓
┌─────────────┬─────────────────┐
│ 📊 AppBar   │ 📦 Body        │
│    ↓        │    ↓            │
│ 📝 Text     │ 🎯 Center      │
│             │    ↓            │
│             │ 📦 Container    │
│             │    ↓            │
│             │ 📝 Text        │
└─────────────┴─────────────────┘
```

🚀 **Coba Sekarang!** 
Jalankan aplikasi lengkap ini di: https://zapp.run/

---

## 🌳 Tiga Pohon Flutter

Flutter menggunakan tiga pohon (trees) yang bekerja sama untuk membuat UI yang efisien dan performan. Memahami ketiga pohon ini penting untuk optimasi aplikasi.

### 🎨 Widget Tree (Cetak Biru)

Widget Tree adalah pohon yang dibuat oleh developer. Ini berisi konfigurasi UI yang **immutable** (tidak dapat diubah).

💻 **Widget Tree Example:**
```dart
import 'package:flutter/material.dart';

class SimpleWidgetTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Widget 1'),
        Text('Widget 2'),
        Row(
          children: [
            Text('Widget 3'),
            Text('Widget 4'),
          ],
        ),
      ],
    );
  }
}
```

📋 **Visualisasi Widget Tree:**
```
🎯 SimpleWidgetTree
  ↓
📦 Column
  ↓
┌─────────────┬─────────────────┬─────────────────┐
│ 📝 Text     │ 📝 Text        │ ➡️ Row         │
│ 'Widget 1'  │ 'Widget 2'     │      ↓          │
│             │                │ ┌──────────────┐ │
│             │                │ │📝 Text      │ │
│             │                │ │'Widget 3'   │ │
│             │                │ │📝 Text      │ │
│             │                │ │'Widget 4'   │ │
│             │                │ └──────────────┘ │
└─────────────┴─────────────────┴─────────────────┘
```

### 🔧 Element Tree (Pengelola)

Element Tree mengelola lifecycle dan state dari widgets. Element adalah jembatan antara Widget dan RenderObject.

📋 **Proses Pembuatan Element Tree:**
```
🎯 Widget Tree Created
  ↓
1️⃣ Flutter scans Widget Tree
  ↓
2️⃣ For each Widget → Create corresponding Element
  ↓
3️⃣ Column Widget → ColumnElement
  ↓
4️⃣ Text Widget → TextElement
  ↓
5️⃣ Row Widget → RowElement
  ↓
✅ Element Tree maintains state and lifecycle
```

### 🖥️ Render Tree (Pelukis)

Render Tree bertanggung jawab untuk layout, painting, dan hit-testing (mendeteksi sentuhan).

📋 **Render Tree Process:**
```
🎯 Element Tree Complete
  ↓
1️⃣ Each Element creates RenderObject
  ↓
2️⃣ RenderObject handles:
   • 📏 Layout (positioning and sizing)
   • 🎨 Painting (drawing pixels)
   • 👆 Hit Testing (touch detection)
  ↓
3️⃣ Column → RenderFlex
  ↓
4️⃣ Text → RenderParagraph
  ↓
5️⃣ Row → RenderFlex
  ↓
✅ Final pixels drawn on screen
```

🚀 **Coba Sekarang!** 
Test Widget Tree structure di: https://zapp.run/

### 🔄 Kenapa Tiga Pohon?

Pemisahan ini memberikan efisiensi:

📋 **Optimization Flow:**
```
🎯 Widget Changed (Immutable rebuild)
  ↓
1️⃣ Flutter checks Element Tree
  ↓
2️⃣ Can Element be reused? → Yes: Skip recreation
  ↓                        → No: Create new Element
3️⃣ Element updates RenderObject
  ↓
4️⃣ Only changed RenderObjects repaint
  ↓
✅ Efficient updates without full rebuild
```

---

## 📄 StatelessWidget: Widget yang Tidak Berubah

StatelessWidget adalah widget yang tidak memiliki state internal yang dapat berubah. Sekali dibuat, propertinya tidak dapat dimodifikasi. Seperti poster di dinding—isinya tetap sama sampai Anda menggantinya dengan poster baru.

### 🏗️ Struktur StatelessWidget

💻 **Template StatelessWidget:**
```dart
import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  // Properties (harus final karena immutable)
  final String title;
  final Color backgroundColor;
  
  // Constructor
  const MyStatelessWidget({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  // Build method - dipanggil untuk membuat UI
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
```

📋 **Lifecycle StatelessWidget:**
```
🎯 Widget Creation
  ↓
1️⃣ Constructor called → Properties set (immutable)
  ↓
2️⃣ build() method called → Returns Widget tree
  ↓
3️⃣ Element created from Widget
  ↓
4️⃣ RenderObject created from Element
  ↓
5️⃣ UI displayed on screen
  ↓
✅ Widget lives until parent rebuilds or removes it
```

### 📝 Contoh Praktis StatelessWidget

💻 **Profile Card Widget:**
```dart
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String profileImage;
  
  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(profileImage),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              email,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Cara penggunaan
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ProfileCard(
            name: 'Alice Johnson',
            email: 'alice@example.com',
            profileImage: 'https://via.placeholder.com/150',
          ),
        ),
      ),
    );
  }
}
```

📋 **Data Flow dalam StatelessWidget:**
```
🎯 Parent Widget calls ProfileCard()
  ↓
1️⃣ Constructor receives parameters:
   • name: 'Alice Johnson'
   • email: 'alice@example.com'  
   • profileImage: 'https://via.placeholder.com/150'
  ↓
2️⃣ build() method executes
  ↓
3️⃣ Creates Widget tree:
   Card → Padding → Column → [CircleAvatar, SizedBox, Text, Text]
  ↓
4️⃣ Returns complete Widget tree to parent
  ↓
✅ UI renders with provided data
```

🚀 **Coba Sekarang!** 
Buat ProfileCard Anda sendiri di: https://zapp.run/

### ✅ Kapan Menggunakan StatelessWidget

**Gunakan StatelessWidget ketika:**
- Data tidak berubah setelah widget dibuat
- Widget hanya menampilkan informasi
- Tidak ada interaksi pengguna yang mengubah tampilan
- Widget berfungsi sebagai komponen presentasional

**Contoh kasus:** Header aplikasi, kartu informasi, label, gambar statis.

---

## 🔄 StatefulWidget: Widget yang Dinamis

StatefulWidget adalah widget yang memiliki state yang dapat berubah selama lifecycle aplikasi. Seperti lampu dengan saklar—tampilan atau perilakunya bisa berubah berdasarkan interaksi.

### 🏗️ Struktur StatefulWidget

StatefulWidget terdiri dari dua class: widget itu sendiri (immutable) dan class State (mutable).

💻 **Template StatefulWidget:**
```dart
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  // Properties widget (tetap immutable)
  final String title;
  
  const MyStatefulWidget({Key? key, required this.title}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // Variabel state (bisa berubah)
  int counter = 0;
  bool isVisible = true;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title), // Akses property widget dengan widget.propertyName
        Text('Counter: $counter'),
        if (isVisible) Text('Saya terlihat!'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
              isVisible = !isVisible;
            });
          },
          child: Text('Press Me'),
        ),
      ],
    );
  }
}
```

📋 **Struktur StatefulWidget:**
```
🎯 MyStatefulWidget (Immutable)
  ↓
📝 Contains widget configuration (title, etc.)
  ↓
🏭 createState() → Creates State object
  ↓
🔄 _MyStatefulWidgetState (Mutable)
  ↓
📊 Contains state variables (counter, isVisible, etc.)
  ↓
🏗️ build() → Returns Widget tree based on current state
```

### 📱 Lifecycle StatefulWidget

💻 **Lifecycle Demo:**
```dart
import 'package:flutter/material.dart';

class LifecycleDemo extends StatefulWidget {
  @override
  _LifecycleDemoState createState() => _LifecycleDemoState();
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  String lifecycleStatus = '';
  
  @override
  void initState() {
    super.initState();
    print('initState: Widget sedang diinisialisasi');
    lifecycleStatus = 'Widget initialized';
  }
  
  @override
  Widget build(BuildContext context) {
    print('build: Widget sedang di-build');
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Status: $lifecycleStatus'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                lifecycleStatus = 'Button pressed - rebuilding';
              });
            },
            child: Text('Update Status'),
          ),
        ],
      ),
    );
  }
  
  @override
  void dispose() {
    super.dispose();
    print('dispose: Widget sedang dihancurkan');
  }
}
```

📋 **Lifecycle Flow:**
```
🎯 StatefulWidget Created
  ↓
1️⃣ createState() → Create State object
  ↓
2️⃣ initState() → Initialize state variables
  ↓
3️⃣ build() → Build initial UI
  ↓
4️⃣ Widget displayed on screen
  ↓
🔄 When state changes:
   setState() → build() → Update UI
  ↓
5️⃣ When widget removed:
   dispose() → Cleanup resources
  ↓
✅ State object destroyed
```

🚀 **Coba Sekarang!** 
Lihat lifecycle dalam aksi di: https://zapp.run/

### 🎮 State Management Best Practices

💻 **Proper State Management:**
```dart
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0; // Private variable (underscore prefix)
  
  // Method untuk mengubah state
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }
  
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Count: $_counter',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _decrementCounter,
              child: Text('-'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: _resetCounter,
              child: Text('Reset'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('+'),
            ),
          ],
        ),
      ],
    );
  }
}
```

🚀 **Coba Sekarang!** 
Test Counter Widget di: https://zapp.run/

---

## 🎮 Mengelola State dengan setState()

`setState()` adalah method fundamental untuk memberitahu Flutter bahwa state telah berubah dan UI perlu di-rebuild. Ini adalah jantung dari reaktivitas dalam StatefulWidget.

### 🔄 Cara Kerja setState()

💻 **setState() Basic Example:**
```dart
import 'package:flutter/material.dart';

class SetStateExample extends StatefulWidget {
  @override
  _SetStateExampleState createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  String message = 'Hello';
  Color backgroundColor = Colors.blue;
  
  void changeMessage() {
    setState(() {
      // Semua perubahan state harus di dalam setState()
      message = message == 'Hello' ? 'Hi Flutter!' : 'Hello';
      backgroundColor = backgroundColor == Colors.blue ? Colors.green : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build() dipanggil - UI sedang di-rebuild');
    
    return Container(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: changeMessage,
            child: Text('Change Message'),
          ),
        ],
      ),
    );
  }
}
```

📋 **setState() Process:**
```
🎯 User taps button
  ↓
1️⃣ changeMessage() method called
  ↓
2️⃣ setState(() {...}) starts
  ↓
3️⃣ State changes inside setState:
   • message updated
   • backgroundColor updated
  ↓
4️⃣ setState() marks widget as "dirty"
  ↓
5️⃣ Flutter schedules rebuild
  ↓
6️⃣ build() method called again
  ↓
7️⃣ New Widget tree created with updated values
  ↓
8️⃣ UI updated on screen
  ↓
✅ User sees new message and background color
```

🚀 **Coba Sekarang!** 
Test setState() behavior di: https://zapp.run/

### ⚠️ setState() Best Practices

💻 **Do's and Don'ts:**
```dart
class SetStateBestPractices extends StatefulWidget {
  @override
  _SetStateBestPracticesState createState() => _SetStateBestPracticesState();
}

class _SetStateBestPracticesState extends State<SetStateBestPractices> {
  int counter = 0;
  List<String> items = [];
  
  // ✅ GOOD: Semua state changes dalam setState()
  void goodIncrement() {
    setState(() {
      counter++;
    });
  }
  
  // ❌ BAD: State change di luar setState()
  void badIncrement() {
    counter++; // Tidak akan update UI
    setState(() {}); // setState kosong tidak efisien
  }
  
  // ✅ GOOD: Multiple state changes dalam satu setState()
  void goodMultipleChanges() {
    setState(() {
      counter++;
      items.add('Item ${items.length + 1}');
    });
  }
  
  // ❌ BAD: Multiple setState() calls
  void badMultipleChanges() {
    setState(() {
      counter++;
    });
    setState(() {
      items.add('Item ${items.length + 1}'); // Menyebabkan multiple rebuilds
    });
  }
  
  // ✅ GOOD: Avoid expensive operations dalam setState()
  void goodExpensiveOperation() {
    // Lakukan operasi berat di luar setState()
    String newItem = 'Processed Item ${items.length + 1}';
    
    setState(() {
      // Hanya assignment di dalam setState()
      items.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: $counter'),
        Text('Items: ${items.length}'),
        ElevatedButton(
          onPressed: goodIncrement,
          child: Text('Good Increment'),
        ),
        ElevatedButton(
          onPressed: goodMultipleChanges,
          child: Text('Add Item & Increment'),
        ),
      ],
    );
  }
}
```

📋 **setState() Guidelines:**
```
✅ DO's:
• Put ALL state changes inside setState()
• Group multiple state changes in single setState()
• Keep setState() content minimal and fast
• Use descriptive method names for state changes

❌ DON'Ts:
• Change state outside setState()
• Call setState() multiple times unnecessarily
• Put expensive operations inside setState()
• Call setState() during build() method
```

### 🎯 Conditional UI dengan State

💻 **Dynamic UI Example:**
```dart
import 'package:flutter/material.dart';

class ConditionalUI extends StatefulWidget {
  @override
  _ConditionalUIState createState() => _ConditionalUIState();
}

class _ConditionalUIState extends State<ConditionalUI> {
  bool isLoggedIn = false;
  String username = '';
  int notificationCount = 0;
  
  void toggleLogin() {
    setState(() {
      isLoggedIn = !isLoggedIn;
      if (isLoggedIn) {
        username = 'Flutter User';
        notificationCount = 3;
      } else {
        username = '';
        notificationCount = 0;
      }
    });
  }
  
  void clearNotifications() {
    setState(() {
      notificationCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Conditional rendering berdasarkan login status
          if (isLoggedIn) ...[
            Text(
              'Welcome, $username!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Notifications: '),
                if (notificationCount > 0) ...[
                  Text(
                    '$notificationCount',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: clearNotifications,
                    child: Text('Clear'),
                  ),
                ] else
                  Text('No new notifications'),
              ],
            ),
          ] else ...[
            Text('Please log in to continue'),
            Icon(Icons.person_outline, size: 64, color: Colors.grey),
          ],
          
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: toggleLogin,
            child: Text(isLoggedIn ? 'Logout' : 'Login'),
          ),
        ],
      ),
    );
  }
}
```

🚀 **Coba Sekarang!** 
Test conditional UI di: https://zapp.run/

---

## 💻 Praktikum 5: Aplikasi Penghitung Interaktif

Dalam praktikum ini, Anda akan membangun aplikasi penghitung yang mendemonstrasikan perbedaan antara StatelessWidget dan StatefulWidget, serta penggunaan setState().

### 🎯 Objektif Praktikum

- Memahami perbedaan StatelessWidget vs StatefulWidget
- Menggunakan setState() dengan benar
- Membangun UI interaktif sederhana
- Mengimplementasikan multiple state variables

### 📝 Tugas 1: Counter Sederhana dengan StatefulWidget

💻 **Basic Counter App:**
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  // TODO: Tambahkan variabel state di sini
  int _counter = 0;
  
  // TODO: Implementasikan method untuk increment
  void _incrementCounter() {
    // Gunakan setState untuk update UI
  }
  
  // TODO: Implementasikan method untuk decrement
  void _decrementCounter() {
    // Pastikan counter tidak negatif
  }
  
  // TODO: Implementasikan method untuk reset
  void _resetCounter() {
    // Reset counter ke 0
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_counter', // Tampilkan nilai counter
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO: Tambahkan tombol decrement
                // TODO: Tambahkan tombol reset  
                // TODO: Tambahkan tombol increment
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

📋 **Implementation Steps:**
```
🎯 Complete the Counter App:
  ↓
1️⃣ Implement _incrementCounter():
   • Use setState() to increment _counter
  ↓
2️⃣ Implement _decrementCounter():
   • Use setState() with condition (_counter > 0)
  ↓
3️⃣ Implement _resetCounter():
   • Use setState() to set _counter = 0
  ↓
4️⃣ Add three ElevatedButton widgets:
   • Decrement button (-) 
   • Reset button (Reset)
   • Increment button (+)
  ↓
✅ Test all functionalities
```

🚀 **Coba Sekarang!** 
Complete dan test counter app di: https://zapp.run/

### 📝 Tugas 2: Enhanced Counter dengan Multiple States

💻 **Advanced Counter Features:**
```dart
import 'package:flutter/material.dart';

class EnhancedCounter extends StatefulWidget {
  @override
  _EnhancedCounterState createState() => _EnhancedCounterState();
}

class _EnhancedCounterState extends State<EnhancedCounter> {
  int _counter = 0;
  int _step = 1;        // Langkah increment/decrement
  int _maxValue = 100;  // Nilai maksimum
  Color _counterColor = Colors.blue;
  
  void _incrementCounter() {
    setState(() {
      if (_counter + _step <= _maxValue) {
        _counter += _step;
        _updateCounterColor();
      }
    });
  }
  
  void _decrementCounter() {
    setState(() {
      if (_counter - _step >= 0) {
        _counter -= _step;
        _updateCounterColor();
      }
    });
  }
  
  void _resetCounter() {
    setState(() {
      _counter = 0;
      _updateCounterColor();
    });
  }
  
  void _changeStep(int newStep) {
    setState(() {
      _step = newStep;
    });
  }
  
  void _updateCounterColor() {
    if (_counter == 0) {
      _counterColor = Colors.blue;
    } else if (_counter < 30) {
      _counterColor = Colors.green;
    } else if (_counter < 70) {
      _counterColor = Colors.orange;
    } else {
      _counterColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enhanced Counter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Counter Display
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: _counterColor.withOpacity(0.1),
                border: Border.all(color: _counterColor, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    'Current Value',
                    style: TextStyle(fontSize: 16, color: _counterColor),
                  ),
                  Text(
                    '$_counter',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: _counterColor,
                    ),
                  ),
                  Text(
                    'Max: $_maxValue',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            // Step Selection
            Text('Step Size:', style: TextStyle(fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1, 5, 10].map((stepValue) => 
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text('$stepValue'),
                    selected: _step == stepValue,
                    onSelected: (selected) {
                      if (selected) _changeStep(stepValue);
                    },
                  ),
                ),
              ).toList(),
            ),
            
            SizedBox(height: 20),
            
            // Control Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _counter > 0 ? _decrementCounter : null,
                  child: Text('-$_step'),
                ),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: _counter < _maxValue ? _incrementCounter : null,
                  child: Text('+$_step'),
                ),
              ],
            ),
            
            SizedBox(height: 20),
            
            // Progress indicator
            LinearProgressIndicator(
              value: _counter / _maxValue,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation(_counterColor),
            ),
            
            SizedBox(height: 10),
            
            Text(
              'Progress: ${((_counter / _maxValue) * 100).toInt()}%',
              style: TextStyle(fontSize: 14, color: _counterColor),
            ),
          ],
        ),
      ),
    );
  }
}
```

🚀 **Coba Sekarang!** 
Test enhanced counter di: https://zapp.run/

### 📝 Tugas 3: Comparison Demo - Stateless vs Stateful

Buat aplikasi yang menunjukkan perbedaan antara StatelessWidget dan StatefulWidget.

💻 **Comparison Demo:**
```dart
import 'package:flutter/material.dart';

class ComparisonDemo extends StatefulWidget {
  @override
  _ComparisonDemoState createState() => _ComparisonDemoState();
}

class _ComparisonDemoState extends State<ComparisonDemo> {
  int _sharedCounter = 0;
  
  void _incrementSharedCounter() {
    setState(() {
      _sharedCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless vs Stateful Demo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Shared Counter: $_sharedCounter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          
          Expanded(
            child: Row(
              children: [
                // Stateless Side
                Expanded(
                  child: Container(
                    color: Colors.blue[50],
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.blue,
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'STATELESS WIDGET',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: StatelessDemo(counter: _sharedCounter),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Divider
                Container(width: 1, color: Colors.grey),
                
                // Stateful Side
                Expanded(
                  child: Container(
                    color: Colors.green[50],
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.green,
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'STATEFUL WIDGET',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: StatefulDemo(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: _incrementSharedCounter,
              child: Text('Increment Shared Counter'),
            ),
          ),
        ],
      ),
    );
  }
}

// StatelessWidget - tidak bisa mengubah state internal
class StatelessDemo extends StatelessWidget {
  final int counter;
  
  const StatelessDemo({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.lock, size: 48, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'Received: $counter',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          Text(
            'Properties immutable',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: null, // Disabled - tidak bisa mengubah state
            child: Text('Cannot Change State'),
          ),
        ],
      ),
    );
  }
}

// StatefulWidget - bisa mengubah state internal
class StatefulDemo extends StatefulWidget {
  @override
  _StatefulDemoState createState() => _StatefulDemoState();
}

class _StatefulDemoState extends State<StatefulDemo> {
  int _internalCounter = 0;
  
  void _incrementInternal() {
    setState(() {
      _internalCounter++;
    });
  }
  
  void _resetInternal() {
    setState(() {
      _internalCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 48, color: Colors.green),
          SizedBox(height: 16),
          Text(
            'Internal: $_internalCounter',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          Text(
            'State can change',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _incrementInternal,
                child: Text('+'),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: _resetInternal,
                child: Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

🚀 **Coba Sekarang!** 
Lihat perbedaan Stateless vs Stateful di: https://zapp.run/

### 📝 Tugas 4: Personal Challenge

Buat aplikasi kalkulator sederhana yang mencakup:

**Requirements:**
- ✅ Gunakan StatefulWidget
- ✅ State variables: currentNumber, previousNumber, operation, displayText
- ✅ Methods: inputNumber(), inputOperation(), calculate(), clear()
- ✅ UI: Display area dan number pad dengan tombol operasi
- ✅ Handle multiple operations dan error cases

**Bonus Features:**
- History operasi terakhir
- Decimal number support
- Memory functions (M+, M-, MR, MC)

📋 **Implementation Tips:**
```
🎯 Calculator Structure:
  ↓
1️⃣ State Variables:
   • String displayText = '0'
   • double currentNumber = 0
   • double previousNumber = 0  
   • String operation = ''
  ↓
2️⃣ Core Methods:
   • inputNumber(String number)
   • inputOperation(String op)
   • calculate()
   • clear()
  ↓
3️⃣ UI Layout:
   • Display container at top
   • Number pad grid (0-9)
   • Operation buttons (+, -, ×, ÷)
   • Equals and clear buttons
  ↓
✅ Test all mathematical operations
```

🚀 **Coba Sekarang!** 
Build your calculator di: https://zapp.run/

---

## 📚 Glosarium

| **Istilah** | **Definisi** | **Contoh** |
|-------------|--------------|------------|
| **Build Context** | Referensi lokasi widget dalam widget tree | `build(BuildContext context)` |
| **Element Tree** | Pohon yang mengelola lifecycle dan state widget | Jembatan antara Widget dan RenderObject |
| **Hot Reload** | Fitur Flutter untuk update UI secara real-time | Tekan R di terminal atau Ctrl+S di IDE |
| **Immutable** | Objek yang tidak dapat diubah setelah dibuat | Properties pada StatelessWidget |
| **Key** | Identifikasi unik untuk widget dalam tree | `Key? key` parameter dalam constructor |
| **Lifecycle** | Tahap-tahap kehidupan widget dari create hingga destroy | initState() → build() → dispose() |
| **Mutable** | Objek yang dapat diubah setelah dibuat | State variables dalam StatefulWidget |
| **Render Tree** | Pohon yang menangani layout dan painting UI | RenderObject untuk drawing pixels |
| **setState()** | Method untuk memberitahu Flutter bahwa state berubah | `setState(() { counter++; })` |
| **State** | Data yang dapat berubah dan mempengaruhi UI | Variables dalam State class |
| **StatefulWidget** | Widget yang memiliki state yang bisa berubah | Counter, Form input, Toggle button |
| **StatelessWidget** | Widget yang tidak memiliki state internal | Static text, Icons, Layout containers |
| **Widget** | Building block dasar untuk membuat UI | Text, Container, Column, Row, dll |
| **Widget Tree** | Hierarki widget yang mendeskripsikan UI | Parent-child relationship antar widget |

---

## 📖 Referensi

### 📚 Dokumentasi Resmi
1. **Flutter Widget Catalog**. (2024). *Flutter.dev*. https://docs.flutter.dev/ui/widgets
2. **StatefulWidget class**. (2024). *Flutter API Documentation*. https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html
3. **StatelessWidget class**. (2024). *Flutter API Documentation*. https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
4. **State class**. (2024). *Flutter API Documentation*. https://api.flutter.dev/flutter/widgets/State-class.html

### 🎓 Sumber Akademik
5. **Building User Interfaces with Flutter**. (2024). *Flutter Documentation Team*. https://docs.flutter.dev/ui
6. **Inside Flutter**. (2024). *Flutter Architecture Guide*. https://docs.flutter.dev/resources/inside-flutter
7. **Widget-Element-RenderObject trees**. (2024). *Flutter Architectural Overview*. https://docs.flutter.dev/resources/architectural-overview

### 📖 Buku dan Tutorial
8. Windmill, E. (2021). *Flutter in Action: Building Cross-Platform Mobile Apps*. Manning Publications.
9. Wu, F. (2022). *Beginning Flutter: A Hands-On Guide to App Development*. Apress.
10. Napoli, M. (2023). *Flutter Complete Reference*. LeanPub.

### 🌐 Sumber Online
11. **DartPad**. (2024). https://dartpad.dev - Online Dart editor
12. **Zapp.run**. (2024). https://zapp.run - Flutter online playground
13. **Flutter Community**. (2024). https://flutter.dev/community - Community resources

---

## 🎯 Persiapan Minggu Depan

**Preview Minggu 6: Widget UI Fondasional**

🔮 **Yang Akan Datang:**
- 📱 **MaterialApp & Scaffold**: Struktur aplikasi dasar
- 🎨 **Basic UI Widgets**: Text, Image, Icon, Container
- 🎯 **Styling & Theming**: Colors, fonts, decorations
- 🎮 **Interactive Elements**: Buttons dan event handling

**📚 Persiapan yang Disarankan:**
- ✅ Review semua konsep StatefulWidget dan setState()
- ✅ Praktikkan membuat widget sederhana
- ✅ Pahami widget tree dan build process
- ✅ Complete semua praktikum minggu 5

**💡 Tips untuk Minggu Depan:**
- Fokus pada membangun UI yang menarik
- Pelajari cara styling widget
- Praktikkan kombinasi berbagai widget dasar

---

*🎉 Selamat! Anda telah menguasai arsitektur widget Flutter. Minggu depan kita akan mulai membangun UI yang lebih menarik dan interaktif!*

🚀 **Keep Coding**: Semakin banyak Anda berlatih dengan StatefulWidget dan setState(), semakin natural rasanya membangun aplikasi Flutter yang interaktif!
