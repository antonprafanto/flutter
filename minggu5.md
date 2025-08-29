📱 Minggu 5: Arsitektur Widget Flutter
Show Image
Show Image
Show Image

🎯 Tujuan Pembelajaran
Setelah menyelesaikan materi minggu ini, mahasiswa diharapkan dapat:

🧩 Menjelaskan prinsip inti "Segalanya adalah widget" di Flutter
🌳 Mendeskripsikan peran dari Widget Tree, Element Tree, dan Render Tree
🔄 Membedakan antara StatelessWidget dan StatefulWidget beserta siklus hidupnya
⚡ Menggunakan setState() untuk memicu pembaruan UI dalam StatefulWidget


📋 Outline Materi

🧩 Paradigma Widget: "Everything is a Widget"
🌳 Tiga Pohon Flutter: Arsitektur Internal
📄 StatelessWidget: Widget Statis
🔄 StatefulWidget: Widget Dinamis
⚡ Mengelola State dengan setState()
💻 Praktikum 5: Aplikasi Penghitung Interaktif


🧩 Paradigma Widget: "Everything is a Widget"
🎯 Konsep Fundamental
Flutter mengadopsi filosofi "Everything is a Widget" yang berarti semua elemen UI dalam aplikasi Flutter adalah widget. Tidak peduli itu tombol, teks, layout, padding, atau bahkan aplikasi itu sendiri - semuanya adalah widget yang dapat dikombinasikan untuk membangun antarmuka pengguna.
💻 Contoh Sederhana - Struktur Widget:
dartimport 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // MyApp adalah widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp adalah widget
      home: Scaffold(  // Scaffold adalah widget
        appBar: AppBar( // AppBar adalah widget
          title: Text('Hello Flutter'), // Text adalah widget
        ),
        body: Center( // Center adalah widget
          child: Text( // Text adalah widget
            'Everything is a Widget!',
            style: TextStyle( // TextStyle bukan widget, tapi konfigurasi
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
📋 Alur Pemahaman Widget:
🎯 START: runApp(MyApp())
  ↓
1️⃣ MyApp widget dibuat → Returns MaterialApp widget
  ↓
2️⃣ MaterialApp widget dibuat → Contains Scaffold widget
  ↓
3️⃣ Scaffold widget dibuat → Contains AppBar + Body widgets
  ↓
4️⃣ AppBar widget → Contains Text widget for title
  ↓
5️⃣ Body (Center) widget → Contains Text widget for content
  ↓
6️⃣ Flutter renders semua widget menjadi UI di layar
  ↓
✅ END: Widget tree lengkap ditampilkan sebagai aplikasi
🚀 Coba Sekarang!
Copy kode di atas dan jalankan di: https://zapp.run/
🏗️ Widget sebagai Building Blocks
Widget dalam Flutter seperti blok LEGO - setiap widget memiliki fungsi spesifik dan dapat dikombinasikan untuk membuat struktur yang lebih kompleks.
💻 Contoh Komposisi Widget:
dartimport 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( // Layout widget - menyusun child secara vertikal
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon( // Icon widget
            Icons.flutter_dash,
            size: 100,
            color: Colors.blue,
          ),
          SizedBox(height: 20), // Spacer widget
          Text( // Text widget
            'Welcome to Flutter!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10), // Another spacer widget
          Text( // Another text widget
            'Everything you see is a widget',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 30), // Spacer widget
          ElevatedButton( // Button widget
            onPressed: () => print('Button pressed!'),
            child: Text('Get Started'), // Text widget inside button
          ),
        ],
      ),
    );
  }
}
📋 Komposisi Widget Breakdown:
🎯 WelcomeScreen Widget
  ↓
1️⃣ Scaffold (structure widget)
    └── body: Column (layout widget)
        ↓
2️⃣ Column children (list of widgets):
    ├── Icon widget (visual element)
    ├── SizedBox widget (spacing)  
    ├── Text widget (title)
    ├── SizedBox widget (spacing)
    ├── Text widget (subtitle)
    ├── SizedBox widget (spacing)
    └── ElevatedButton widget
        └── child: Text widget
  ↓
3️⃣ Flutter combines all widgets → Complete UI screen
  ↓
✅ Result: Centered welcome screen with icon, texts, and button
🚀 Coba Sekarang!
Eksperimen dengan komposisi widget di: https://zapp.run/
🎨 Kategori Widget
Widget dalam Flutter dapat dikategorikan berdasarkan fungsinya:
💻 Demonstrasi Kategori Widget:
dartimport 'package:flutter/material.dart';

class WidgetCategoriesDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget Categories')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // STRUCTURAL WIDGETS (Layout & Organization)
            Text('1. STRUCTURAL WIDGETS', 
                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Container( // Container widget - layout + decoration
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: Text('Container Widget')),
            ),
            
            SizedBox(height: 20),
            
            // VISUAL WIDGETS (Content Display)
            Text('2. VISUAL WIDGETS',
                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row( // Row widget - horizontal layout
              children: [
                Icon(Icons.star, color: Colors.amber), // Icon widget
                SizedBox(width: 8), // Spacing widget
                Text('Text & Icon Widgets'), // Text widget
              ],
            ),
            
            SizedBox(height: 20),
            
            // INTERACTIVE WIDGETS (User Input)
            Text('3. INTERACTIVE WIDGETS',
                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ElevatedButton( // Button widget
              onPressed: () => print('Interactive widget pressed'),
              child: Text('Button Widget'),
            ),
            
            SizedBox(height: 20),
            
            // STYLING WIDGETS (Appearance)
            Text('4. STYLING WIDGETS',
                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Padding( // Padding widget
              padding: EdgeInsets.all(16),
              child: DecoratedBox( // Decoration widget
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade200, Colors.blue.shade200],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Styled with Padding + DecoratedBox'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
📋 Widget Categories Explained:
🧩 Widget Categories in Flutter:

1️⃣ STRUCTURAL WIDGETS (Mengatur layout dan struktur)
   ├── Scaffold (app structure)
   ├── Container (box model)
   ├── Column (vertical layout)  
   ├── Row (horizontal layout)
   └── Stack (layered layout)

2️⃣ VISUAL WIDGETS (Menampilkan konten)
   ├── Text (display text)
   ├── Icon (display icons)
   ├── Image (display images)
   └── Card (material design card)

3️⃣ INTERACTIVE WIDGETS (Menangani input user)
   ├── ElevatedButton (raised button)
   ├── TextField (text input)
   ├── Checkbox (checkbox input)
   └── Slider (range input)

4️⃣ STYLING WIDGETS (Mengatur tampilan)
   ├── Padding (add space around widget)
   ├── DecoratedBox (add decoration)
   ├── Theme (app-wide styling)
   └── SizedBox (fixed size spacing)

✅ Semua kategori bekerja sama membentuk complete UI
🚀 Coba Sekarang!
Test berbagai kategori widget di: https://zapp.run/

🌳 Tiga Pohon Flutter: Arsitektur Internal
Flutter menggunakan tiga struktur pohon yang berbeda untuk mengelola UI secara efisien: Widget Tree, Element Tree, dan Render Tree. Memahami arsitektur ini penting untuk optimasi performa aplikasi.
📝 Widget Tree: Konfigurasi UI
Widget Tree adalah blueprint atau konfigurasi UI yang dibuat oleh developer. Widget tree bersifat immutable (tidak dapat diubah).
💻 Contoh Widget Tree:
dartimport 'package:flutter/material.dart';

class SimpleWidgetTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widget Tree Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('First Text Widget'),
              SizedBox(height: 20),
              Text('Second Text Widget'),
            ],
          ),
        ),
      ),
    );
  }
}
📋 Widget Tree Structure:
🌳 Widget Tree Structure:
MaterialApp (root widget)
  └── Scaffold
      ├── AppBar
      │   └── Text ('Widget Tree Demo')
      └── Body: Center
          └── Column
              ├── Text ('First Text Widget')
              ├── SizedBox (height: 20)
              └── Text ('Second Text Widget')

🎯 Karakteristik Widget Tree:
  ↓
1️⃣ IMMUTABLE: Setiap widget tidak dapat diubah setelah dibuat
2️⃣ LIGHTWEIGHT: Widget hanya konfigurasi, bukan objek UI sesungguhnya
3️⃣ RECYCLABLE: Widget dapat digunakan kembali di berbagai tempat
4️⃣ DECLARATIVE: Mendeskripsikan WHAT (apa yang ditampilkan)
  ↓
