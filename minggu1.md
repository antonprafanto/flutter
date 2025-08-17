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

Dalam dunia teknologi modern, aplikasi mobile telah menjadi bagian integral dari kehidupan sehari-hari. Untuk membangun aplikasi mobile, kita perlu memahami berbagai pendekatan yang tersedia.

### 🏗️ Tiga Pendekatan Utama Pengembangan Mobile

#### 1. 🎯 **Native Development**
Pengembangan aplikasi yang dibuat khusus untuk satu platform menggunakan bahasa dan tools resmi platform tersebut.

**Karakteristik:**
- **iOS**: Swift/Objective-C + Xcode
- **Android**: Kotlin/Java + Android Studio
- **Performance**: Optimal dan cepat
- **UI/UX**: Mengikuti design guidelines platform
- **Development Cost**: Tinggi (butuh 2 tim terpisah)

#### 2. 🌐 **Hybrid Development**
Pengembangan aplikasi menggunakan teknologi web (HTML, CSS, JavaScript) yang dibungkus dalam container native.

**Karakteristik:**
- **Technology**: Apache Cordova/PhoneGap, Ionic
- **Performance**: Lebih lambat dari native
- **UI/UX**: Terbatas, tidak selalu terasa natural
- **Development Cost**: Rendah (satu codebase)

#### 3. ⚡ **Cross-Platform Development**
Pengembangan aplikasi dengan satu codebase yang dapat berjalan di multiple platform dengan performance mendekati native.

**Karakteristik:**
- **Technology**: Flutter (Dart), React Native (JavaScript)
- **Performance**: Mendekati native
- **UI/UX**: High fidelity, custom rendering
- **Development Cost**: Sedang (balance antara cost dan quality)

### 📊 Perbandingan Detail

| Aspek | Native | Hybrid | Cross-Platform |
|-------|--------|--------|----------------|
| **⚡ Performance** | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |
| **💰 Development Cost** | ⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **🎨 UI/UX Quality** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **🔧 Maintenance** | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **📱 Platform Features** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |

---

## 🚀 Mengapa Flutter dan Dart?

### 🎯 Flutter: Solusi Cross-Platform Modern

Flutter adalah UI toolkit dari Google yang memungkinkan pengembangan aplikasi cross-platform dengan performance tinggi dan UI yang konsisten.

**Keunggulan Flutter:**

#### 🔥 **Hot Reload**
```dart
// Ubah text ini
Text('Hello World!')
// Save file → Langsung terlihat perubahannya di emulator!
```

📋 **Cara Kerja Hot Reload:**
```
🎯 START: Developer menulis code
  ↓
1️⃣ Save file (.dart) 
  ↓
2️⃣ Flutter detect changes
  ↓  
3️⃣ Compile hanya bagian yang berubah
  ↓
4️⃣ Inject ke running app
  ↓
✅ END: UI updated instantly (< 1 detik)
```

🚀 **Coba Sekarang!** 
Nanti saat praktikum, Anda akan merasakan keajaiban Hot Reload di: https://zapp.run/

#### ⚡ **Single Codebase, Multiple Platforms**
```dart
// Code yang sama berjalan di:
// ✅ Android
// ✅ iOS  
// ✅ Web
// ✅ Desktop (Windows, macOS, Linux)
```

#### 🎨 **Custom Rendering Engine**
Flutter tidak menggunakan native widgets, tapi menggambar sendiri setiap pixel di layar menggunakan Skia Graphics Engine.

```
📊 **Rendering Process:**
Dart Code → Flutter Framework → Skia Engine → Platform Canvas → Screen Pixels
```

### 💎 Mengapa Dart?

Dart adalah bahasa pemrograman yang dirancang khusus untuk UI development modern.

**Keunggulan Dart:**

#### 🔄 **Just-In-Time (JIT) & Ahead-Of-Time (AOT) Compilation**
```dart
// Development: JIT compilation (Hot Reload)
// Production: AOT compilation (Fast startup, small size)
```

📋 **Compilation Flow:**
```
🎯 Development Mode (JIT):
Source Code → JIT Compiler → Dart VM → Hot Reload ✨

🎯 Production Mode (AOT):  
Source Code → AOT Compiler → Native Machine Code → Fast App 🚀
```

