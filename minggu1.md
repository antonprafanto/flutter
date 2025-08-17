# 📚 Materi Pembelajaran Minggu 1
## 🌍 Pengenalan Ekosistem Aplikasi Bergerak dan Dasar-Dasar Dart

![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Mobile Dev](https://img.shields.io/badge/Mobile-Development-orange?style=for-the-badge)
![Beginner](https://img.shields.io/badge/Level-Beginner-green?style=for-the-badge)

---

## 🎯 Tujuan Pembelajaran

Setelah mempelajari materi ini, Anda akan mampu:

1. **🔍 Mengartikulasikan** perbedaan, kelebihan, dan kekurangan dari pengembangan aplikasi bergerak *native*, *hybrid*, dan *cross-platform*
2. **💡 Menjelaskan** proposisi nilai Flutter dalam ekosistem aplikasi bergerak
3. **⚙️ Menyiapkan** lingkungan pengembangan Dart yang fungsional dan menulis program baris perintah dasar
4. **📝 Mendeklarasikan** variabel menggunakan inferensi tipe dan tipe eksplisit, serta memahami *sound null safety* pada Dart

---

## 📋 Daftar Isi

1. [🌍 Ekosistem Pengembangan Aplikasi Mobile](#-ekosistem-pengembangan-aplikasi-mobile)
2. [🚀 Mengapa Flutter dan Dart?](#-mengapa-flutter-dan-dart)
3. [⚙️ Setup Environment Dart](#️-setup-environment-dart)
4. [📝 Dasar-Dasar Bahasa Dart](#-dasar-dasar-bahasa-dart)
5. [🔒 Sound Null Safety](#-sound-null-safety)
6. [🧪 Praktikum 1](#-praktikum-1)

---

## 🌍 Ekosistem Pengembangan Aplikasi Mobile

### 📱 Lanskap Pengembangan Aplikasi Bergerak

Dalam dunia teknologi modern, aplikasi mobile telah menjadi bagian integral dari kehidupan sehari-hari. Bayangkan aplikasi mobile seperti jembatan yang menghubungkan pengguna dengan layanan digital yang mereka butuhkan. Untuk membangun jembatan yang kokoh dan efisien, kita perlu memahami berbagai pendekatan arsitektur yang tersedia.

Setiap pendekatan memiliki karakteristik unik, seperti memilih bahan bangunan yang berbeda untuk konstruksi jembatan. Ada yang memprioritaskan kekuatan maksimal, ada yang fokus pada efisiensi biaya, dan ada yang mencari keseimbangan optimal antara keduanya.

### 🏗️ Tiga Pendekatan Utama Pengembangan Mobile

#### 1. 🎯 **Native Development**
Native development dapat diibaratkan seperti membangun rumah dengan arsitek dan tukang lokal yang sangat memahami kondisi tanah, iklim, dan regulasi setempat. Aplikasi native dibuat khusus untuk satu platform menggunakan bahasa dan tools resmi platform tersebut, sehingga dapat memanfaatkan seluruh potensi platform dengan optimal.

**Karakteristik Native Development:**
- **iOS**: Menggunakan Swift atau Objective-C dengan IDE Xcode
- **Android**: Menggunakan Kotlin atau Java dengan Android Studio
- **Performance**: Memberikan performa terbaik karena akses langsung ke API sistem operasi
- **UI/UX**: Mengikuti design guidelines platform sehingga terasa natural bagi pengguna
- **Development Cost**: Membutuhkan biaya tinggi karena perlu tim terpisah untuk setiap platform

#### 2. 🌐 **Hybrid Development**
Hybrid development mirip seperti membangun rumah modular yang dapat dipindah-pindah. Aplikasi hybrid menggunakan teknologi web (HTML, CSS, JavaScript) yang dibungkus dalam container native, sehingga satu kode dapat berjalan di berbagai platform dengan sedikit modifikasi.

**Karakteristik Hybrid Development:**
- **Technology**: Apache Cordova/PhoneGap, Ionic, atau framework serupa
- **Performance**: Lebih lambat dari native karena ada lapisan tambahan (web container)
- **UI/UX**: Terbatas oleh kemampuan web technology, tidak selalu terasa natural
- **Development Cost**: Paling ekonomis karena menggunakan satu codebase untuk semua platform

#### 3. ⚡ **Cross-Platform Development**
Cross-platform development seperti membangun rumah dengan teknologi modern yang dapat diadaptasi untuk berbagai kondisi lingkungan. Pendekatan ini menggunakan satu codebase yang dikompilasi menjadi kode native untuk setiap platform, memberikan keseimbangan optimal antara performa dan efisiensi pengembangan.

**Karakteristik Cross-Platform Development:**
- **Technology**: Flutter dengan Dart, React Native dengan JavaScript
- **Performance**: Mendekati native karena dikompilasi menjadi kode mesin
- **UI/UX**: Kualitas tinggi dengan custom rendering engine yang konsisten
- **Development Cost**: Seimbang antara biaya dan kualitas

### 📊 Perbandingan Mendalam

Untuk membantu Anda memahami perbedaan ketiga pendekatan ini, mari kita lihat perbandingan detail berdasarkan berbagai aspek penting:

| Aspek Evaluasi | Native | Hybrid | Cross-Platform |
|----------------|--------|--------|----------------|
| **⚡ Performance** | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |
| **💰 Development Cost** | ⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **🎨 UI/UX Quality** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **🔧 Maintenance** | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **📱 Platform Features** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **👥 Developer Pool** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **⏰ Time to Market** | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

Pemahaman tentang trade-off ini sangat penting karena akan mempengaruhi keputusan arsitektur yang Anda buat sebagai developer. Setiap pendekatan memiliki konteks penggunaan yang optimal, dan Flutter sebagai cross-platform solution memberikan sweet spot yang menarik untuk banyak use case.

---

## 🚀 Mengapa Flutter dan Dart?

### 🎯 Flutter: Solusi Cross-Platform Modern

Flutter dapat diibaratkan seperti mesin cetak revolusioner yang dapat menghasilkan output berkualitas tinggi untuk berbagai media dengan satu master template. Flutter adalah UI toolkit dari Google yang memungkinkan pengembangan aplikasi cross-platform dengan performance tinggi dan UI yang konsisten.

**Keunggulan Utama Flutter:**

#### 🔥 **Hot Reload: Produktivitas Developer Maksimal**

Hot Reload adalah fitur yang mengubah cara developer bekerja secara fundamental. Bayangkan Anda sedang melukis dan setiap kali mengubah warna atau bentuk, lukisan langsung terupdate tanpa perlu memulai dari awal.

```dart
// Contoh sederhana Hot Reload
Text('Hello World!')
// Save file → Perubahan langsung terlihat di emulator dalam hitungan detik!
```

📋 **Proses Hot Reload Secara Detail:**
```
🎯 Developer menyimpan file .dart yang telah dimodifikasi
  ↓
1️⃣ Flutter file watcher mendeteksi perubahan file
  ↓
2️⃣ Dart analyzer memvalidasi syntax dan semantik perubahan
  ↓
3️⃣ Incremental compiler mengkompilasi hanya bagian yang berubah
  ↓
4️⃣ Dart VM menerima update bytecode melalui hot reload channel
  ↓
5️⃣ Widget tree direkontruksi dengan state yang dipertahankan
  ↓
6️⃣ Rendering engine menggambar ulang UI yang berubah
  ↓
✅ UI terupdate dalam waktu kurang dari 1 detik tanpa kehilangan state
```

🚀 **Coba Sekarang!** 
Nanti saat praktikum, Anda akan merasakan keajaiban Hot Reload di: https://zapp.run/

#### ⚡ **Single Codebase, Multiple Platforms**

Konsep "write once, run anywhere" dalam Flutter bukan sekadar slogan marketing, tetapi realitas teknis yang solid. Seperti menulis resep masakan yang dapat dieksekusi di berbagai jenis kompor dengan hasil yang konsisten.

```dart
// Code yang sama ini dapat berjalan di:
// ✅ Android (ARM, x86)
// ✅ iOS (ARM64)  
// ✅ Web (JavaScript transpilation)
// ✅ Desktop Windows (Win32 API)
// ✅ Desktop macOS (Cocoa API)
// ✅ Desktop Linux (GTK)
```

#### 🎨 **Custom Rendering Engine: Kontrol Penuh atas UI**

Flutter menggunakan pendekatan yang unik dalam dunia cross-platform development. Alih-alih bergantung pada native widgets yang berbeda-beda di setiap platform, Flutter menggambar sendiri setiap pixel di layar menggunakan Skia Graphics Engine. Ini seperti seorang pelukis yang membawa cat dan kuas sendiri, sehingga dapat menghasilkan karya yang identik di mana pun dia melukis.

```
📊 **Proses Rendering Flutter:**
Dart Code → Flutter Framework → Skia Graphics Engine → Platform Canvas → Screen Pixels
```

### 💎 Mengapa Dart: Bahasa yang Dirancang untuk UI

Dart bukan sekadar bahasa pemrograman biasa yang diadaptasi untuk mobile development. Dart dirancang khusus oleh Google dengan mempertimbangkan kebutuhan modern UI development, seperti arsitek yang merancang blueprint khusus untuk jenis bangunan tertentu.

**Keunggulan Fundamental Dart:**

#### 🔄 **Dual Compilation: JIT & AOT**

Dart memiliki kemampuan unik untuk dikompilasi dengan dua mode berbeda sesuai konteks penggunaan. Ini seperti memiliki mobil yang dapat berubah antara mode eco untuk efisiensi dan mode sport untuk performa.

```dart
// Development mode: JIT compilation untuk Hot Reload
// Production mode: AOT compilation untuk performa optimal
```

📋 **Alur Kompilasi Dual Mode:**
```
🎯 MODE DEVELOPMENT (JIT - Just-In-Time):
  ↓
1️⃣ Source code Dart tetap dalam format teks
  ↓
2️⃣ Dart VM menginterpretasi dan mengkompilasi on-demand
  ↓
3️⃣ Memungkinkan Hot Reload karena code dapat dimodifikasi runtime
  ↓
✅ Developer productivity maksimal dengan instant feedback

🎯 MODE PRODUCTION (AOT - Ahead-Of-Time):
  ↓
1️⃣ Source code Dart dikompilasi sepenuhnya ke native machine code
  ↓
2️⃣ Tidak ada overhead interpreter atau JIT compiler
  ↓
3️⃣ Binary size lebih kecil dan startup time lebih cepat
  ↓
✅ End-user experience optimal dengan performa native
```

#### 🛡️ **Sound Null Safety: Eliminasi Bug Runtime**

Sound Null Safety dalam Dart seperti sistem keamanan gedung yang mencegah orang masuk ke area berbahaya. Sistem ini memastikan program tidak akan crash karena null reference error, yang merupakan penyebab utama crash aplikasi.

```dart
// Dart mencegah null reference errors pada compile time
String? name;   // Dapat berisi null (nullable)
String title;   // Tidak dapat berisi null (non-nullable)

// Compiler akan menolak code yang berpotensi menyebabkan null reference error
```

#### 📱 **UI-Focused Language Features**

Dart memiliki fitur-fitur bahasa yang dirancang khusus untuk membuat code UI lebih ekspresif dan mudah dibaca. Seperti bahasa yang memiliki vocabulary khusus untuk mendeskripsikan seni dengan lebih presisi.

```dart
// Cascade operator untuk styling yang intuitif
Container()
  ..width = 100      // Set width
  ..height = 100     // Set height  
  ..color = Colors.blue;  // Set color
// Semua operasi dilakukan pada object yang sama
```

---

## ⚙️ Setup Environment Dart

### 📦 Instalasi Dart SDK: Fondasi Development

Menginstal Dart SDK adalah langkah pertama untuk memulai journey pengembangan Flutter. Proses ini dapat diibaratkan seperti menyiapkan workshop dengan semua tools yang diperlukan sebelum mulai membuat kerajinan.

#### 🖥️ **Windows: Langkah demi Langkah**

**Metode 1: Menggunakan Chocolatey (Recommended)**
```bash
# Instalasi via Chocolatey package manager
choco install dart-sdk
```

**Metode 2: Manual Download**
```bash
# Download dari official website
# https://dart.dev/get-dart
# Extract ke C:\tools\dart-sdk\
```

**Konfigurasi Environment PATH**
```bash
# Tambahkan ke System PATH environment variable:
C:\tools\dart-sdk\bin
```

**Verifikasi Instalasi**
```bash
dart --version
```

📋 **Proses Verifikasi Instalasi Secara Detail:**
```
🎯 Pengguna membuka Command Prompt dan mengetik: dart --version
  ↓
1️⃣ Windows shell mencari executable 'dart' di PATH directories
  ↓
2️⃣ Shell menemukan dart.exe di C:\tools\dart-sdk\bin\
  ↓
3️⃣ Shell menjalankan dart.exe dengan parameter --version
  ↓
4️⃣ Dart SDK membaca internal version metadata
  ↓
5️⃣ Dart SDK menampilkan informasi versi ke console output
  ↓
✅ Konfirmasi: "Dart SDK version X.X.X" menunjukkan instalasi berhasil
```

#### 🍎 **macOS: Menggunakan Homebrew**

Homebrew adalah package manager standar untuk macOS yang memudahkan instalasi dan management software development tools.

```bash
# Tambahkan Dart repository ke Homebrew
brew tap dart-lang/dart

# Install Dart SDK
brew install dart

# Verifikasi instalasi
dart --version
```

#### 🐧 **Linux: Package Manager Distribution**

```bash
# Untuk Ubuntu/Debian systems
sudo apt update
sudo apt install dart

# Untuk Fedora/Red Hat systems  
sudo dnf install dart

# Verifikasi instalasi
dart --version
```

### 💻 **Setup IDE: Environment Development yang Nyaman**

Memilih IDE yang tepat seperti memilih meja kerja yang ergonomis. IDE yang baik akan meningkatkan produktivitas dan mengurangi fatigue development.

#### 🟦 **VS Code: Pilihan Ideal untuk Pemula**

Visual Studio Code menawarkan keseimbangan optimal antara simplicity dan functionality untuk Dart development.

**Langkah Setup VS Code:**

1. **Download dan Install VS Code**
   - Kunjungi: https://code.visualstudio.com/
   - Download installer sesuai operating system
   - Install dengan setting default

2. **Install Dart Extension**

📋 **Proses Instalasi Extension:**
```
🎯 Pengguna membuka VS Code dan mengakses Extensions panel
  ↓
1️⃣ Klik icon Extensions di sidebar (atau Ctrl+Shift+X)
  ↓
2️⃣ Ketik "Dart" di search box
  ↓
3️⃣ Temukan extension "Dart" by Dart Code team
  ↓
4️⃣ Klik tombol "Install"
  ↓
5️⃣ VS Code mendownload dan menginstal extension
  ↓
6️⃣ Restart VS Code untuk aktivasi penuh
  ↓
✅ Dart language support siap digunakan dengan syntax highlighting, debugging, dan autocomplete
```

#### 🟨 **DartPad: Online IDE untuk Eksperimen**

DartPad adalah browser-based IDE yang perfect untuk learning dan quick prototyping tanpa perlu setup lokal.

- **URL**: https://dartpad.dev/
- **Kegunaan**: Testing code snippets, learning Dart syntax, sharing code examples
- **Keunggulan**: Tidak perlu instalasi, langsung dapat digunakan, built-in examples

---

## 📝 Dasar-Dasar Bahasa Dart

### 🚀 Program Dart Pertama: Hello World

Setiap journey programming dimulai dengan "Hello World". Program sederhana ini memperkenalkan struktur dasar Dart dan cara kerja execution flow.

💻 **Hello World Program:**
```dart
void main() {
  print('Hello, World!');
}
```

📋 **Analisis Eksekusi Program Hello World:**
```
🎯 Dart runtime memulai eksekusi program
  ↓
1️⃣ Runtime melakukan bootstrap dan inisialisasi Dart VM
  ↓
2️⃣ VM mencari entry point function bernama 'main' di global scope
  ↓
3️⃣ VM menemukan function main() dan memvalidasi signature-nya
  ↓
4️⃣ VM membuat execution context dan call stack frame untuk main()
  ↓
5️⃣ VM mulai mengeksekusi body function main() baris demi baris
  ↓
6️⃣ VM encounter statement print('Hello, World!')
  ↓
7️⃣ VM resolve function print dari dart:core library
  ↓
8️⃣ VM evaluate argument: string literal 'Hello, World!'
  ↓
9️⃣ VM memanggil print function dengan argument tersebut
  ↓
🔟 Print function menulis output ke stdout stream
  ↓
✅ Program selesai eksekusi dan VM melakukan cleanup
```

🚀 **Coba Sekarang!** 
Copy code di atas dan jalankan di: https://zapp.run/

### 📦 **Comments: Dokumentasi Code yang Efektif**

Comments adalah cara berkomunikasi dengan developer lain (atau diri sendiri di masa depan). Comments yang baik menjelaskan "mengapa" bukan "apa" yang dilakukan code.

💻 **Berbagai Jenis Comments dalam Dart:**
```dart
// Single line comment - untuk penjelasan singkat
// Biasanya digunakan untuk komentar satu baris

/* 
Multi-line comment - untuk penjelasan panjang
Dapat mencakup beberapa baris
Berguna untuk menjelaskan algoritma kompleks
*/

/// Documentation comment - untuk API documentation
/// Digunakan oleh tools seperti dartdoc untuk generate dokumentasi
/// Mendukung markdown formatting
void myFunction() {
  // Implementation comment - menjelaskan detail implementasi
  // Code implementation here
}
```

📋 **Proses Pengolahan Comments oleh Compiler:**
```
🎯 Dart compiler membaca source file karakter demi karakter
  ↓
1️⃣ Lexer mengidentifikasi comment markers (//, /*, ///)
  ↓
2️⃣ Lexer menandai seluruh content comment sebagai NON-CODE
  ↓
3️⃣ Parser melewati (skip) semua token yang ditandai sebagai comment
  ↓
4️⃣ AST (Abstract Syntax Tree) dibangun tanpa menyertakan comments
  ↓
5️⃣ Code generation dilakukan hanya pada non-comment tokens
  ↓
✅ Comments diabaikan sepenuhnya dalam binary final, tidak mempengaruhi performa
```

### 🏷️ **Variables dan Tipe Data: Pondasi Data Management**

Variables adalah container untuk menyimpan data dalam program. Pemahaman yang solid tentang variable declaration dan type system sangat crucial untuk menjadi Dart developer yang efektif.

#### **Type Inference dengan `var`**

Type inference adalah kemampuan Dart untuk secara otomatis menentukan tipe data berdasarkan nilai yang di-assign. Ini seperti memiliki asisten cerdas yang dapat mengenali jenis dokumen hanya dengan melihat isinya.

💻 **Contoh Type Inference:**
```dart
void main() {
  var name = 'John';        // Dart inferensi: String
  var age = 25;             // Dart inferensi: int  
  var height = 175.5;       // Dart inferensi: double
  var isStudent = true;     // Dart inferensi: bool
  
  print('Nama: $name');
  print('Umur: $age');
  print('Tinggi: $height');
  print('Mahasiswa: $isStudent');
}
```

📋 **Proses Type Inference Secara Mendalam:**
```
🎯 Dart analyzer memproses deklarasi: var name = 'John';
  ↓
1️⃣ Parser mengidentifikasi pattern: var_declaration
  ↓
2️⃣ Analyzer melihat keyword 'var' → trigger type inference mechanism
  ↓
3️⃣ Analyzer evaluate right-hand side expression: 'John'
  ↓
4️⃣ Expression analyzer mendeteksi string literal dengan single quotes
  ↓
5️⃣ Type inference engine menentukan: hasil evaluasi adalah String
  ↓
6️⃣ Analyzer assign tipe String ke variable 'name'
  ↓
7️⃣ Symbol table diupdate: name → String (immutable type binding)
  ↓
✅ Variable 'name' siap digunakan dengan tipe String yang tidak dapat diubah
```

🚀 **Coba Sekarang!** 
Copy code di atas dan amati output di: https://zapp.run/

#### **Explicit Type Declaration**

Explicit type declaration memberikan clarity dan self-documentation pada code. Seperti memberikan label yang jelas pada setiap container penyimpanan.

💻 **Explicit Type Declaration:**
```dart
void main() {
  String firstName = 'Alice';    // Tipe dideklarasikan eksplisit
  int score = 95;                // Lebih readable dan self-documenting
  double temperature = 36.5;     // Mencegah assignment yang tidak diinginkan
  bool isPassed = true;          // Clear intent dari developer
  
  print('Student: $firstName');
  print('Score: $score');
  print('Temperature: $temperature°C'); 
  print('Passed: $isPassed');
}
```

📋 **Perbandingan Type Inference vs Explicit Declaration:**
```
📊 ANALISIS PERBANDINGAN:

var name = 'John';                    ←→    String name = 'John';
       ↓                                           ↓
• Compiler menentukan tipe            • Developer menentukan tipe
• Lebih concise code                  • Lebih explicit intention
• Tipe final sama: String             • Tipe final sama: String
• Good untuk local variables          • Good untuk parameters, fields
• Risk: intention tidak jelas         • Risk: verbose untuk obvious types
       ↓                                           ↓
Hasil akhir identik: keduanya menciptakan String variable dengan type safety penuh
```

#### 🔒 **Constants: `final` vs `const`**

Understanding perbedaan antara `final` dan `const` crucial untuk memory management dan performance optimization. Keduanya mencegah reassignment, tetapi berbeda dalam timing evaluation.

💻 **Final - Runtime Constant:**
```dart
void main() {
  final currentTime = DateTime.now();  // Nilai ditentukan saat runtime
  final userName = 'Alice';            // Tidak dapat diubah setelah assignment
  
  print('Current time: $currentTime');
  print('User: $userName');
  
  // userName = 'Bob';  // ❌ Compile error! final variable tidak dapat diubah
}
```

💻 **Const - Compile Time Constant:**
```dart
void main() {
  const pi = 3.14159;           // Nilai harus diketahui pada compile time
  const appName = 'MyApp';      // Compile-time constant untuk optimasi
  
  print('Pi: $pi');
  print('App: $appName');
  
  // const currentTime = DateTime.now();  // ❌ Error! 
  // DateTime.now() hanya dapat dievaluasi saat runtime
}
```

📋 **Analisis Perbedaan Final vs Const:**
```
🎯 UNTUK FINAL:
  ↓
Compile Time:
• Compiler memvalidasi syntax: final currentTime = DateTime.now() ✅
• Compiler melihat DateTime.now() adalah valid expression ✅
• Compiler menandai: nilai akan dievaluasi saat runtime
• Bytecode: CALL DateTime.now(), STORE_FINAL currentTime
  ↓
Runtime:
• VM execute: DateTime.now() → evaluasi actual system time
• VM store hasil: 2024-01-15 10:30:45.123
• VM lock variable: currentTime tidak dapat diassign ulang
  ↓
✅ currentTime berisi waktu aktual ketika program dijalankan

🎯 UNTUK CONST:
  ↓  
Compile Time:
• Compiler memvalidasi syntax: const pi = 3.14159 ✅
• Compiler evaluate: 3.14159 adalah compile-time constant ✅
• Compiler embed nilai langsung ke bytecode: LOAD_CONST 3.14159
• No runtime evaluation needed
  ↓
Runtime:
• VM langsung load nilai dari bytecode tanpa kalkulasi
• Performance optimal: tidak ada function call overhead
• Memory optimal: shared constant pool
  ↓
✅ pi berisi 3.14159 yang sudah ditetapkan sejak compile time
```

#### 📊 **Built-in Data Types: Fondasi Type System**

Dart memiliki type system yang rich dan expressive untuk modeling berbagai jenis data yang diperlukan dalam application development.

💻 **Numbers: Handling Numeric Data**
```dart
void main() {
  // Integer - bilangan bulat
  int quantity = 42;        // Positive integer
  int negative = -10;       // Negative integer
  
  // Double - bilangan floating point  
  double price = 19.99;     // Decimal number
  double pi = 3.14159;      // Mathematical constant
  
  // num - parent type yang dapat hold int atau double
  num score = 85;           // Dapat diassign int
  num average = 87.5;       // Atau double
  
  print('Quantity: $quantity');
  print('Price: \$${price}');  // Escape $ character untuk literal
  print('Score: $score');
}
```

📋 **Hierarki Tipe Number dalam Dart:**
```
📊 DART NUMBER TYPE HIERARCHY:
                    num (abstract)
                   ↙         ↘
                 int        double
              (64-bit)    (64-bit IEEE 754)
                 ↓             ↓
         whole numbers    decimal numbers
         (-2^63 to 2^63-1)  (±1.7e±308)
                 ↓             ↓
           42, -5, 0      3.14, -2.5, 0.0
```

🚀 **Coba Sekarang!** 
Eksperimen dengan berbagai numeric operations di: https://zapp.run/

💻 **Strings: Text Processing Powerhouse**
```dart
void main() {
  // Different ways to declare strings
  String message = 'Hello World';     // Single quotes
  String name = "Alice";              // Double quotes (equivalent)
  
  // String interpolation - embedding expressions in strings
  String greeting = 'Hello, $name!';                    // Simple variable interpolation
  String calculation = 'The result is ${2 + 3}';        // Expression interpolation
  
  // Multi-line strings for large text blocks
  String longText = '''
  Ini adalah text
  yang panjang dan
  menggunakan beberapa baris
  ''';
  
  print(greeting);
  print(calculation);
  print(longText);
}
```

📋 **Proses String Interpolation Secara Detail:**
```
🎯 Dart compiler memproses string literal: 'Hello, $name!'
  ↓
1️⃣ String parser memulai character-by-character scanning
  ↓
2️⃣ Parser membaca karakter normal: 'H', 'e', 'l', 'l', 'o', ',', ' '
  ↓
3️⃣ Parser menemukan special character '$' pada posisi ke-7
  ↓
4️⃣ Parser switch ke interpolation mode dan scan identifier setelah $
  ↓
5️⃣ Parser membaca 'name' sebagai complete identifier
  ↓
6️⃣ Resolver melakukan symbol lookup: cari variable 'name' di scope
  ↓
7️⃣ Resolver menemukan variable 'name' dengan tipe String dan value 'Alice'
  ↓
8️⃣ Parser melanjutkan scan: '!' sebagai karakter normal
  ↓
9️⃣ Code generator membuat concatenation expression: 'Hello, ' + name + '!'
  ↓
🔟 Runtime evaluation: 'Hello, ' + 'Alice' + '!' = 'Hello, Alice!'
  ↓
✅ Final string 'Hello, Alice!' disimpan ke variable greeting
```

💻 **Booleans: Logic and Decision Making**
```dart
void main() {
  bool isOnline = true;          // Explicit boolean literal
  bool isCompleted = false;      // Binary state representation
  
  // Boolean expressions from comparisons
  bool isAdult = 20 >= 18;         // Evaluates to true
  bool isEmpty = 'hello'.isEmpty;   // Method call returning boolean
  
  print('Online: $isOnline');
  print('Adult: $isAdult');
  print('Empty: $isEmpty');
}
```

### 🔧 **String Operations: Text Manipulation Mastery**

String operations adalah skill fundamental untuk text processing dalam aplikasi. Dart menyediakan rich set of methods untuk string manipulation.

💻 **Common String Methods:**
```dart
void main() {
  String text = 'Flutter Development';
  
  // Basic string properties dan methods
  print('Original: $text');
  print('Length: ${text.length}');                    // Property access
  print('Uppercase: ${text.toUpperCase()}');          // Method transformation
  print('Lowercase: ${text.toLowerCase()}');          // Case conversion
  print('Contains Flutter: ${text.contains('Flutter')}');  // Search operation
  print('Starts with F: ${text.startsWith('F')}');    // Pattern matching
  print('Substring: ${text.substring(0, 7)}');        // Text extraction
}
```

📋 **Method Chaining dan Execution Order:**
```
🎯 Menganalisis expression: text.toUpperCase().substring(0, 7)
  ↓
1️⃣ Variable resolution: text = 'Flutter Development'
  ↓
2️⃣ Method call: text.toUpperCase()
   • Create new String object: 'FLUTTER DEVELOPMENT'
   • Return reference ke new String
  ↓
3️⃣ Method call pada result: .substring(0, 7)
   • Extract characters dari index 0 sampai 6 (7 exclusive)
   • Create new String object: 'FLUTTER'
   • Return reference ke final String
  ↓
4️⃣ Expression evaluation complete
  ↓
✅ Final result: 'FLUTTER' (original string tidak berubah karena immutable)
```

🚀 **Coba Sekarang!** 
Explore berbagai string operations di: https://zapp.run/

---

## 🔒 Sound Null Safety

### 🛡️ **Understanding Null Safety: Modern Error Prevention**

Sound Null Safety adalah salah satu fitur terpenting dalam modern Dart. Fitur ini dapat diibaratkan seperti sistem keamanan gedung yang mencegah orang memasuki area berbahaya sebelum incident terjadi, bukan setelahnya.

Null reference errors (juga dikenal sebagai "billion dollar mistake") adalah penyebab utama crash aplikasi di banyak bahasa pemrograman. Dart mengatasi masalah ini dengan elegant solution yang memaksa developer menangani kemungkinan null values pada compile time.

💻 **Nullable vs Non-nullable Types:**
```dart
void main() {
  // Non-nullable types (default behavior)
  String name = 'Alice';              // Harus memiliki nilai non-null
  int age = 25;                       // Tidak dapat di-assign null
  
  // Nullable types (dengan ? suffix)
  String? nickname;                   // Dapat berisi null atau String
  int? score;                         // Dapat berisi null atau int
  
  print('Name: $name');               // ✅ Safe - guaranteed non-null
  print('Nickname: $nickname');       // ✅ Safe - null ditampilkan sebagai 'null'
  
  // name = null;                     // ❌ Compile error! Non-nullable
  nickname = null;                    // ✅ OK - explicitly nullable
}
```

📋 **Static Analysis untuk Null Safety:**
```
🎯 Dart static analyzer memproses variable declarations
  ↓
1️⃣ Encounter declaration: String name;
   • Parse type: String tanpa ? modifier
   • Mark variable sebagai NON-NULLABLE
   • Add constraint: name tidak boleh null
   • Update symbol table: name → String (non-null)
  ↓
2️⃣ Encounter declaration: String? nickname;
   • Parse type: String dengan ? modifier  
   • Mark variable sebagai NULLABLE
   • Allow constraint: nickname boleh null atau String
   • Update symbol table: nickname → String? (nullable)
  ↓
3️⃣ Subsequent assignment analysis:
   • name = null → Check: null dapat diassign ke String? NO ❌
   • nickname = null → Check: null dapat diassign ke String?? YES ✅
   • nickname = 'Bob' → Check: String dapat diassign ke String? YES ✅
  ↓
✅ Compile-time safety guarantees established
```

### ⚡ **Null-aware Operators: Safe Navigation**

Null-aware operators menyediakan syntax yang elegant untuk bekerja dengan nullable values tanpa explicit null checking yang verbose.

💻 **Null Check Operator (!):**
```dart
void main() {
  String? nullableName;
  
  // Assign non-null value
  nullableName = 'Bob';
  
  // Null assertion operator - "I guarantee this is not null"
  String definitelyName = nullableName!;
  
  print('Name: $definitelyName');
  
  // ⚠️ WARNING: Jika nullableName actually null, runtime exception!
}
```

💻 **Null-aware Access Operator (?.):**
```dart
void main() {
  String? nullableText;
  
  // Safe method call - returns null if object is null
  int? length = nullableText?.length;
  
  print('Length: $length');  // Output: Length: null
  
  nullableText = 'Hello';
  length = nullableText?.length;
  print('Length: $length');  // Output: Length: 5
}
```

📋 **Null-aware Operator Evaluation:**
```
🎯 Runtime memproses expression: nullableText?.length
  ↓
1️⃣ Load variable nullableText dari memory location
   • Memory read: address 0x1234
   • Value retrieved: null
  ↓
2️⃣ Null-aware operator (?.) conditional evaluation:
   • Check condition: nullableText == null?
   • Condition result: true
  ↓
3️⃣ Short-circuit evaluation activated:
   • SKIP method call: .length tidak dipanggil
   • SKIP potential NullPointerException
   • RETURN immediate value: null
  ↓
4️⃣ Assignment ke variable length:
   • Store value: null
   • Maintain type: int? (nullable int)
  ↓
✅ Safe operation completed: tidak ada runtime error meskipun object null
```

💻 **Null Coalescing Operator (??):**
```dart
void main() {
  String? username;
  
  // Provide default value if left side is null
  String displayName = username ?? 'Guest';
  
  print('Welcome, $displayName!');  // Output: Welcome, Guest!
  
  username = 'Alice';
  displayName = username ?? 'Guest';
  print('Welcome, $displayName!');  // Output: Welcome, Alice!
}
```

📋 **Null Coalescing Logic Flow:**
```
🎯 Evaluasi expression: username ?? 'Guest'
  ↓
1️⃣ Evaluate left operand: username
   • Read variable value: null
  ↓
2️⃣ Null coalescing conditional logic:
   • Check: is left operand null?
   • Result: true (username is null)
  ↓
3️⃣ Select right operand:
   • SKIP left operand karena null
   • USE right operand: 'Guest'
  ↓
4️⃣ Type resolution:
   • Left type: String? (nullable)
   • Right type: String (non-nullable)  
   • Result type: String (non-nullable - guaranteed non-null)
  ↓
✅ Final value: 'Guest' dengan type String (safe untuk non-nullable assignment)
```

🚀 **Coba Sekarang!** 
Eksperimen dengan null-aware operators di: https://zapp.run/

### 🎯 **Best Practices: Writing Null-Safe Code**

Menulis null-safe code bukan hanya tentang menghindari compile errors, tetapi tentang creating robust applications yang handle edge cases dengan graceful.

💻 **Practical Null Safety Example:**
```dart
void main() {
  // ✅ Best Practice: Initialize non-nullable variables immediately
  String appTitle = 'My Flutter App';
  int version = 1;
  
  // ✅ Best Practice: Use nullable types ketika value mungkin tidak exist
  String? userEmail;    // User mungkin belum login
  int? lastScore;       // Game mungkin belum pernah dimainkan
  
  // ✅ Best Practice: Explicit null checking untuk complex logic
  if (userEmail != null) {
    print('Email: $userEmail');
    print('Email length: ${userEmail.length}'); // Safe setelah null check
  }
  
  // ✅ Best Practice: Provide meaningful defaults
  String greeting = userEmail != null 
    ? 'Welcome back!' 
    : 'Welcome, new user!';
  
  print(greeting);
}
```

📋 **Manfaat Sound Null Safety dalam Development:**
```
🎯 TANPA NULL SAFETY (Traditional approach):
  ↓
Development → Testing → Runtime Error Discovery → Debug → Fix → Repeat
   ↓              ↓           ↓                    ↓       ↓
Time spent    Bug found   App crashes        Time lost  User frustrated
writing       in prod     for users          debugging  with app
  ↓
❌ Reactive approach: masalah ditemukan setelah terjadi

🎯 DENGAN SOUND NULL SAFETY (Modern approach):  
  ↓
Development → Compile Time Analysis → Error Prevention → Safe Runtime
   ↓              ↓                      ↓                ↓
Time spent    Potential issues      Bugs prevented     Users experience
writing       caught early         before deployment   stable app
  ↓
✅ Proactive approach: masalah dicegah sebelum terjadi
```

---

## 🧪 Praktikum 1: Dasar-Dasar Dart dan Pemecahan Masalah

### 🎯 **Objektif Praktikum**

Praktikum ini dirancang untuk memberikan hands-on experience dengan fundamental concepts yang telah dipelajari. Setiap tugas membangun pemahaman bertahap tentang variable management, string processing, null safety implementation, dan basic program structure.

Pendekatan praktikum ini menggunakan progressive complexity, dimana setiap tugas memperkenalkan concepts baru sambil memperkuat understanding dari tugas sebelumnya. Ini memastikan solid foundation sebelum moving ke advanced topics.

### 📝 **Tugas 1: Personal Information Manager**

Tugas ini mengintegrasikan variable declaration, type inference, string interpolation, dan null safety dalam context yang praktis dan relatable.

💻 **Code Template:**
```dart
void main() {
  // TODO: Deklarasikan dan initialize variables untuk informasi personal
  
  // 1. Variable declaration dengan different types
  String fullName = '';              // Nama lengkap Anda
  int age = 0;                       // Umur dalam tahun  
  double height = 0.0;               // Tinggi badan dalam cm
  String? nickname;                  // Nickname (optional - bisa null)
  String university = '';            // Nama universitas
  bool isStudent = true;             // Status mahasiswa aktif
  
  // 2. Initialize dengan data personal Anda
  fullName = 'John Doe';             // Ganti dengan nama Anda
  age = 20;                          // Ganti dengan umur Anda
  height = 175.5;                    // Ganti dengan tinggi Anda
  nickname = 'Johnny';               // Optional: bisa null atau string
  university = 'University of Technology';  // Ganti dengan universitas Anda
  
  // 3. Tampilkan informasi dengan formatted output
  print('================================');
  print('    PERSONAL INFORMATION CARD');
  print('================================');
  print('👤 Full Name    : $fullName');
  print('🎂 Age          : $age years old');
  print('📏 Height       : ${height} cm');
  
  // 4. Demonstrate null safety dengan conditional display
  print('🎯 Nickname     : ${nickname ?? "No nickname"}');
  
  print('🏛️  University  : $university');
  print('📚 Status       : ${isStudent ? "Active Student" : "Not a student"}');
  
  // 5. Bonus calculation: birth year estimation
  int currentYear = DateTime.now().year;
  int estimatedBirthYear = currentYear - age;
  print('🎯 Birth Year   : $estimatedBirthYear (estimated)');
  
  print('================================');
}
```

💡 **Expected Output Example:**
```
================================
    PERSONAL INFORMATION CARD
================================
👤 Full Name    : John Doe
🎂 Age          : 20 years old  
📏 Height       : 175.5 cm
🎯 Nickname     : Johnny
🏛️  University  : University of Technology
📚 Status       : Active Student
🎯 Birth Year   : 2004 (estimated)
================================
```

**Learning Objectives dari Tugas 1:**
- Practice variable declaration dengan different data types
- Understanding type inference vs explicit typing
- String interpolation dan formatting
- Null safety implementation dengan conditional operators
- DateTime API usage untuk calculations
- Conditional expressions dengan ternary operator

🚀 **Coba Sekarang!** 
Implement dan test solution Anda di: https://zapp.run/

### 📝 **Tugas 2: Mathematical Operations Calculator**

Tugas ini focuses pada numeric operations, mathematical calculations, dan error handling dengan null safety.

💻 **Challenge Program:**
```dart
void main() {
  // Initial values untuk mathematical operations
  double num1 = 15.5;
  double num2 = 4.2;
  
  // TODO: Implement basic mathematical operations
  
  // 1. Basic arithmetic operations
  double addition = num1 + num2;
  double subtraction = num1 - num2;
  double multiplication = num1 * num2;
  double division = num1 / num2;
  double remainder = num1 % num2;  // Modulo operation
  
  // 2. Display results dengan proper formatting
  print('=== CALCULATOR OPERATIONS ===');
  print('Numbers: $num1 and $num2');
  print('');
  print('➕ Addition      : $num1 + $num2 = ${addition.toStringAsFixed(2)}');
  print('➖ Subtraction   : $num1 - $num2 = ${subtraction.toStringAsFixed(2)}');
  print('✖️  Multiplication: $num1 × $num2 = ${multiplication.toStringAsFixed(2)}');
  print('➗ Division      : $num1 ÷ $num2 = ${division.toStringAsFixed(2)}');
  print('📐 Remainder     : $num1 % $num2 = ${remainder.toStringAsFixed(2)}');
  
  // 3. Handle division by zero dengan null safety
  double divisor = 0.0;
  double? safeDivision = divisor != 0 ? num1 / divisor : null;
  
  print('');
  print('=== SAFE DIVISION DEMO ===');
  print('Division by zero handling:');
  print('Result: ${safeDivision?.toStringAsFixed(2) ?? "Cannot divide by zero"}');
  
  // 4. Advanced calculations
  double power = num1 * num1;  // Simple square (Dart tidak punya ** operator)
  double average = (num1 + num2) / 2;
  
  print('');
  print('=== ADVANCED CALCULATIONS ===');
  print('Square of $num1: ${power.toStringAsFixed(2)}');
  print('Average: ${average.toStringAsFixed(2)}');
}
```

**Learning Focus:**
- Numeric operations dan precision handling
- String formatting dengan toStringAsFixed()
- Null safety dalam mathematical contexts
- Error prevention techniques

🚀 **Coba Sekarang!** 
Test mathematical operations di: https://zapp.run/

### 📝 **Tugas 3: String Processing Workshop**

Tugas ini mengeksplorasi comprehensive string manipulation techniques yang essential untuk text processing dalam aplikasi.

💻 **Text Processing Challenge:**
```dart
void main() {
  String originalText = 'flutter development is fun and exciting';
  
  print('=== STRING PROCESSING WORKSHOP ===');
  print('Original text: "$originalText"');
  print('');
  
  // TODO: Implement comprehensive string processing
  
  // 1. Convert to title case (capitalize first letter of each word)
  List<String> words = originalText.split(' ');
  String titleCase = words.map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join(' ');
  
  print('📝 Title Case: "$titleCase"');
  
  // 2. Count words dan characters
  int wordCount = words.length;
  int charCount = originalText.replaceAll(' ', '').length;  // Remove spaces untuk count
  int totalChars = originalText.length;
  
  print('📊 Statistics:');
  print('   • Total words: $wordCount');
  print('   • Characters (no spaces): $charCount');
  print('   • Total characters: $totalChars');
  
  // 3. Search operations
  bool containsFlutter = originalText.contains('flutter');
  bool startsWithFlutter = originalText.startsWith('flutter');
  bool endsWithExciting = originalText.endsWith('exciting');
  
  print('🔍 Search Results:');
  print('   • Contains "flutter": $containsFlutter');
  print('   • Starts with "flutter": $startsWithFlutter');
  print('   • Ends with "exciting": $endsWithExciting');
  
  // 4. Text transformations
  String flutterHighlighted = originalText.replaceAll('flutter', 'FLUTTER');
  String reversed = originalText.split('').reversed.join('');
  
  print('🔄 Transformations:');
  print('   • Highlighted: "$flutterHighlighted"');
  print('   • Reversed: "$reversed"');
  
  // 5. Extract first three words
  List<String> firstThreeWords = words.take(3).toList();
  String extracted = firstThreeWords.join(' ');
  
  print('✂️  Extraction:');
  print('   • First 3 words: "$extracted"');
  
  // 6. Advanced: create acronym dari first letters
  String acronym = words.map((word) => word.isNotEmpty ? word[0].toUpperCase() : '').join('');
  
  print('🔤 Acronym: "$acronym"');
}
```

📋 **Step-by-Step String Processing Guide:**
```
🎯 STRING PROCESSING PIPELINE untuk "flutter development is fun and exciting":
  ↓
1️⃣ Split by spaces:
   • Input: "flutter development is fun and exciting"
   • Output: ['flutter', 'development', 'is', 'fun', 'and', 'exciting']
  ↓
2️⃣ Process each word untuk title case:
   • 'flutter' → 'F' + 'lutter' → 'Flutter'
   • 'development' → 'D' + 'evelopment' → 'Development'
   • Continue for all words...
  ↓
3️⃣ Join back dengan spaces:
   • Input: ['Flutter', 'Development', 'Is', 'Fun', 'And', 'Exciting']
   • Output: "Flutter Development Is Fun And Exciting"
  ↓
✅ Title case transformation complete
```

🚀 **Coba Sekarang!** 
Explore string manipulation di: https://zapp.run/

### 🎯 **Tugas 4: Null Safety Advanced Scenarios**

Tugas ini memfokuskan pada real-world null safety scenarios yang sering ditemui dalam application development.

💻 **Safe Programming Exercise:**
```dart
void main() {
  print('=== NULL SAFETY ADVANCED SCENARIOS ===');
  
  // Scenario: Student data yang mungkin incomplete
  String studentName = 'Alice Johnson';
  int? studentId;                    // Belum assigned - simulate database null
  String? email;                     // Optional field
  double? gpa;                       // Belum calculated
  DateTime? lastLoginDate;           // Mungkin never login
  
  // TODO: Implement comprehensive null safety patterns
  
  // 1. Safe display dengan null-aware operators
  print('👤 Student Information:');
  print('   Name: $studentName');
  print('   ID: ${studentId ?? "Not assigned"}');
  print('   Email: ${email ?? "No email provided"}');
  print('   GPA: ${gpa?.toStringAsFixed(2) ?? "Not calculated yet"}');
  print('   Last Login: ${lastLoginDate?.toString() ?? "Never logged in"}');
  
  // 2. Conditional processing berdasarkan null status
  print('');
  print('📋 Account Status Analysis:');
  
  if (email != null && email.isNotEmpty) {
    print('✅ Email verified: $email');
    print('   Email domain: ${email.split('@').last}');
  } else {
    print('❌ Email verification needed');
  }
  
  if (gpa != null) {
    String grade = gpa >= 3.5 ? 'Excellent' : gpa >= 3.0 ? 'Good' : 'Needs Improvement';
    print('✅ Academic standing: $grade (GPA: ${gpa.toStringAsFixed(2)})');
  } else {
    print('❌ GPA calculation pending');
  }
  
  // 3. Safe chaining operations
  String emailDisplay = email?.toUpperCase().substring(0, email.indexOf('@')) ?? 'UNKNOWN';
  print('📧 Email username: $emailDisplay');
  
  // 4. Generate safe defaults untuk missing data
  studentId ??= DateTime.now().millisecondsSinceEpoch % 100000; // Generate ID if null
  email ??= '${studentName.toLowerCase().replaceAll(' ', '.')}@university.edu';
  
  print('');
  print('🔧 After applying defaults:');
  print('   Generated ID: $studentId');
  print('   Generated Email: $email');
  
  // 5. Advanced null safety: nullable collections
  List<String>? enrolledCourses;
  print('');
  print('📚 Course Information:');
  print('   Enrolled courses: ${enrolledCourses?.length ?? 0}');
  
  // Safe iteration over potentially null collection
  if (enrolledCourses?.isNotEmpty == true) {
    for (String course in enrolledCourses!) {
      print('   • $course');
    }
  } else {
    print('   No courses enrolled yet');
  }
  
  // 6. Null safety dalam function calls
  String formatStudentInfo(String name, {String? email, int? id}) {
    return 'Student: $name (ID: ${id ?? "TBD"}, Email: ${email ?? "pending"})';
  }
  
  print('');
  print('📄 Formatted Summary:');
  print(formatStudentInfo(studentName, email: email, id: studentId));
}
```

**Advanced Learning Objectives:**
- Complex null-aware operator chaining
- Conditional logic dengan nullable values
- Default value generation strategies
- Safe method calling pada nullable objects
- Nullable collections handling
- Function parameters dengan null safety

🚀 **Coba Sekarang!** 
Implement advanced null safety patterns di: https://zapp.run/

### 🚀 **Testing & Submission Guidelines**

**Platform Testing Priority:**
1. **Primary Platform**: https://zapp.run/ - Ideal untuk Flutter/Dart testing
2. **Alternative**: https://dartpad.dev/ - Official Dart online IDE
3. **Local Development**: Jika sudah setup Dart SDK locally

**Submission Requirements Checklist:**
- ✅ Semua 4 tugas implemented dan fully functional
- ✅ Code dapat berjalan tanpa compile atau runtime errors  
- ✅ Output format sesuai dengan expected examples
- ✅ Demonstrasi clear understanding null safety concepts
- ✅ Code comments yang menjelaskan complex logic
- ✅ Proper variable naming dan code organization

**Code Quality Standards:**
- ✅ Consistent indentation dan formatting
- ✅ Meaningful variable names yang descriptive
- ✅ Appropriate use of different data types
- ✅ Effective null safety implementation
- ✅ Clear separation of different functionalities

### 💡 **Success Tips untuk Praktikum**

1. **🧪 Iterative Testing**: Test setiap small change di Zapp.run untuk immediate feedback dan error detection

2. **📖 Error Message Analysis**: Dart compiler memberikan informative error messages. Read carefully dan understand apa yang compiler coba sampaikan

3. **🔍 Code Formatting**: Gunakan consistent indentation dan spacing. Well-formatted code lebih mudah dibaca dan debug

4. **💬 Documentation**: Tambahkan comments untuk explain complex logic atau design decisions

5. **🎯 Incremental Development**: Start dengan simple implementation, kemudian gradually add features dan improvements

6. **🔄 Refactoring**: Setelah working solution, consider ways untuk improve code readability dan efficiency

**Common Pitfalls to Avoid:**
- Forgetting null safety operators ketika working dengan nullable types
- Mixing up string interpolation syntax ($variable vs ${expression})
- Not handling edge cases seperti empty strings atau zero values
- Using inappropriate data types untuk specific use cases

---

## 📚 Glosarium

| **Term** | **Pengertian** | **Contoh Penggunaan** |
|----------|----------------|-----------------------|
| **AOT (Ahead-Of-Time)** | Kompilasi yang dilakukan sebelum program dijalankan, menghasilkan native machine code untuk performa optimal | Production Flutter apps dikompilasi dengan AOT untuk startup yang cepat |
| **JIT (Just-In-Time)** | Kompilasi yang dilakukan saat program berjalan, memungkinkan fitur seperti Hot Reload | Development mode Flutter menggunakan JIT untuk debugging dan Hot Reload |
| **Cross-platform** | Pendekatan development yang memungkinkan aplikasi berjalan di multiple platform dengan satu codebase | Flutter memungkinkan development untuk iOS, Android, Web, dan Desktop dari satu codebase |
| **Hot Reload** | Fitur Flutter yang memungkinkan update UI secara real-time tanpa restart aplikasi atau kehilangan state | Mengubah warna button dan melihat perubahan instant di emulator |
| **Null Safety** | Sistem type yang mencegah null reference errors pada compile time dengan membedakan nullable dan non-nullable types | `String name` (non-nullable) vs `String? nickname` (nullable) |
| **Type Inference** | Kemampuan Dart untuk menentukan tipe data secara otomatis berdasarkan nilai yang di-assign | `var name = 'John'` - Dart automatically menentukan name sebagai String |
| **String Interpolation** | Teknik embedding variable atau expression ke dalam string menggunakan syntax `$variable` atau `${expression}` | `'Hello, $name!'` atau `'Result: ${2 + 3}'` |
| **Nullable Type** | Tipe data yang dapat berisi nilai null, ditandai dengan suffix `?` | `int? score` dapat berisi integer atau null |
| **Non-nullable Type** | Tipe data yang tidak dapat berisi nilai null (default behavior di Dart) | `String title` harus selalu berisi String value, tidak boleh null |
| **Cascade Operator** | Operator `..` yang memungkinkan multiple operations pada object yang sama tanpa repeat reference | `container..width = 100..height = 100..color = blue` |
| **Dart VM** | Virtual machine yang menjalankan Dart code, handling memory management dan execution | Dart VM mengeksekusi bytecode dan manage garbage collection |
| **Widget Tree** | Hierarki widget dalam Flutter yang merepresentasikan struktur UI aplikasi | MaterialApp → Scaffold → Column → Text widgets membentuk widget tree |
| **Skia Graphics Engine** | Graphics library yang digunakan Flutter untuk rendering custom UI elements | Flutter menggunakan Skia untuk menggambar consistent UI across platforms |
| **Static Analysis** | Proses analisis code pada compile time untuk detect errors dan enforce rules | Dart analyzer melakukan static analysis untuk null safety checking |

---

## 📖 Referensi

### 📚 Dokumentasi Resmi
1. **Dart Language Tour**. (2024). *Dart Programming Language*. Diakses dari https://dart.dev/language
2. **Flutter Documentation Team**. (2024). *Introduction to Dart*. Flutter.dev. Diakses dari https://docs.flutter.dev/get-started/fundamentals/dart  
3. **Google Developer Documentation**. (2024). *Sound Null Safety in Dart*. Dart.dev. Diakses dari https://dart.dev/null-safety
4. **Dart Team**. (2024). *Effective Dart: Style Guide*. Dart.dev. Diakses dari https://dart.dev/guides/language/effective-dart

### 📖 Buku Akademik
5. **Windmill, E.** (2023). *Beginning Flutter: A Hands-On Guide to App Development*. Wrox Press.
6. **Miola, A.** (2022). *Flutter Complete Reference: Create Beautiful, Fast and Native Apps for Any Device*. Leanpub.
7. **Napoli, M.** (2023). *Beginning Flutter: A Hands-On Guide to App Development*. Apress.
8. **Sande, J.** (2023). *Dart Apprentice: Beginning Programming with Dart*. Razeware LLC.

### 🌐 Resources Online
9. **DartPad Online IDE**. (2024). Official Dart team online development environment. https://dartpad.dev
10. **Zapp.run Flutter Playground**. (2024). Browser-based Flutter development platform. https://zapp.run
11. **Flutter Community**. (2024). Community guidelines dan best practices. https://flutter.dev/community
12. **Dart Language Specification**. (2024). Technical specification document. https://dart.dev/guides/language/spec

### 🎓 Sumber Akademik
13. **Bracha, G.** (2015). *The Dart Programming Language*. Addison-Wesley Professional.
14. **Google Inc.** (2024). *Flutter Architecture Overview*. Technical whitepaper. Flutter.dev.
15. **IEEE Computer Society**. (2023). *Cross-Platform Mobile Development: A Comparative Study*. IEEE Software Magazine.

---

## 🎯 Persiapan Minggu Depan

Pada **Minggu 2: Alur Kontrol, Fungsi, dan Koleksi Data**, kita akan mengeksplorasi concepts yang akan mengubah cara Anda berpikir tentang program flow dan data organization:

**🔮 Preview Materi Minggu 2:**
- 🔄 **Control Flow Statements**: if-else, loops, switch statements untuk decision making
- ⚡ **Functions & Parameters**: Modular programming dengan different parameter types  
- 📊 **Collections (List, Set, Map)**: Data structures untuk managing related information
- 🧮 **Advanced Operators**: Logical, comparison, dan assignment operators

**📚 Persiapan yang Disarankan:**
1. ✅ Pastikan environment Dart sudah working perfectly untuk smooth transition
2. ✅ Complete dan review semua praktikum Minggu 1 sampai comfortable dengan syntax
3. ✅ Familiarize diri dengan https://zapp.run/ interface untuk efficient coding practice
4. ✅ Review kembali null safety concepts karena akan digunakan extensively
5. ✅ Practice basic mathematical operations dan string manipulation

**🎯 Mental Model untuk Minggu Depan:**
Minggu depan kita akan moving dari "working with individual pieces of data" ke "orchestrating complex data flows dan making intelligent decisions". Think of it seperti evolving dari knowing individual words dalam bahasa baru ke constructing complete, meaningful sentences.

**💡 Reflection Questions:**
- Bagaimana null safety akan membantu ketika working dengan collections data?
- Bagaimana functions dapat membantu organize code yang akan kita write?
- Apa challenges yang mungkin muncul ketika combining multiple data types dalam collections?

---

*🎉 Selamat! Anda telah successfully menguasai fundamental building blocks of Dart programming. Foundation yang solid ini akan menjadi stepping stone untuk advanced concepts yang akan kita explore minggu depan!*

🚀 **Remember**: Programming mastery comes from consistent practice dan gradual complexity building. Setiap line of code yang Anda tulis adalah investment dalam kemampuan problem-solving Anda sebagai developer!