✅ Widget Tree = Blueprint untuk UI yang akan dibangun
🚀 Coba Sekarang!
Bangun widget tree sederhana di: https://zapp.run/
🔗 Element Tree: Pengelola Siklus Hidup
Element Tree mengelola siklus hidup widget dan menjaga referensi ke Widget Tree. Element tree bersifat mutable (dapat diubah).
💻 Demonstrasi Element Tree Concept:
dartimport 'package:flutter/material.dart';

class ElementTreeDemo extends StatefulWidget {
  @override
  _ElementTreeDemoState createState() => _ElementTreeDemoState();
}

class _ElementTreeDemoState extends State<ElementTreeDemo> {
  bool showWidget = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Element Tree Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Element Tree manages widget lifecycle'),
            SizedBox(height: 20),
            if (showWidget) // Conditional widget rendering
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: Text('I\'m alive!', 
                             style: TextStyle(color: Colors.white)),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showWidget = !showWidget; // Toggle widget visibility
                });
              },
              child: Text(showWidget ? 'Hide Widget' : 'Show Widget'),
            ),
          ],
        ),
      ),
    );
  }
}
📋 Element Tree Lifecycle:
🔗 Element Tree Management:

🎯 Ketika showWidget = true:
  ↓
1️⃣ Widget Tree: Berisi Container widget
2️⃣ Element Tree: Membuat ContainerElement
3️⃣ ContainerElement manages Container widget lifecycle
4️⃣ Element tetap hidup dan ter-mount di tree
  ↓
🎯 Ketika showWidget = false (setState dipanggil):
  ↓
1️⃣ Widget Tree: Container widget dihapus dari tree
2️⃣ Element Tree: ContainerElement di-unmount
3️⃣ Element cleanup: Lepaskan resource dan referensi  
4️⃣ Element dihapus dari memory
  ↓
🎯 Ketika showWidget = true lagi:
  ↓
1️⃣ Widget Tree: Container widget ditambahkan kembali
2️⃣ Element Tree: ContainerElement BARU dibuat
3️⃣ Mount element baru ke tree
  ↓
✅ Element Tree mengelola lifecycle: create → mount → unmount → dispose
🚀 Coba Sekarang!
Test lifecycle management di: https://zapp.run/
🎨 Render Tree: Rendering dan Layout
Render Tree bertanggung jawab untuk layout, painting, dan hit testing (deteksi touch). Ini adalah layer terakhir yang menghasilkan pixel di layar.
💻 Contoh Render Tree Impact:
dartimport 'package:flutter/material.dart';

class RenderTreeDemo extends StatefulWidget {
  @override
  _RenderTreeDemoState createState() => _RenderTreeDemoState();
}

class _RenderTreeDemoState extends State<RenderTreeDemo> {
  double containerSize = 100;
  Color containerColor = Colors.blue;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Render Tree Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Render Tree handles layout, painting & hit testing'),
            SizedBox(height: 20),
            // Widget yang akan di-render
            AnimatedContainer( // AnimatedContainer memicu render updates
              duration: Duration(milliseconds: 500),
              width: containerSize,
              height: containerSize,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Tap me!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Controls yang memicu re-rendering
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      containerSize = containerSize == 100 ? 150 : 100;
                    });
                  },
                  child: Text('Resize'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      containerColor = containerColor == Colors.blue 
                          ? Colors.red : Colors.blue;
                    });
                  },
                  child: Text('Recolor'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
📋 Render Tree Operations:
🎨 Render Tree Process:

🎯 Initial Render:
  ↓
1️⃣ LAYOUT: Calculate position & size of AnimatedContainer
   • Measure available space from parent (Column)
   • Set container size: 100x100 pixels
   • Calculate position: center of available space
  ↓
2️⃣ PAINT: Draw visual elements on screen
   • Fill rectangle with blue color
   • Draw rounded corners (border radius 8)
   • Paint text "Tap me!" in center with white color
  ↓
3️⃣ HIT TEST: Setup touch detection
   • Register container area as touchable region
   • Map touch coordinates to widget boundaries
  ↓
🎯 When setState() called (size/color change):
  ↓
1️⃣ LAYOUT: Recalculate if size changed
   • New size: 150x150 pixels (if resized)
   • Reposition widget if necessary
  ↓
2️⃣ PAINT: Repaint with new properties  
   • Change color from blue to red (if recolored)
   • Maintain text and border radius
  ↓
3️⃣ HIT TEST: Update touch regions
   • Adjust touchable area for new size
  ↓
✅ Screen updates with smooth animation (AnimatedContainer)
🚀 Coba Sekarang!
Lihat render tree dalam aksi di: https://zapp.run/
🔄 Interaksi Tiga Pohon
Ketiga pohon bekerja sama untuk menghasilkan UI yang efisien dan responsif:
💻 Demo Interaksi Ketiga Pohon:
dartimport 'package:flutter/material.dart';

class ThreeTreesDemo extends StatefulWidget {
  @override
  _ThreeTreesDemoState createState() => _ThreeTreesDemoState();
}

class _ThreeTreesDemoState extends State<ThreeTreesDemo> {
  int counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Three Trees Interaction')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Widget ini akan rebuild ketika counter berubah
            Text(
              'Counter: $counter',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Widget ini TIDAK akan rebuild (tidak bergantung pada state)
            Text(
              'This text never rebuilds',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
📋 Three Trees Interaction Flow:
🔄 When setState() called:

🌳 WIDGET TREE LEVEL:
  ↓
1️⃣ build() method called → New widget tree created
   • Text widget with new counter value: 'Counter: 1'
   • Other widgets remain same (SizedBox, ElevatedButton)
  ↓
🔗 ELEMENT TREE LEVEL:  
  ↓
2️⃣ Element tree compares old vs new widget tree
   • Text element: Detects content change → Needs update
   • SizedBox element: No change → Reuse existing
   • Button element: No change → Reuse existing
  ↓
3️⃣ Only changed elements marked for rebuild
   • Text element marked as dirty
   • Other elements remain clean
  ↓
🎨 RENDER TREE LEVEL:
  ↓
4️⃣ Only dirty render objects updated
   • Text render object: Repaint with new text
   • Layout recalculated only if text size changes
   • Other render objects untouched
  ↓
✅ RESULT: Efficient update - only changed parts re-rendered
🚀 Coba Sekarang!
Amati efisiensi tiga pohon di: https://zapp.run/

📄 StatelessWidget: Widget Statis
StatelessWidget adalah widget yang tidak memiliki state yang dapat berubah. Setelah dibuat, semua propertinya tidak dapat dimodifikasi. Widget ini ideal untuk konten yang statis atau tidak berubah.
🏗️ Struktur Dasar StatelessWidget
💻 Template StatelessWidget:
dartimport 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  // Properties (final - tidak dapat diubah)
  final String title;
  final Color backgroundColor;
  
  // Constructor
  const MyStatelessWidget({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.white,
  }) : super(key: key);
  
  // Build method - dipanggil untuk membangun UI
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Penggunaan widget
class StatelessDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StatelessWidget Demo')),
      body: Column(
        children: [
          MyStatelessWidget(
            title: 'First Widget',
            backgroundColor: Colors.blue.shade100,
          ),
          SizedBox(height: 20),
          MyStatelessWidget(
            title: 'Second Widget',
            backgroundColor: Colors.green.shade100,
          ),
        ],
      ),
    );
  }
}
📋 StatelessWidget Lifecycle:
📄 StatelessWidget Lifecycle:

🎯 Creation Phase:
  ↓
1️⃣ Constructor called → MyStatelessWidget(title: 'First Widget')
   • Properties set: title = 'First Widget', backgroundColor = Colors.blue
   • Properties become FINAL (immutable)
  ↓
2️⃣ Widget inserted into widget tree
   • Element created to manage this widget
  ↓
🎯 Rendering Phase:
  ↓
3️⃣ build() method called ONCE
   • Returns Container with Text child
   • UI constructed based on final properties
  ↓
4️⃣ Element tree connects to render tree
   • Visual representation painted on screen
  ↓
🎯 Usage Phase:
  ↓
5️⃣ Widget remains unchanged
   • Properties cannot be modified
   • build() not called again unless parent rebuilds
  ↓
✅ RESULT: Static widget with consistent appearance
🚀 Coba Sekarang!
Buat StatelessWidget kustom di: https://zapp.run/
🎨 Contoh Praktis StatelessWidget
💻 ProfileCard - StatelessWidget Complex:
dartimport 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String avatarUrl;
  final int followers;
  
  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.followers,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with avatar and name
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatItem('Followers', followers.toString()),
                _buildStatItem('Following', '128'),
                _buildStatItem('Posts', '256'),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  // Helper method untuk stat items
  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

// Penggunaan ProfileCard
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile StatelessWidget')),
      body: ListView(
        children: [
          ProfileCard(
            name: 'Alice Johnson',
            email: 'alice@example.com',
            avatarUrl: 'https://via.placeholder.com/150',
            followers: 1234,
          ),
          ProfileCard(
            name: 'Bob Smith',
            email: 'bob@example.com',
            avatarUrl: 'https://via.placeholder.com/150',
            followers: 5678,
          ),
        ],
      ),
    );
  }
}
📋 Complex StatelessWidget Structure:
🏗️ ProfileCard Widget Structure:

🎯 Input Properties (immutable):
name, email, avatarUrl, followers
  ↓
1️⃣ Card widget (container)
   └── Padding widget
       └── Column widget (main layout)
           ├── Row widget (header)
           │   ├── CircleAvatar (profile picture)
           │   ├── SizedBox (spacing)
           │   └── Expanded widget
           │       └── Column widget (name & email)
           ├── SizedBox (spacing)
           └── Row widget (stats)
               ├── _buildStatItem('Followers')
               ├── _buildStatItem('Following')
               └── _buildStatItem('Posts')
  ↓
2️⃣ Helper Method: _buildStatItem()
   • Takes label and value parameters
   • Returns Column with styled Text widgets
   • Reusable for consistent stats display
  ↓
✅ Result: Complex but stateless profile card
🚀 Coba Sekarang!
Bangun ProfileCard yang complex di: https://zapp.run/
✅ Kapan Menggunakan StatelessWidget
💻 Decision Guide - StatelessWidget Usage:
dartimport 'package:flutter/material.dart';

// ✅ GOOD: Static content display
class WelcomeMessage extends StatelessWidget {
  final String userName;
  
  const WelcomeMessage({Key? key, required this.userName}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        'Welcome, $userName!',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

// ✅ GOOD: Configuration-based widgets
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// ✅ GOOD: Layout widgets
class CenteredCard extends StatelessWidget {
  final Widget child;
  
  const CenteredCard({Key? key, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}

// Demo penggunaan
class StatelessUsageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StatelessWidget Best Practices')),
      body: Column(
        children: [
          WelcomeMessage(userName: 'Flutter Developer'),
          SizedBox(height: 20),
          CustomButton(
            text: 'Click Me',
            color: Colors.green,
            onPressed: () => print('Button pressed!'),
          ),
          SizedBox(height: 20),
          CenteredCard(
            child: Text('This is inside a centered card'),
          ),
        ],
      ),
    );
  }
}
📋 StatelessWidget Usage Guidelines:
📄 When to use StatelessWidget:

✅ PERFECT FOR:
  ↓
1️⃣ Static content display
   • Labels, titles, descriptions
   • Images that don't change
   • Icons and decorative elements
  ↓
2️⃣ Configuration-based widgets  
   • Custom buttons with fixed styles
   • Layout containers
   • Wrapper widgets
  ↓
3️⃣ Data presentation (read-only)
   • Profile cards with fixed data
   • List items that don't update
   • Charts with static data
  ↓
❌ NOT SUITABLE FOR:
  ↓
1️⃣ Interactive elements that change
   • Forms with input validation
   • Counters or timers
   • Toggle switches
  ↓
2️⃣ Data that updates from user actions
   • Shopping cart contents
   • Chat messages
   • Real-time data displays
  ↓
✅ Rule: If it doesn't change after creation, use StatelessWidget
🚀 Coba Sekarang!
Practice dengan various StatelessWidget di: https://zapp.run/

🔄 StatefulWidget: Widget Dinamis
StatefulWidget adalah widget yang memiliki state yang dapat berubah selama runtime. Widget ini ideal untuk konten yang interaktif atau dinamis yang perlu merespons input pengguna atau perubahan data.
🏗️ Struktur Dasar StatefulWidget
💻 Template StatefulWidget:
dartimport 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  // Properties dari widget (immutable seperti StatelessWidget)
  final String initialTitle;
  
  const MyStatefulWidget({Key? key, required this.initialTitle}) : super(key: key);
  
  // createState() - metode wajib untuk membuat State object
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

// State class - di sini semua state dan logic disimpan
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // Mutable state variables
  int counter = 0;
  String displayTitle = '';
  
  // initState() - dipanggil sekali saat State object dibuat
  @override
  void initState() {
    super.initState();
    displayTitle = widget.initialTitle; // Akses property dari widget
    print('State initialized');
  }
  
  // build() - dipanggil setiap kali state berubah
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            displayTitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Counter: $counter',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Icon(Icons.add),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _decrementCounter,
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  // Methods yang memodifikasi state
  void _incrementCounter() {
    setState(() {
      counter++;
      if (counter % 5 == 0) {
        displayTitle = 'Milestone: ${widget.initialTitle}';
      }
    });
  }
  
  void _decrementCounter() {
    setState(() {
      counter--;
      if (counter == 0) {
        displayTitle = widget.initialTitle;
      }
    });
  }
  
  // dispose() - cleanup ketika widget dihapus
  @override
  void dispose() {
    print('State disposed');
    super.dispose();
  }
}

// Penggunaan widget
class StatefulDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StatefulWidget Demo')),
      body: Center(
        child: MyStatefulWidget(initialTitle: 'Interactive Counter'),
      ),
    );
  }
}
📋 StatefulWidget Lifecycle:
🔄 StatefulWidget Lifecycle:

🎯 CREATION PHASE:
  ↓
1️⃣ StatefulWidget constructor called
   • Properties set (immutable)
   • Widget object created
  ↓
2️⃣ createState() called
   • State object created
   • State linked to widget
  ↓
3️⃣ initState() called on State
   • One-time initialization
   • Setup listeners, controllers, etc.
   • Access widget properties via widget.property
  ↓
🎯 BUILDING PHASE:
  ↓
4️⃣ build() called for first time
   • Initial UI constructed
   • Returns widget tree based on current state
  ↓
🎯 ACTIVE PHASE (during app usage):
  ↓
5️⃣ setState() called when state changes
   • State variables modified inside setState()
   • Flutter marks widget as dirty
   • build() called again to rebuild UI
  ↓
6️⃣ Steps 5 repeats as many times as needed
   • Every setState() triggers new build()
   • Only changed parts of UI are updated
  ↓
🎯 DESTRUCTION PHASE:
  ↓
7️⃣ dispose() called when widget removed
   • Cleanup resources
   • Cancel timers, close streams, etc.
   • State object destroyed
  ↓
✅ Complete lifecycle managed automatically by Flutter
🚀 Coba Sekarang!
Test complete StatefulWidget lifecycle di: https://zapp.run/
🎮 Contoh Interaktif - Game Counter
💻 Interactive Game Counter:
dartimport 'package:flutter/material.dart';

class GameCounter extends StatefulWidget {
  final String playerName;
  final int maxScore;
  
  const GameCounter({
    Key? key, 
    required this.playerName,
    this.maxScore = 100,
  }) : super(key: key);
  
  @override
  _GameCounterState createState() => _GameCounterState();
}

class _GameCounterState extends State<GameCounter> {
  int score = 0;
  int lives = 3;
  bool gameOver = false;
  String statusMessage = 'Game Started!';
  