#### 🛡️ **Sound Null Safety**
```dart
// Dart mencegah null reference errors di compile time!
String? name;  // Bisa null
String title;  // Tidak bisa null
```

#### 📱 **UI-Focused Language Features**
```dart
// Cascade operator untuk styling
Container()
  ..width = 100
  ..height = 100
  ..color = Colors.blue;
```

---

## ⚙️ Setup Environment Dart

### 📦 Instalasi Dart SDK

#### 🖥️ **Windows**

**Step 1: Download Dart SDK**
```bash
# Via Chocolatey (Recommended)
choco install dart-sdk

# Atau download manual dari:
# https://dart.dev/get-dart
```

**Step 2: Set PATH Environment**
```bash
# Tambahkan ke System PATH:
C:\tools\dart-sdk\bin
```

**Step 3: Verify Installation**
```bash
dart --version
```

📋 **Verification Process:**
```
🎯 START: Open Command Prompt
  ↓
1️⃣ Type: dart --version
  ↓
2️⃣ System checks PATH
  ↓
3️⃣ Find dart.exe in dart-sdk/bin
  ↓
✅ END: Shows "Dart SDK version X.X.X"
```

#### 🍎 **macOS**

```bash
# Via Homebrew
brew tap dart-lang/dart
brew install dart

# Verify
dart --version
```

#### 🐧 **Linux**

```bash
# Via apt (Ubuntu/Debian)
sudo apt update
sudo apt install dart

# Verify  
dart --version
```

### 💻 **Setup IDE**

#### 🟦 **VS Code (Recommended for Beginners)**

**Step 1: Install VS Code**
Download dari: https://code.visualstudio.com/

**Step 2: Install Dart Extension**
```
🎯 VS Code Extensions:
  ↓
1️⃣ Search: "Dart"
  ↓  
2️⃣ Install: "Dart" by Dart Code
  ↓
3️⃣ Restart VS Code
  ↓
✅ END: Dart support ready!
```

#### 🟨 **DartPad (Online Testing)**

Untuk testing cepat tanpa setup: https://dartpad.dev/

---

## 📝 Dasar-Dasar Bahasa Dart

### 🚀 Program Dart Pertama

💻 **Hello World Program:**
```dart
void main() {
  print('Hello, World!');
}
```

📋 **Step-by-Step Execution:**
```
🎯 START: Program dimulai
  ↓
1️⃣ Dart runtime mencari function main()
  ↓
2️⃣ Execute code dalam main()
  ↓ 
3️⃣ print() function dipanggil
  ↓
4️⃣ Text 'Hello, World!' dikirim ke console
  ↓
✅ END: Program selesai
```

🚀 **Coba Sekarang!** 
Copy code di atas dan jalankan di: https://zapp.run/

### 📦 **Comments**

💻 **Berbagai Jenis Komentar:**
```dart
// Single line comment

/* 
Multi-line comment
Bisa lebih dari satu baris
*/

/// Documentation comment
/// Biasanya untuk function atau class
void myFunction() {
  // Code here
}
```

📋 **Comment Processing:**
```
🎯 Compiler reads file
  ↓
1️⃣ Identify comment markers (// /* ///)
  ↓
2️⃣ Skip comment content during compilation
  ↓
3️⃣ Process only actual code
  ↓
✅ Comments = ignored in final program
```

### 🏷️ **Variables dan Tipe Data**

#### **Deklarasi Variable**

💻 **Menggunakan `var` (Type Inference):**
```dart
void main() {
  var name = 'John';        // String (otomatis terdeteksi)
  var age = 25;             // int (otomatis terdeteksi)  
  var height = 175.5;       // double (otomatis terdeteksi)
  var isStudent = true;     // bool (otomatis terdeteksi)
  
  print('Nama: $name');
  print('Umur: $age');
  print('Tinggi: $height');
  print('Mahasiswa: $isStudent');
}
```

📋 **Type Inference Process:**
```
🎯 var name = 'John';
  ↓
1️⃣ Dart analyzes assigned value: 'John'
  ↓
2️⃣ Detects quotes → String type
  ↓
3️⃣ Variable name gets type: String
  ↓
✅ name is now String type (immutable type)
```