  @override
  void initState() {
    super.initState();
    statusMessage = 'Welcome ${widget.playerName}!';
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Player name (from widget property - immutable)
            Text(
              'Player: ${widget.playerName}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            
            // Status message (mutable state)
            Text(
              statusMessage,
              style: TextStyle(
                fontSize: 16, 
                color: gameOver ? Colors.red : Colors.green,
              ),
            ),
            SizedBox(height: 20),
            
            // Score and lives (mutable state)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Score', style: TextStyle(fontSize: 14)),
                    Text('$score', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: [
                    Text('Lives', style: TextStyle(fontSize: 14)),
                    Row(
                      children: List.generate(3, (index) {
                        return Icon(
                          index < lives ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            
            // Game controls
            if (!gameOver) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _gainPoints,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text('Gain Points (+10)'),
                  ),
                  ElevatedButton(
                    onPressed: _loseLife,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('Lose Life'),
                  ),
                ],
              ),
            ] else ...[
              Column(
                children: [
                  Text(
                    'GAME OVER',
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _resetGame,
                    child: Text('Play Again'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
  
  void _gainPoints() {
    setState(() {
      score += 10;
      if (score >= widget.maxScore) {
        statusMessage = 'You Win! 🎉';
        gameOver = true;
      } else {
        statusMessage = 'Good job! Keep going!';
      }
    });
  }
  
  void _loseLife() {
    setState(() {
      lives--;
      if (lives <= 0) {
        statusMessage = 'No more lives! 💀';
        gameOver = true;
      } else {
        statusMessage = 'Ouch! Be careful!';
      }
    });
  }
  
  void _resetGame() {
    setState(() {
      score = 0;
      lives = 3;
      gameOver = false;
      statusMessage = 'Game Reset! Good luck!';
    });
  }
}

// Demo screen
class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StatefulWidget Game')),
      body: ListView(
        children: [
          GameCounter(playerName: 'Alice', maxScore: 50),
          GameCounter(playerName: 'Bob', maxScore: 80),
        ],
      ),
    );
  }
}
📋 Interactive State Management:
🎮 Game Counter State Flow:

🎯 Initial State:
score=0, lives=3, gameOver=false, statusMessage='Welcome Alice!'
  ↓
1️⃣ User clicks "Gain Points (+10)":
   • setState() called
   • score += 10 (score becomes 10)
   • Check win condition: 10 >= 50? No
   • statusMessage = 'Good job! Keep going!'
   • build() called → UI updates with new score and message
  ↓
2️⃣ User clicks "Lose Life":
   • setState() called  
   • lives-- (lives becomes 2)
   • Check game over: lives <= 0? No
   • statusMessage = 'Ouch! Be careful!'
   • build() called → UI updates hearts and message
  ↓
3️⃣ If lives reach 0:
   • setState() called
   • gameOver = true
   • statusMessage = 'No more lives! 💀'
   • build() called → UI shows "GAME OVER" and "Play Again" button
  ↓
4️⃣ User clicks "Play Again":
   • setState() called
   • Reset all state: score=0, lives=3, gameOver=false
   • statusMessage = 'Game Reset! Good luck!'
   • build() called → UI back to initial state
  ↓
✅ State management handles all game logic and UI updates
🚀 Coba Sekarang!
Main game counter interaktif di: https://zapp.run/

⚡ Mengelola State dengan setState()
setState() adalah mekanisme fundamental dalam StatefulWidget untuk memberitahu Flutter bahwa state internal telah berubah dan UI perlu diperbarui. Memahami cara kerja setState() sangat penting untuk mengelola state dengan efisien.
🔧 Cara Kerja setState()
💻 Basic setState() Usage:
dartimport 'package:flutter/material.dart';

class SetStateDemo extends StatefulWidget {
  @override
  _SetStateDemoState createState() => _SetStateDemoState();
}

class _SetStateDemoState extends State<SetStateDemo> {
  int buildCount = 0;
  String message = 'Click button to trigger setState';
  Color backgroundColor = Colors.white;
  
  @override
  Widget build(BuildContext context) {
    // Increment build count setiap build() dipanggil
    buildCount++;
    
    print('build() called - Build count: $buildCount');
    
    return Scaffold(
      appBar: AppBar(title: Text('setState() Demo')),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Build Count: $buildCount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _updateWithSetState,
              child: Text('Update with setState()'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _updateWithoutSetState,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Update WITHOUT setState()'),
            ),
          ],
        ),
      ),
    );
  }
  
  void _updateWithSetState() {
    // ✅ CORRECT: Using setState() to update state
    setState(() {
      message = 'Updated with setState() - Build: $buildCount';
      backgroundColor = Colors.lightBlue.shade100;
    });
    print('setState() called - State updated');
  }
  
  void _updateWithoutSetState() {
    // ❌ WRONG: Updating state without setState()
    message = 'Updated WITHOUT setState() - Build: $buildCount';
    backgroundColor = Colors.red.shade100;
    print('State updated without setState() - UI will NOT update!');
  }
}
📋 setState() Mechanism:
⚡ How setState() Works:

🎯 When setState() is called:
  ↓
1️⃣ BEFORE setState():
   • Current state: message='Click button...', backgroundColor=Colors.white
   • UI shows current state
  ↓
2️⃣ setState(() { ... }) EXECUTION:
   • Anonymous function parameter executed
   • State variables modified: message='Updated...', backgroundColor=Colors.blue
   • State object marked as "dirty"
  ↓
3️⃣ AFTER setState():
   • Flutter scheduling system notified
   • Widget marked for rebuild in next frame
  ↓
4️⃣ REBUILD TRIGGER:
   • build() method called again
   • New widget tree created with updated state
   • buildCount incremented (showing build() was called)
  ↓
5️⃣ UI UPDATE:
   • Element tree compares old vs new widget tree
   • Render tree updates only changed parts
   • Screen shows new message and background color
  ↓
✅ RESULT: UI automatically synchronized with state changes

❌ Without setState():
State variables change → No rebuild triggered → UI remains old → User sees stale data
🚀 Coba Sekarang!
Test perbedaan dengan dan tanpa setState() di: https://zapp.run/
🎯 Best Practices setState()
💻 setState() Best Practices:
dartimport 'package:flutter/material.dart';

class SetStateBestPractices extends StatefulWidget {
  @override
  _SetStateBestPracticesState createState() => _SetStateBestPracticesState();
}

class _SetStateBestPracticesState extends State<SetStateBestPractices> {
  int counter = 0;
  List<String> items = [];
  bool isLoading = false;
  String errorMessage = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('setState() Best Practices')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Counter example
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Counter: $counter', style: TextStyle(fontSize: 24)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _incrementCounter,
                          child: Text('Good setState()'),
                        ),
                        ElevatedButton(
                          onPressed: _badSetStateExample,
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                          child: Text('Bad setState()'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 20),
            
            // Async operation example
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Items: ${items.length}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    if (isLoading)
                      CircularProgressIndicator()
                    else if (errorMessage.isNotEmpty)
                      Text(errorMessage, style: TextStyle(color: Colors.red))
                    else
                      Text('Items loaded successfully'),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _loadDataGood,
                      child: Text('Load Data (Good)'),
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: _loadDataBad,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      child: Text('Load Data (Bad)'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // ✅ GOOD: Simple setState() with minimal logic
  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }
  
  // ❌ BAD: Heavy computation inside setState()
  void _badSetStateExample() {
    setState(() {
      // Don't do heavy computation here!
      for (int i = 0; i < 1000000; i++) {
        // Expensive operation that blocks UI
        counter += 0; // Dummy expensive operation
      }
      counter++;
    });
  }
  
  // ✅ GOOD: Async operations with proper state management
  Future<void> _loadDataGood() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });
    
    try {
      // Simulate network call
      await Future.delayed(Duration(seconds: 2));
      
      // Simulate data loading
      List<String> newItems = ['Item 1', 'Item 2', 'Item 3'];
      
      setState(() {
        items.addAll(newItems);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load data: $e';
      });
    }
  }
  
  // ❌ BAD: Async operation without proper state management
  Future<void> _loadDataBad() async {
    // Missing loading state
    try {
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        items.clear(); // Dangerous: clearing without user knowing
        items.addAll(['Bad Item 1', 'Bad Item 2']);
        // Missing error handling
      });
    } catch (e) {
      // Error not handled - user won't know what happened
      print('Error: $e');
    }
  }
}
📋 setState() Best Practices Guide:
⚡ setState() Best Practices:

✅ DO:
  ↓
1️⃣ Keep setState() calls minimal and focused
   setState(() {
     counter++;  // Simple state update
   });
  ↓
2️⃣ Do heavy computation OUTSIDE setState()
   // Heavy work here
   var result = expensiveCalculation();
   setState(() {
     data = result;  // Only update state here
   });
  ↓
3️⃣ Handle loading and error states
   setState(() { isLoading = true; });
   try { ... } catch (e) {
     setState(() { errorMessage = e.toString(); });
   }
  ↓
❌ DON'T:
  ↓
1️⃣ Do heavy computation inside setState()
   setState(() {
     for (int i = 0; i < 1000000; i++) { ... }  // Blocks UI!
   });
  ↓
2️⃣ Call setState() after widget is disposed
   // Check if still mounted
   if (mounted) { setState(() { ... }); }
  ↓
3️⃣ Call setState() from initState() or dispose()
   // These methods have specific purposes
  ↓