🚀 **Coba Sekarang!** 
Copy code di atas dan lihat hasilnya di: https://zapp.run/

💻 **Explicit Type Declaration:**
```dart
void main() {
  String firstName = 'Alice';
  int score = 95;
  double temperature = 36.5;
  bool isPassed = true;
  
  print('Student: $firstName');
  print('Score: $score');
  print('Temperature: $temperature°C'); 
  print('Passed: $isPassed');
}
```

📋 **Explicit vs Inference:**
```
📊 Type Declaration Comparison:

var name = 'John';          ←→    String name = 'John';
     ↓                             ↓
Type inferred by Dart       Type explicitly specified
(Dart decides)              (Developer decides)
     ↓                             ↓
Same result: String type    Same result: String type
```

#### 🔒 **Konstanta: `final` vs `const`**

💻 **Final - Runtime Constant:**
```dart
void main() {
  final currentTime = DateTime.now();  // Nilai ditentukan saat runtime
  final userName = 'Alice';            // Tidak bisa diubah setelah assigned
  
  print('Current time: $currentTime');
  print('User: $userName');
  
  // userName = 'Bob';  // ❌ Error! final variable tidak bisa diubah
}
```

💻 **Const - Compile Time Constant:**
```dart
void main() {
  const pi = 3.14159;           // Nilai sudah ditentukan saat compile
  const appName = 'MyApp';      // Compile-time constant
  
  print('Pi: $pi');
  print('App: $appName');
  
  // const currentTime = DateTime.now();  // ❌ Error! 
  // DateTime.now() hanya bisa diketahui saat runtime
}
```

📋 **Final vs Const Comparison:**
```
🎯 FINAL:
Compilation → Runtime → Value assigned → Cannot change
                ↑
            Value determined here

🎯 CONST:  
Compilation → Value determined → Runtime → Cannot change
            ↑
        Value determined here
```

#### 📊 **Tipe Data Built-in**

💻 **Numbers:**
```dart
void main() {
  // Integer (bilangan bulat)
  int quantity = 42;
  int negative = -10;
  
  // Double (bilangan desimal)  
  double price = 19.99;
  double pi = 3.14159;
  
  // num (parent type untuk int dan double)
  num score = 85;      // Bisa int
  num average = 87.5;  // Atau double
  
  print('Quantity: $quantity');
  print('Price: \$${price}');
  print('Score: $score');
}
```

📋 **Number Type Hierarchy:**
```
📊 Dart Number Types:
       num
      ↙   ↘
    int   double
     ↓     ↓
  42, -5  3.14, -2.5
```

🚀 **Coba Sekarang!** 
Eksperimen dengan berbagai angka di: https://zapp.run/

💻 **Strings:**
```dart
void main() {
  // Single quotes
  String message = 'Hello World';
  
  // Double quotes
  String name = "Alice";
  
  // String interpolation
  String greeting = 'Hello, $name!';
  String calculation = 'The result is ${2 + 3}';
  
  // Multi-line string
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

📋 **String Interpolation Process:**
```
🎯 String interpolation: 'Hello, $name!'
  ↓
1️⃣ Dart scans for $ symbol
  ↓
2️⃣ Finds variable name after $
  ↓
3️⃣ Gets value of name variable
  ↓
4️⃣ Replaces $name with actual value
  ↓
✅ Result: 'Hello, Alice!'
```

💻 **Booleans:**
```dart
void main() {
  bool isOnline = true;
  bool isCompleted = false;
  
  // Boolean dari comparison
  bool isAdult = 20 >= 18;         // true
  bool isEmpty = 'hello'.isEmpty;   // false
  
  print('Online: $isOnline');
  print('Adult: $isAdult');
  print('Empty: $isEmpty');
}
```

### 🔧 **String Operations**

💻 **String Methods:**
```dart
void main() {
  String text = 'Flutter Development';
  
  print('Original: $text');
  print('Length: ${text.length}');
  print('Uppercase: ${text.toUpperCase()}');
  print('Lowercase: ${text.toLowerCase()}');
  print('Contains Flutter: ${text.contains('Flutter')}');
  print('Starts with F: ${text.startsWith('F')}');
  print('Substring: ${text.substring(0, 7)}');
}
```

📋 **String Method Chain:**
```
🎯 text.toUpperCase().substring(0, 7)
  ↓