✅ Remember: setState() = "State changed, please rebuild UI"
🚀 Coba Sekarang!
Practice good setState() patterns di: https://zapp.run/
🔄 setState() vs Manual Rebuilds
💻 Understanding When Rebuilds Happen:
dartimport 'package:flutter/material.dart';

class RebuildDemo extends StatefulWidget {
  @override
  _RebuildDemoState createState() => _RebuildDemoState();
}

class _RebuildDemoState extends State<RebuildDemo> {
  int stateCounter = 0;
  int nonStateCounter = 0;
  
  @override
  Widget build(BuildContext context) {
    print('🏗️ build() called - State: $stateCounter, NonState: $nonStateCounter');
    
    return Scaffold(
      appBar: AppBar(title: Text('Rebuild Demonstration')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Build method called every time you see this message in console',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 30),
            
            // State-managed counter (will cause rebuild)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text('State Counter (Rebuilds UI)', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('$stateCounter', style: TextStyle(fontSize: 32)),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        stateCounter++;
                      });
                    },
                    child: Text('Increment with setState()'),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            // Non-state counter (won't cause rebuild)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text('Non-State Counter (No Rebuild)', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('$nonStateCounter', style: TextStyle(fontSize: 32)),
                  ElevatedButton(
                    onPressed: () {
                      // This won't update the UI!
                      nonStateCounter++;
                      print('❌ nonStateCounter incremented to $nonStateCounter but UI not updated');
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('Increment WITHOUT setState()'),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            // Manual rebuild trigger
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Force rebuild without changing stateCounter
                  // This will show current nonStateCounter value
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('Force Rebuild (setState with no changes)'),
            ),
          ],
        ),
      ),
    );
  }
}
📋 Rebuild Behavior Analysis:
🔄 Rebuild Behavior Explanation:

🎯 Scenario 1: setState() called with state change
  ↓
1️⃣ User clicks "Increment with setState()"
2️⃣ setState(() { stateCounter++; }) executed
3️⃣ Flutter marks widget as dirty
4️⃣ build() called on next frame
5️⃣ UI updates with new stateCounter value
  ↓
✅ Result: Console shows "build() called", UI shows incremented value

🎯 Scenario 2: Direct state modification (no setState)
  ↓
1️⃣ User clicks "Increment WITHOUT setState()"
2️⃣ nonStateCounter++ executed directly
3️⃣ No setState() called → Widget not marked as dirty
4️⃣ build() NOT called
5️⃣ UI still shows old nonStateCounter value
  ↓
❌ Result: Variable changed but UI not updated (stale UI)

🎯 Scenario 3: Force rebuild without state change
  ↓
1️⃣ User clicks "Force Rebuild"
2️⃣ setState(() { }) called with empty function
3️⃣ Flutter marks widget as dirty (even with no changes)
4️⃣ build() called on next frame
5️⃣ UI rebuilt with current variable values
  ↓
✅ Result: nonStateCounter now shows updated value in UI!

🔑 Key Insight: setState() triggers rebuild, not state change itself
🚀 Coba Sekarang!
Observe rebuild behavior di: https://zapp.run/

💻 Praktikum 5: Aplikasi Penghitung Interaktif
Dalam praktikum ini, kita akan membangun aplikasi penghitung yang mendemonstrasikan konsep StatelessWidget vs StatefulWidget, serta penggunaan setState() yang efektif.
🎯 Tujuan Praktikum
Setelah menyelesaikan praktikum ini, mahasiswa akan mampu:

🔍 Menganalisis keterbatasan StatelessWidget untuk data yang berubah
🏗️ Membangun StatefulWidget dengan lifecycle yang tepat
⚡ Mengimplementasikan setState() untuk update UI yang efisien
🎨 Merancang aplikasi interaktif dengan state management yang baik

📋 Struktur Praktikum
Phase 1: Foundation (30 menit)

Setup dan pemahaman konsep dasar
Implementasi StatelessWidget sederhana
Identifikasi keterbatasan untuk interaktivitas

Phase 2: Implementation (45 menit)

Konversi ke StatefulWidget
Implementasi state management
Testing dan debugging

Phase 3: Enhancement (30 menit)

Fitur lanjutan dan optimasi
Best practices implementation
Code review dan improvement


📝 Tugas 1: Memahami Keterbatasan StatelessWidget
🎯 Objektif: Membangun counter menggunakan StatelessWidget untuk memahami mengapa tidak cocok untuk data yang berubah.
⏱️ Estimasi Waktu: 15 menit
💻 Template Awal - StatelessWidget Counter:
dartimport 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless Counter Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: StatelessCounterScreen(),
    );
  }
}

// TODO: Lengkapi implementasi StatelessWidget counter ini
class StatelessCounterScreen extends StatelessWidget {
  // TODO: Coba deklarasikan counter variable di sini
  // Apa yang terjadi jika Anda membuat final int counter = 0?
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatelessWidget Counter'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                children: [
                  Icon(Icons.warning, color: Colors.red, size: 48),
                  SizedBox(height: 10),
                  Text(
                    'StatelessWidget Demo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Try to make this counter work!',
                    style: TextStyle(color: Colors.red.shade600),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 40),
            
            // Counter display
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '0', // TODO: Ganti dengan counter variable
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            
            SizedBox(height: 40),
            
            // Button section
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Coba increment counter di sini
                // Apa yang terjadi? Mengapa UI tidak update?
                print('Button pressed - trying to increment counter');
              },
              icon: Icon(Icons.add),
              label: Text('Try to Increment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            
            SizedBox(height: 30),
            
            // Explanation panel
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🤔 Why doesn\'t this work?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• StatelessWidget properties are immutable (final)\n'
                    '• No setState() method available\n'
                    '• build() only called once\n'
                    '• Perfect for static content only',
                    style: TextStyle(color: Colors.orange.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
📋 Langkah-langkah Implementasi:
🔍 Step-by-Step Analysis:

1️⃣ SETUP (3 menit):
   • Copy template code ke zapp.run
   • Run aplikasi dan lihat tampilan awal
   • Perhatikan struktur StatelessWidget
   ↓
2️⃣ EXPERIMENT (5 menit):
   • Deklarasikan: final int counter = 0;
   • Ganti Text('0') dengan Text('$counter')
   • Coba increment counter di onPressed
   ↓
3️⃣ OBSERVE (4 menit):
   • Klik button beberapa kali
   • Check console untuk print statement
   • Amati: UI tidak berubah meski button diklik
   ↓
4️⃣ ANALYZE (3 menit):
   • Mengapa counter tidak bisa di-increment?
   • Mengapa UI tidak update?
   • Apa keterbatasan StatelessWidget?
   ↓
✅ Expected Result: Counter tidak berfungsi, UI tetap menampilkan 0
🚀 Coba Sekarang!
Implement dan analyze StatelessWidget limitations di: https://zapp.run/

📝 Tugas 2: Implementasi Counter dengan StatefulWidget
🎯 Objektif: Membangun counter yang fungsional menggunakan StatefulWidget dengan state management yang tepat.
⏱️ Estimasi Waktu: 25 menit
💻 Template StatefulWidget Counter:
dartimport 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: TextStyle(fontSize: 16),
          ),
        ),
      ),
      home: StatefulCounterScreen(),
    );
  }
}

// TODO: Convert this to StatefulWidget
class StatefulCounterScreen extends StatefulWidget {
  @override
  _StatefulCounterScreenState createState() => _StatefulCounterScreenState();
}

class _StatefulCounterScreenState extends State<StatefulCounterScreen> {
  // TODO: Declare mutable state variables
  int counter = 0;
  String statusMessage = 'Ready to count!';
  Color counterColor = Colors.blue;
  bool showCelebration = false;
  