1️⃣ text = 'Flutter Development'
  ↓
2️⃣ toUpperCase() → 'FLUTTER DEVELOPMENT'  
  ↓
3️⃣ substring(0, 7) → 'FLUTTER'
  ↓
✅ Final result: 'FLUTTER'
```

🚀 **Coba Sekarang!** 
Mainkan dengan string methods di: https://zapp.run/

---

## 🔒 Sound Null Safety

### 🛡️ **Apa itu Null Safety?**

Null Safety adalah fitur Dart yang mencegah null reference errors pada compile time, bukan runtime.

💻 **Nullable vs Non-nullable:**
```dart
void main() {
  // Non-nullable (default)
  String name = 'Alice';              // Harus memiliki nilai
  int age = 25;                       // Tidak bisa null
  
  // Nullable (dengan ?)
  String? nickname;                   // Bisa null
  int? score;                         // Bisa null
  
  print('Name: $name');               // ✅ Safe
  print('Nickname: $nickname');       // ✅ Safe (null ditampilkan)
  
  // name = null;                     // ❌ Error! Non-nullable
  nickname = null;                    // ✅ OK, karena nullable
}
```

📋 **Null Safety Check:**
```
🎯 Variable Declaration Analysis:
  ↓
1️⃣ String name;  → Dart checks: "No ? mark"
  ↓
2️⃣ Mark as non-nullable → Must have value
  ↓
3️⃣ String? nickname; → Dart checks: "Has ? mark"  
  ↓
4️⃣ Mark as nullable → Can be null
  ↓
✅ Compile-time safety guaranteed
```

### ⚡ **Null-aware Operators**

💻 **Null Check Operator (!):**
```dart
void main() {
  String? nullableName;
  
  // Assign non-null value
  nullableName = 'Bob';
  
  // Tell Dart: "I'm sure this is not null"
  String definitelyName = nullableName!;
  
  print('Name: $definitelyName');
  
  // ⚠️ Hati-hati! Jika nullableName null, program akan crash
}
```

💻 **Null-aware Access (?.):**
```dart
void main() {
  String? nullableText;
  
  // Safe method call - returns null if object is null
  int? length = nullableText?.length;
  
  print('Length: $length');  // Prints: Length: null
  
  nullableText = 'Hello';
  length = nullableText?.length;
  print('Length: $length');  // Prints: Length: 5
}
```

📋 **Null-aware Operator Flow:**
```
🎯 nullableText?.length
  ↓
1️⃣ Check if nullableText is null
  ↓                    ↓
[NULL] ❌             [NOT NULL] ✅  
  ↓                    ↓
Return null           Call .length method
  ↓                    ↓
✅ Safe!              ✅ Safe!
```

💻 **Null Coalescing (??):**
```dart
void main() {
  String? username;
  
  // Provide default value if null
  String displayName = username ?? 'Guest';
  
  print('Welcome, $displayName!');  // Welcome, Guest!
  
  username = 'Alice';
  displayName = username ?? 'Guest';
  print('Welcome, $displayName!');  // Welcome, Alice!
}
```

📋 **Null Coalescing Logic:**
```
🎯 username ?? 'Guest'
  ↓
1️⃣ Evaluate left side: username
  ↓                    ↓
[NULL] ❌             [NOT NULL] ✅
  ↓                    ↓
Use right side        Use left side
'Guest'               username value
  ↓                    ↓
✅ Result             ✅ Result
```

🚀 **Coba Sekarang!** 
Eksperimen dengan null safety di: https://zapp.run/

### 🎯 **Best Practices Null Safety**

💻 **Practical Example:**
```dart
void main() {
  // ✅ Good: Initialize non-nullable variables
  String appTitle = 'My Flutter App';
  int version = 1;
  
  // ✅ Good: Use nullable when value might not exist
  String? userEmail;  // User might not be logged in
  int? lastScore;     // Game might not be played yet
  
  // ✅ Good: Safe null checking
  if (userEmail != null) {
    print('Email: $userEmail');
    print('Email length: ${userEmail.length}'); // Safe after null check
  }
  
  // ✅ Good: Provide defaults
  String greeting = userEmail != null 
    ? 'Welcome back!' 
    : 'Welcome, new user!';
  
  print(greeting);
}
```

📋 **Null Safety Benefits:**
```
🎯 Without Null Safety:
Runtime → Null Reference Error → App Crash 💥