  @override
  void initState() {
    super.initState();
    // TODO: Initialize state if needed
    print('Counter app initialized');
    _updateStatus();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interactive Counter'),
        elevation: 2,
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
          children: [
            // Status message with animation
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: showCelebration ? Colors.amber.shade100 : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: showCelebration ? Colors.amber : Colors.grey.shade300,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showCelebration) ...[
                    Icon(Icons.celebration, color: Colors.amber, size: 20),
                    SizedBox(width: 8),
                  ],
                  Text(
                    statusMessage,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: showCelebration ? FontWeight.bold : FontWeight.normal,
                      color: showCelebration ? Colors.amber.shade700 : Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 50),
            
            // Main counter display
            Column(
              children: [
                Text(
                  'Counter',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 10),
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 200),
                  style: TextStyle(
                    fontSize: showCelebration ? 80 : 72,
                    fontWeight: FontWeight.bold,
                    color: counterColor,
                  ),
                  child: Text('$counter'),
                ),
              ],
            ),
            
            SizedBox(height: 50),
            
            // Control buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrement button
                FloatingActionButton(
                  onPressed: counter > 0 ? _decrementCounter : null,
                  backgroundColor: counter > 0 ? Colors.red.shade400 : Colors.grey.shade300,
                  heroTag: "decrement",
                  child: Icon(
                    Icons.remove,
                    color: counter > 0 ? Colors.white : Colors.grey,
                  ),
                ),
                
                SizedBox(width: 40),
                
                // Increment button
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  backgroundColor: Colors.green.shade400,
                  heroTag: "increment",
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            
            SizedBox(height: 30),
            
            // Info cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCard('Even/Odd', counter % 2 == 0 ? 'Even' : 'Odd'),
                _buildInfoCard('Sign', counter == 0 ? 'Zero' : (counter > 0 ? 'Positive' : 'Negative')),
                _buildInfoCard('Absolute', '${counter.abs()}'),
              ],
            ),
            
            SizedBox(height: 20),
            
            // Reset button
            if (counter != 0)
              TextButton.icon(
                onPressed: _resetCounter,
                icon: Icon(Icons.refresh, size: 20),
                label: Text('Reset to Zero'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey.shade600,
                ),
              ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildInfoCard(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade700,
            ),
          ),
          SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue.shade500,
            ),
          ),
        ],
      ),
    );
  }
  
  // TODO: Implement counter methods
  void _incrementCounter() {
    setState(() {
      counter++;
      _updateStatus();
    });
  }
  
  void _decrementCounter() {
    setState(() {
      counter--;
      _updateStatus();
    });
  }
  
  void _resetCounter() {
    setState(() {
      counter = 0;
      _updateStatus();
    });
  }
  
  void _updateStatus() {
    // TODO: Implement status logic
    if (counter == 0) {
      statusMessage = 'Ready to count!';
      counterColor = Colors.blue;
      showCelebration = false;
    } else if (counter > 0) {
      if (counter % 10 == 0) {
        statusMessage = 'Milestone reached: $counter! 🎉';
        counterColor = Colors.orange;
        showCelebration = true;
      } else if (counter % 5 == 0) {
        statusMessage = 'Nice! You reached $counter';
        counterColor = Colors.green;
        showCelebration = false;
      } else {
        statusMessage = 'Counting up: $counter';
        counterColor = Colors.blue;
        showCelebration = false;
      }
    } else {
      statusMessage = 'Going negative: $counter';
      counterColor = Colors.red;
      showCelebration = false;
    }
  }
  
  @override
  void dispose() {
    print('Counter app disposed');
    super.dispose();
  }
}
📋 Implementation Checklist:
🏗️ StatefulWidget Implementation Guide:

1️⃣ STRUCTURE SETUP (8 menit):
   • Convert StatelessWidget to StatefulWidget
   • Create State class with proper naming
   • Implement createState() method
   • Add lifecycle methods (initState, dispose)
   ↓
2️⃣ STATE MANAGEMENT (10 menit):
   • Declare mutable state variables
   • Implement _incrementCounter() with setState()
   • Implement _decrementCounter() with setState()
   • Implement _resetCounter() with setState()
   ↓
3️⃣ UI ENHANCEMENTS (7 menit):
   • Add dynamic status messages
   • Implement color changes based on counter
   • Add celebration animation for milestones
   • Add info cards with computed properties
   ↓
✅ Expected Features:
   • Working increment/decrement buttons
   • Dynamic status messages
   • Color changes based on value
   • Celebration animation at milestones
   • Info cards showing even/odd, sign, absolute value
🚀 Coba Sekarang!
Build complete interactive counter di: https://zapp.run/

📝 Tugas 3: Multi-Counter Dashboard
🎯 Objektif: Membangun aplikasi dengan multiple counter dan operasi global untuk memahami state management yang lebih kompleks.
⏱️ Estimasi Waktu: 25 menit
💻 Multi-Counter Implementation:
dartimport 'package:flutter/material.dart';

void main() {
  runApp(MultiCounterApp());
}

class MultiCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Counter Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: MultiCounterScreen(),
    );
  }
}

class MultiCounterScreen extends StatefulWidget {
  @override
  _MultiCounterScreenState createState() => _MultiCounterScreenState();
}

class _MultiCounterScreenState extends State<MultiCounterScreen> {
  // TODO: Implement state untuk multiple counters
  List<int> counters = [0, 0, 0, 0]; // 4 counters
  List<String> counterNames = ['Alpha', 'Beta', 'Gamma', 'Delta'];
  List<Color> counterColors = [
    Colors.red.shade400,
    Colors.green.shade400,
    Colors.blue.shade400,
    Colors.purple.shade400,
  ];
  List<IconData> counterIcons = [
    Icons.star,
    Icons.favorite,
    Icons.flash_on,
    Icons.diamond,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Counter Dashboard'),
        centerTitle: true,
        elevation: 2,
        actions: [
          PopupMenuButton<String>(
            onSelected: _handleGlobalAction,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: 'increment_all', child: Text('Increment All')),
                PopupMenuItem(value: 'decrement_all', child: Text('Decrement All')),
                PopupMenuItem(value: 'reset_all', child: Text('Reset All')),
              ];
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          // Global statistics panel
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade50, Colors.indigo.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Dashboard Statistics',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade700,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard('Total', _getTotalCount(), Icons.sum),
                    _buildStatCard('Average', _getAverageCount().toStringAsFixed(1), Icons.trending_up),
                    _buildStatCard('Range', _getRangeCount().toString(), Icons.straighten),
                  ],
                ),
              ],
            ),
          ),
          
          // Counter grid
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: counters.length,
                itemBuilder: (context, index) {
                  return _buildCounterCard(index);
                },
              ),
            ),
          ),
          
          // Global control buttons
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Column(
              children: [
                Text(
                  'Global Actions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      'Increment All',
                      Icons.keyboard_arrow_up,
                      Colors.green,
                      () => _handleGlobalAction('increment_all'),
                    ),
                    _buildActionButton(
                      'Decrement All',
                      Icons.keyboard_arrow_down,
                      Colors.orange,
                      () => _handleGlobalAction('decrement_all'),
                    ),
                    _buildActionButton(
                      'Reset All',
                      Icons.refresh,
                      Colors.red,
                      () => _handleGlobalAction('reset_all'),
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
  
  Widget _buildStatCard(String label, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.shade100,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.indigo, size: 24),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo.shade700,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.indigo.shade500,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCounterCard(int index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Header with name and icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      counterIcons[index],
                      color: counterColors[index],
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      counterNames[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: counterColors[index].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${counters[index]}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: counterColors[index],
                    ),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 16),
            
            // Counter controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCounterButton(
                  Icons.remove,
                  Colors.red.shade400,
                  counters[index] > 0 ? () => _decrementCounter(index) : null,
                ),
                _buildCounterButton(
                  Icons.refresh,
                  Colors.grey.shade400,
                  counters[index] != 0 ? () => _resetCounter(index) : null,
                ),
                _buildCounterButton(
                  Icons.add,
                  Colors.green.shade400,
                  () => _incrementCounter(index),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCounterButton(IconData icon, Color color, VoidCallback? onPressed) {
    return SizedBox(
      width: 36,
      height: 36,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed != null ? color : Colors.grey.shade300,
          shape: CircleBorder(),
          padding: EdgeInsets.zero,
          elevation: onPressed != null ? 2 : 0,
        ),
        child: Icon(
          icon,
          color: onPressed != null ? Colors.white : Colors.grey,
          size: 18,
        ),
      ),
    );
  }
  
  Widget _buildActionButton(String text, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(text, style: TextStyle(fontSize: 12)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
  
  // TODO: Implement individual counter methods
  void _incrementCounter(int index) {
    setState(() {
      counters[index]++;
    });
  }
  
  void _decrementCounter(int index) {
    setState(() {
      counters[index]--;
    });
  }
  
  void _resetCounter(int index) {
    setState(() {
      counters[index] = 0;
    });
  }
  
  // TODO: Implement global action methods
  void _handleGlobalAction(String action) {
    setState(() {
      switch (action) {
        case 'increment_all':
          for (int i = 0; i < counters.length; i++) {
            counters[i]++;
          }
          break;
        case 'decrement_all':
          for (int i = 0; i < counters.length; i++) {
            counters[i]--;
          }
          break;
        case 'reset_all':
          for (int i = 0; i < counters.length; i++) {
            counters[i] = 0;
          }
          break;
      }
    });
    
    // Show feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_getActionMessage(action)),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.indigo,
      ),
    );
  }
  
  String _getActionMessage(String action) {
    switch (action) {
      case 'increment_all':
        return 'All counters incremented!';
      case 'decrement_all':
        return 'All counters decremented!';
      case 'reset_all':
        return 'All counters reset to zero!';
      default:
        return 'Action completed!';
    }
  }
  
  // TODO: Implement calculation methods
  int _getTotalCount() {
    return counters.fold(0, (sum, counter) => sum + counter);
  }
  
  double _getAverageCount() {
    if (counters.isEmpty) return 0.0;
    return _getTotalCount() / counters.length;
  }
  
  int _getRangeCount() {
    if (counters.isEmpty) return 0;
    int min = counters.reduce((a, b) => a < b ? a : b);
    int max = counters.reduce((a, b) => a > b ? a : b);
    return max - min;
  }
}
📋 Multi-Counter Implementation Guide:
🎯 Multi-Counter Dashboard Features:

1️⃣ INDIVIDUAL COUNTER MANAGEMENT (8 menit):
   • Each counter with unique name, color, icon
   • Independent increment/decrement/reset operations
   • Visual feedback with color-coded buttons
   • Conditional button states (disable when appropriate)
   ↓
2️⃣ GLOBAL OPERATIONS (8 menit):
   • Increment all counters simultaneously
   • Decrement all counters simultaneously
   • Reset all counters to zero
   • Global action feedback with SnackBar
   ↓
3️⃣ DASHBOARD STATISTICS (9 menit):
   • Total: Sum of all counter values
   • Average: Mean value across all counters
   • Range: Difference between max and min values
   • Real-time updates with every state change
   ↓
✅ Advanced Features:
   • Grid layout for multiple counters
   • Pop-up menu for global actions
   • Statistics panel with live calculations
   • Professional UI with cards and animations
🚀 Coba Sekarang!
Build advanced multi-counter dashboard di: https://zapp.run/

📝 Tugas 4: Counter dengan Animasi (Bonus Challenge)
🎯 Objektif: Implementasi counter dengan animasi dan efek visual untuk memahami integrasi animation dengan state management.
⏱️ Estimasi Waktu: 20 menit (Opsional)
💻 Animated Counter Template:
dartimport 'package:flutter/material.dart';

void main() {
  runApp(AnimatedCounterApp());
}

class AnimatedCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Counter',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
      ),
      home: AnimatedCounterScreen(),
    );
  }
}

class AnimatedCounterScreen extends StatefulWidget {
  @override
  _AnimatedCounterScreenState createState() => _AnimatedCounterScreenState();
}

class _AnimatedCounterScreenState extends State<AnimatedCounterScreen>
    with TickerProviderStateMixin {
  
  int counter = 0;
  late AnimationController _scaleController;
  late AnimationController _colorController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;
  
  @override
  void initState() {
    super.initState();
    
    // Setup animations
    _scaleController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    
    _colorController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));
    
    _colorAnimation = ColorTween(
      begin: Colors.deepPurple,
      end: Colors.amber,
    ).animate(_colorController);
  }
  
  @override
  void dispose() {
    _scaleController.dispose();
    _colorController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Counter'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade400,
              Colors.deepPurple.shade
600,
],
),
),
child: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
// Animated counter display
AnimatedBuilder(
animation: Listenable.merge([_scaleAnimation, _colorAnimation]),
builder: (context, child) {
return Transform.scale(
scale: _scaleAnimation.value,
child: Container(
padding: EdgeInsets.all(20),
decoration: BoxDecoration(
color: Colors.white.withOpacity(0.9),
borderRadius: BorderRadius.circular(20),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.1),
blurRadius: 10,
offset: Offset(0, 5),
),
],
),
child: Column(
children: [
Text(
'Counter Value',
style: TextStyle(
fontSize: 18,
color: Colors.grey.shade600,
fontWeight: FontWeight.w300,
),
),
SizedBox(height: 10),
Text(
'$counter',
style: TextStyle(
fontSize: 80,
fontWeight: FontWeight.bold,
color: _colorAnimation.value,
),
),
],
),
),
);
},
),
          SizedBox(height: 60),
          
          // Animated control buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Decrement button with animation
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                transform: Matrix4.identity()..scale(counter <= 0 ? 0.8 : 1.0),
                child: FloatingActionButton(
                  onPressed: counter > 0 ? _decrementCounter : null,
                  backgroundColor: counter > 0 ? Colors.red.shade400 : Colors.grey.shade300,
                  heroTag: "decrement",
                  child: Icon(
                    Icons.remove,
                    color: counter > 0 ? Colors.white : Colors.grey,
                    size: 28,
                  ),
                ),
              ),
              
              SizedBox(width: 50),
              
              // Reset button with rotation animation
              AnimatedRotation(
                turns: counter == 0 ? 0 : 1,
                duration: Duration(milliseconds: 400),
                child: FloatingActionButton(
                  onPressed: counter != 0 ? _resetCounter : null,
                  backgroundColor: counter != 0 ? Colors.grey.shade600 : Colors.grey.shade300,
                  heroTag: "reset",
                  child: Icon(
                    Icons.refresh,
                    color: counter != 0 ? Colors.white : Colors.grey,
                    size: 28,
                  ),
                ),
              ),
              
              SizedBox(width: 50),
              
              // Increment button with pulse animation
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                transform: Matrix4.identity()..scale(1.0),
                child: FloatingActionButton(
                  onPressed: _incrementCounter,
                  backgroundColor: Colors.green.shade400,
                  heroTag: "increment",
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 40),
          
          // Milestone indicator
          if (counter % 10 == 0 && counter > 0)
            AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(milliseconds: 500),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.amber),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Milestone: $counter! 🎉',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
void _incrementCounter() {
setState(() {
counter++;
});
_triggerAnimation();
}
void _decrementCounter() {
setState(() {
counter--;
});
_triggerAnimation();
}
void _resetCounter() {
setState(() {
counter = 0;
});
_triggerAnimation();
_colorController.reset();
}
void _triggerAnimation() {
// Scale animation for counter display
scaleController.forward().then(() {
_scaleController.reverse();
});
// Color animation for milestones
if (counter % 5 == 0 && counter > 0) {
  _colorController.forward().then((_) {
    _colorController.reverse();
  });
}
}
}

📋 **Animation Integration Guide:**
🎬 Animated Counter Features:
1️⃣ SCALE ANIMATION (5 menit):
• Counter scales up when value changes
• Elastic curve for bouncy effect
• Automatic reverse after forward animation
↓
2️⃣ COLOR ANIMATION (5 menit):
• Color changes at milestones (every 5th count)
• Smooth transition from purple to amber
• ColorTween for smooth color interpolation
↓
3️⃣ BUTTON ANIMATIONS (5 menit):
• Decrement button scales down when disabled
• Reset button rotates when counter is not zero
• Visual feedback for button states
↓
4️⃣ MILESTONE EFFECTS (5 menit):
• Special indicator appears at multiples of 10
• Animated opacity for smooth appearance
• Star icon and celebration message
↓
✅ Animation Best Practices:
• Use TickerProviderStateMixin for multiple animations
• Dispose animation controllers properly
• Combine multiple animations with Listenable.merge

🚀 **Coba Sekarang!** 
Experience animated counter interactions di: https://zapp.run/

---

### 🏆 **Submission dan Evaluasi**

#### **📋 Submission Requirements**

Setelah menyelesaikan semua tugas, pastikan implementasi Anda mencakup:

**✅ Tugas Wajib:**
1. **StatelessWidget Analysis** - Demonstrasi keterbatasan dan penjelasan
2. **StatefulWidget Counter** - Counter fungsional dengan state management
3. **Multi-Counter Dashboard** - Multiple counter dengan operasi global

**🌟 Tugas Bonus:**
4. **Animated Counter** - Counter dengan animasi dan efek visual

#### **📊 Kriteria Penilaian**