🎯 With Null Safety:  
Compile Time → Null Check → Fix Before Build → Safe App ✅
```

---

## 🧪 Praktikum 1: Dasar-Dasar Dart dan Pemecahan Masalah

### 🎯 **Objektif Praktikum**
Pada praktikum ini, Anda akan membuat program Dart yang mendemonstrasikan pemahaman tentang:
- Variable declaration dan type inference
- String manipulation dan interpolation  
- Null safety implementation
- Basic input/output operations

### 📝 **Tugas 1: Personal Information Manager**

💻 **Code Template:**
```dart
void main() {
  // TODO: Lengkapi program ini
  
  // 1. Deklarasikan variable untuk informasi personal
  String fullName = '';           // Nama lengkap Anda
  int age = 0;                    // Umur Anda  
  double height = 0.0;            // Tinggi badan (cm)
  String? nickname;               // Nickname (optional)
  String university = '';         // Nama universitas
  bool isStudent = true;          // Status mahasiswa
  
  // 2. Assign nilai yang sesuai
  // [Isi dengan data Anda]
  
  // 3. Tampilkan informasi dengan format yang menarik
  // [Gunakan string interpolation dan formatting]
  
  // 4. Demonstrasikan null safety
  // [Tampilkan nickname dengan safe access]
  
  // 5. Bonus: Hitung tahun lahir dari umur
  // [Gunakan DateTime.now().year - age]
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
🎯 Birth Year   : 2004
================================
```

### 📝 **Tugas 2: Simple Calculator**

💻 **Challenge Program:**
```dart
void main() {
  // Calculator untuk operasi dasar
  double num1 = 15.5;
  double num2 = 4.2;
  
  // TODO: Implementasikan operasi matematika
  // 1. Penjumlahan
  // 2. Pengurangan  
  // 3. Perkalian
  // 4. Pembagian
  // 5. Modulo (gunakan %)
  
  // TODO: Tampilkan hasil dengan format yang rapi
  // Contoh: "15.5 + 4.2 = 19.7"
  
  // TODO: Handle division by zero dengan null safety
  double? divisionResult = num2 != 0 ? num1 / num2 : null;
  
  // TODO: Tampilkan hasil division dengan null-aware operator
}
```

### 📝 **Tugas 3: String Manipulation**

💻 **Text Processing Challenge:**
```dart
void main() {
  String originalText = 'flutter development is fun and exciting';
  
  // TODO: Implementasikan text processing
  // 1. Convert ke title case (setiap kata huruf pertama kapital)
  // 2. Hitung jumlah kata
  // 3. Hitung jumlah karakter (tanpa spasi)
  // 4. Cek apakah text mengandung kata 'flutter'
  // 5. Replace 'flutter' dengan 'FLUTTER'
  // 6. Ekstrak 3 kata pertama
  
  // Hint: Gunakan split(), join(), contains(), replaceAll()
}
```

📋 **Step-by-Step Processing Guide:**
```
🎯 String Processing Pipeline:
  ↓
1️⃣ Original: 'flutter development is fun and exciting'
  ↓
2️⃣ Split by space → ['flutter', 'development', 'is', 'fun', 'and', 'exciting']
  ↓
3️⃣ Process each word → Capitalize first letter
  ↓
4️⃣ Join back → 'Flutter Development Is Fun And Exciting'
  ↓
✅ Final processed string
```

### 🎯 **Tugas 4: Null Safety Practice**

💻 **Safe Programming Exercise:**
```dart
void main() {
  // Scenario: Data mahasiswa yang mungkin tidak lengkap
  String studentName = 'Alice Johnson';
  int? studentId;                    // Belum di-assign
  String? email;                     // Optional
  double? gpa;                       // Belum ada nilai
  
  // TODO: Implementasikan safe access patterns
  // 1. Tampilkan student info dengan null-safe operators
  // 2. Berikan default values untuk data yang null
  // 3. Demonstrasikan conditional null checking
  // 4. Gunakan null-aware operators (?., ??, !)
  
  // Example scenarios:
  // - Jika email null, tampilkan "Email not provided"
  // - Jika GPA null, tampilkan "GPA not calculated yet"  
  // - Jika studentId null, generate random ID
}
```

### 🚀 **Testing & Submission**

**Platform Testing:**
1. **Primary**: Test semua code di https://zapp.run/
2. **Alternative**: DartPad (https://dartpad.dev/)
3. **Local**: Jika sudah setup environment

**Submission Requirements:**
- ✅ Semua 4 tugas completed dan tested
- ✅ Code berjalan tanpa error  
- ✅ Output sesuai dengan expected format
- ✅ Demonstrasi pemahaman null safety
- ✅ Komentar yang menjelaskan logic

### 💡 **Tips Success**

1. **🧪 Test Frequently**: Test setiap perubahan code di Zapp.run
2. **📖 Read Error Messages**: Dart error messages sangat informatif
3. **🔍 Use dartfmt**: Format code Anda agar rapi dan readable
4. **💬 Add Comments**: Jelaskan logic yang kompleks
5. **🎯 Start Simple**: Mulai dengan implementasi basic, kemudian improve

---

## 📚 Glosarium

| **Term** | **Pengertian** |
|----------|----------------|
| **AOT** | Ahead-Of-Time compilation - kompilasi sebelum program dijalankan |
| **JIT** | Just-In-Time compilation - kompilasi saat program berjalan |
| **Cross-platform** | Aplikasi yang dapat berjalan di multiple platform dengan satu codebase |
| **Hot Reload** | Fitur Flutter yang memungkinkan update UI secara real-time tanpa restart aplikasi |
| **Null Safety** | Sistem type yang mencegah null reference errors pada compile time |
| **Type Inference** | Kemampuan Dart untuk menentukan tipe data secara otomatis dari nilai yang di-assign |
| **String Interpolation** | Teknik memasukkan variable ke dalam string menggunakan syntax $variable |
| **Nullable Type** | Tipe data yang bisa berisi nilai null, ditandai dengan tanda ? |
| **Non-nullable Type** | Tipe data yang tidak bisa berisi nilai null (default di Dart) |
| **Cascade Operator** | Operator (..) yang memungkinkan multiple operations pada object yang sama |

---

## 📖 Referensi

1. **Dart Language Tour**. (2024). *Dart Programming Language*. Diakses dari https://dart.dev/language
2. **Flutter Documentation Team**. (2024). *Introduction to Dart*. Flutter.dev. Diakses dari https://docs.flutter.dev/get-started/fundamentals/dart  
3. **Google Developer Documentation**. (2024). *Sound Null Safety in Dart*. Dart.dev. Diakses dari https://dart.dev/null-safety
4. **Windmill, E.** (2023). *Beginning Flutter: A Hands-On Guide to App Development*. Wrox Press.
5. **Miola, A.** (2022). *Flutter Complete Reference: Create Beautiful, Fast and Native Apps for Any Device*. Leanpub.

---

## 🎯 Persiapan Minggu Depan

Pada **Minggu 2**, kita akan mempelajari:
- 🔄 **Control Flow**: if-else, loops, switch statements
- ⚡ **Functions**: Parameters, return values, arrow functions  
- 📊 **Collections**: List, Set, Map operations
- 🧮 **Advanced Operators**: Logical, comparison, assignment

**Persiapan yang disarankan:**
1. ✅ Pastikan environment Dart sudah working dengan baik
2. ✅ Complete semua praktikum Minggu 1
3. ✅ Familiar dengan https://zapp.run/ untuk testing
4. ✅ Review kembali null safety concepts

---

*🎉 Selamat! Anda telah menyelesaikan dasar-dasar Dart. Minggu depan kita akan mulai membuat program yang lebih interaktif dan powerful!*

🚀 **Jangan lupa**: Practice makes perfect. Semakin sering Anda coding, semakin familiar dengan Dart syntax dan concepts!