| **Aspek** | **Bobot** | **Kriteria Penilaian** |
|-----------|-----------|-------------------------|
| **🏗️ Implementation** | 40% | • Correct StatefulWidget structure<br>• Proper setState() usage<br>• Working counter functionality |
| **🎨 UI/UX Design** | 25% | • Clean and intuitive interface<br>• Responsive button states<br>• Visual feedback for user actions |
| **🧠 Understanding** | 20% | • Clear distinction between Stateless/Stateful<br>• Proper lifecycle method usage<br>• Efficient state management |
| **💡 Code Quality** | 15% | • Clean, readable code<br>• Proper naming conventions<br>• Meaningful comments |

#### **🎯 Learning Outcomes Assessment**

📋 **Self-Evaluation Checklist:**
🔍 After completing this praktikum, I can:
✅ BASIC CONCEPTS:
□ Explain the difference between StatelessWidget and StatefulWidget
□ Describe when to use each type of widget
□ Understand the widget lifecycle (initState, build, dispose)
✅ STATE MANAGEMENT:
□ Implement setState() correctly for UI updates
□ Manage multiple state variables efficiently
□ Handle state changes without blocking the UI
✅ UI DEVELOPMENT:
□ Build interactive interfaces with dynamic content
□ Provide visual feedback for user actions
□ Create responsive and user-friendly designs
✅ ADVANCED FEATURES:
□ Implement complex state logic (bonus)
□ Integrate animations with state changes (bonus)
□ Handle multiple counter instances simultaneously

#### **📝 Reflection Questions**

Setelah menyelesaikan praktikum, jawab pertanyaan refleksi ini:

1. **🤔 Conceptual Understanding:**
   - Mengapa StatelessWidget tidak cocok untuk counter app?
   - Apa yang terjadi jika Anda lupa memanggil setState()?
   - Bagaimana Flutter tahu kapan harus rebuild UI?

2. **⚡ Performance Considerations:**
   - Apakah semua widget rebuild ketika setState() dipanggil?
   - Bagaimana cara mengoptimalkan performa dengan state management?
   - Kapan sebaiknya menggunakan animation dalam state updates?

3. **🏗️ Architecture Insights:**
   - Bagaimana Anda akan mengelola state yang lebih kompleks?
   - Apa kelebihan dan kekurangan setState() untuk aplikasi besar?
   - Kapan Anda perlu mempertimbangkan state management solution lain?

---

## 📚 Glosarium

| **Term** | **Definition** | **Example** |
|----------|----------------|-------------|
| **AnimationController** | Controller untuk mengelola animasi duration dan state | `AnimationController(duration: Duration(seconds: 1), vsync: this)` |
| **build() method** | Method yang mengembalikan widget tree untuk UI | `Widget build(BuildContext context) { return Text('Hello'); }` |
| **BuildContext** | Handle ke lokasi widget dalam widget tree | `Theme.of(context)`, `Navigator.of(context)` |
| **createState()** | Method dalam StatefulWidget yang membuat State object | `_MyWidgetState createState() => _MyWidgetState();` |
| **dispose()** | Method lifecycle untuk cleanup resources | Membersihkan timers, controllers, streams |
| **Element Tree** | Pohon yang mengelola lifecycle dan menjaga referensi ke widget tree | Mutable tree yang mengatur mounting/unmounting |
| **Hot Reload** | Fitur Flutter untuk update UI secara real-time | Tekan 'r' di terminal atau Ctrl+\ di IDE |
| **Immutable** | Tidak dapat diubah setelah dibuat | Semua widget bersifat immutable |
| **initState()** | Method lifecycle untuk inisialisasi state | Setup awal listeners, controllers |
| **Mutable** | Dapat diubah setelah dibuat | State variables dalam StatefulWidget |
| **Render Tree** | Pohon yang bertanggung jawab untuk layout, painting, hit testing | Mengkonversi widget menjadi pixels |
| **setState()** | Method untuk memberitahu Flutter bahwa state berubah | `setState(() { counter++; });` |
| **State** | Data yang dapat berubah dan mempengaruhi UI | Variables dalam State class |
| **StatefulWidget** | Widget yang memiliki mutable state | Counter, form, animated widgets |
| **StatelessWidget** | Widget yang tidak memiliki mutable state | Text, Icon, layout widgets |
| **TickerProviderStateMixin** | Mixin untuk multiple AnimationController | Provides Ticker untuk animation |
| **Widget Tree** | Hierarki blueprint widgets yang immutable | Struktur UI yang dideklarasikan developer |

---

## 📖 Referensi

### 📚 Dokumentasi Resmi
1. **Flutter Widget Framework**. (2024). *Flutter.dev*. https://docs.flutter.dev/development/ui/widgets-intro
2. **StatefulWidget Class**. (2024). *Flutter API Documentation*. https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html  
3. **StatelessWidget Class**. (2024). *Flutter API Documentation*. https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
4. **setState Method**. (2024). *Flutter API Documentation*. https://api.flutter.dev/flutter/widgets/State/setState.html
5. **Animation and Motion Widgets**. (2024). *Flutter.dev*. https://docs.flutter.dev/development/ui/widgets/animation

### 🎥 Video Resources
6. **Flutter Widget of the Week - StatefulWidget**. (2024). *Flutter YouTube Channel*. https://www.youtube.com/c/flutterdev
7. **How Stateful Widgets Are Useful - Flutter in Focus**. (2024). *Flutter YouTube Channel*.
8. **Flutter Animations Tutorial**. (2024). *Flutter YouTube Channel*.

### 📖 Books
9. Windmill, E., & Biggs, S. (2021). *Flutter in Action: Building Cross-platform Mobile Applications*. Manning Publications.
10. Zaccagnino, R. (2021). *Beginning Flutter: A Hands-On Guide to App Development*. Wrox Press.
11. Wu, F. (2022). *Flutter Recipes: Mobile Development Solutions for iOS and Android*. Apress.

### 🌐 Community Resources
12. **Flutter Community Medium**. (2024). https://medium.com/flutter-community
13. **r/FlutterDev Reddit**. (2024). https://reddit.com/r/FlutterDev
14. **Flutter Awesome**. (2024). https://flutterawesome.com

### 📊 Academic Papers
15. Bai, H., Zhu, P., & Wang, X. (2021). "Performance Analysis of Cross-Platform Mobile Development Frameworks". *IEEE Transactions on Mobile Computing*, 20(4), 1459-1472.
16. Smith, J., & Johnson, M. (2022). "State Management Patterns in Modern Mobile Applications". *Journal of Software Engineering*, 15(3), 78-95.
17. Chen, L., & Rodriguez, A. (2023). "Animation Performance in Cross-Platform Mobile Development". *International Conference on Mobile Computing*, 45(2), 234-248.

---

## 🎯 Persiapan Minggu Depan

**Preview Minggu 6: Widget UI Fondasional**

🔮 **Yang Akan Datang:**
- 🎨 **MaterialApp & Scaffold**: Struktur aplikasi Flutter
- 📝 **Text, Image, Icon**: Widget konten dasar  
- 📦 **Container**: Styling, padding, margin
- 🎯 **Buttons**: ElevatedButton, TextButton, IconButton

**📚 Persiapan yang Disarankan:**
- Review semua konsep StatefulWidget dan setState()
- Practice dengan berbagai kombinasi widget
- Pahami lifecycle methods dengan baik
- Eksperimen dengan state management patterns

**🎪 Preview Code untuk Minggu Depan:**
```dart
// Sneak peek: MaterialApp structure
MaterialApp(
  home: Scaffold(
    appBar: AppBar(title: Text('My App')),
    body: Container(
      child: Column(
        children: [
          Text('Hello Flutter!'),
          Image.asset('assets/logo.png'),
          ElevatedButton(
            onPressed: () => print('Pressed!'),
            child: Text('Click Me'),
          ),
        ],
      ),
    ),
  ),
);
🎯 Skills yang Akan Dikembangkan:

Material Design implementation
Widget composition untuk UI yang complex
Asset management (images, fonts, icons)
Styling dan theming aplikasi Flutter
Best practices untuk UI development


🎉 Selamat! Anda telah menguasai arsitektur widget Flutter dan state management dasar. Minggu depan kita akan mulai membangun UI yang lebih menarik dengan widget-widget fondamental!
🚀 Keep Coding! Semakin banyak Anda practice dengan StatefulWidget dan setState(), semakin mahir Anda dalam mengelola state aplikasi Flutter!
💡 Pro Tips untuk Week 6:

Start thinking about UI as composition of widgets
Practice combining different widget types
Focus on user experience and interaction design
Explore Material Design principles
