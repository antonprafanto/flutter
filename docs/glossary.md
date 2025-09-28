# 📚 Flutter & Dart Glossary

[![Flutter](https://img.shields.io/badge/Flutter-Glossary-blue?style=for-the-badge&logo=flutter)](../README.md)
[![Dart](https://img.shields.io/badge/Dart-Terminology-orange?style=for-the-badge&logo=dart)](../README.md)

> 📖 **Comprehensive dictionary of Flutter and Dart terms, concepts, and terminology for quick reference**

## 📋 Daftar Isi
- [A-C](#a-c) | [D-F](#d-f) | [G-I](#g-i) | [J-L](#j-l) | [M-O](#m-o) | [P-R](#p-r) | [S-U](#s-u) | [V-Z](#v-z)
- [Arsitektur & Konsep](#-arsitektur--konsep)
- [Widget & UI](#-widget--ui)
- [State Management](#-state-management)
- [Dart Language](#-dart-language)
- [Tools & Development](#-tools--development)

---

## A-C

### **Adaptive Widget**
Widget yang secara otomatis menyesuaikan tampilan berdasarkan platform (iOS vs Android).

### **Animation**
Perubahan visual yang smooth dari satu state ke state lain dalam periode waktu tertentu.

### **AnimationController**
Class yang mengontrol animasi, termasuk duration, status, dan nilai current animation.

### **APK (Android Package Kit)**
Format file untuk aplikasi Android yang berisi semua komponen aplikasi.

### **App Bundle**
Format publishing Android yang memungkinkan Google Play mengoptimalkan APK untuk setiap device configuration.

### **AppBar**
Widget yang menampilkan toolbar di bagian atas screen, biasanya berisi title dan actions.

### **Asset**
Resource seperti image, font, atau file lain yang di-bundle dengan aplikasi.

### **Async/Await**
Pattern Dart untuk menangani operasi asynchronous tanpa menggunakan callback.

### **Build Context**
Reference ke lokasi widget dalam widget tree, digunakan untuk mengakses inherited widgets.

### **Build Method**
Method yang dipanggil Flutter untuk membangun UI dari widget.

### **BuildRunner**
Tool Dart untuk code generation, seperti JSON serialization atau data classes.

---

## D-F

### **Dart**
Programming language yang digunakan untuk mengembangkan aplikasi Flutter.

### **Debug Mode**
Mode development yang menyediakan hot reload, debugging tools, dan error reporting.

### **DevTools**
Suite tools untuk debugging, profiling, dan inspecting aplikasi Flutter.

### **Dispose**
Method yang dipanggil ketika StatefulWidget dihapus dari widget tree untuk cleanup resources.

### **Driver**
Framework untuk integration testing yang menjalankan test pada device atau emulator nyata.

### **Element**
Instance dari widget dalam widget tree yang menyimpan state dan configuration.

### **Emulator**
Virtual device yang mensimulasikan perangkat mobile untuk testing aplikasi.

### **Extension Method**
Feature Dart yang memungkinkan menambahkan functionality ke existing classes.

### **FAB (Floating Action Button)**
Button circular yang "float" di atas konten, biasanya untuk primary action.

### **Firebase**
Platform Google untuk backend services seperti authentication, database, dan analytics.

### **FlatButton**
(Deprecated) Button tanpa elevation, sekarang diganti dengan TextButton.

### **Flutter Inspector**
Tool untuk menganalisis widget tree dan debug UI issues.

### **Future**
Dart class yang merepresentasikan nilai yang akan tersedia di masa depan.

---

## G-I

### **Gesture Detector**
Widget yang mendeteksi berbagai user gestures seperti tap, swipe, atau pinch.

### **Golden Test**
Test yang membandingkan rendered widget dengan file gambar reference.

### **Hot Reload**
Feature yang memungkinkan melihat perubahan code secara instant tanpa restart aplikasi.

### **Hot Restart**
Restart aplikasi sambil mempertahankan debug session.

### **HTTP**
Protocol untuk komunikasi client-server, digunakan untuk API calls.

### **Inherited Widget**
Widget yang menyediakan data ke descendant widgets dalam widget tree.

### **Integration Test**
Test yang menguji aplikasi secara end-to-end pada device nyata atau emulator.

### **iOS**
Operating system Apple untuk iPhone dan iPad.

---

## J-L

### **JSON**
JavaScript Object Notation, format data yang umum digunakan untuk API communication.

### **Key**
Identifier unik untuk widget yang membantu Flutter mengidentifikasi perubahan dalam widget tree.

### **Layout**
Arrangement dari widgets untuk membentuk user interface.

### **ListView**
Scrollable widget yang menampilkan children dalam list format.

### **Locale**
Configuration untuk language dan regional settings.

---

## M-O

### **Material Design**
Design system Google yang diimplementasikan dalam Flutter Material widgets.

### **MediaQuery**
Class yang menyediakan informasi tentang screen size, orientation, dan system settings.

### **Method Channel**
Communication channel antara Flutter dan platform-specific code.

### **Navigator**
Class yang mengelola stack dari routes untuk navigation antar screens.

### **Null Safety**
Feature Dart yang mencegah null reference errors pada compile time.

---

## P-R

### **Package**
Reusable code library yang dapat digunakan dalam multiple projects.

### **Plugin**
Package yang mengakses platform-specific functionality.

### **Provider**
State management solution yang menggunakan InheritedWidget pattern.

### **Pub.dev**
Official package repository untuk Dart dan Flutter packages.

### **Pubspec.yaml**
Configuration file yang mendefinisikan dependencies, assets, dan metadata project.

### **Release Mode**
Production build mode yang dioptimasi untuk performance dan size.

### **RenderBox**
Base class untuk widgets yang memiliki size dan position dalam layout.

### **Route**
Screen atau page dalam aplikasi yang dikelola oleh Navigator.

---

## S-U

### **Scaffold**
Widget yang menyediakan struktur dasar untuk Material Design screen.

### **SDK (Software Development Kit)**
Set tools dan libraries untuk developing Flutter applications.

### **setState**
Method untuk memperbarui state dalam StatefulWidget dan trigger rebuild.

### **StatefulWidget**
Widget yang dapat berubah state-nya selama lifecycle aplikasi.

### **StatelessWidget**
Widget yang state-nya tidak berubah setelah dibuat.

### **Stream**
Sequence asynchronous data yang dapat disubscribe untuk menerima updates.

### **Theme**
Configuration untuk visual appearance aplikasi seperti colors, fonts, dan shapes.

### **Ticker**
Object yang menghasilkan signal untuk setiap frame, digunakan untuk animations.

### **Unit Test**
Test yang menguji individual functions atau classes secara isolated.

---

## V-Z

### **ValueNotifier**
Simple class untuk state management yang dapat diobserve untuk changes.

### **Widget**
Building block dasar untuk Flutter UI, everything is a widget.

### **Widget Test**
Test yang menguji widget behavior dalam controlled environment.

### **YAML**
Data serialization format yang digunakan dalam pubspec.yaml.

---

## 🏗️ Arsitektur & Konsep

### **Widget Tree**
Hierarchical structure dari semua widgets dalam aplikasi Flutter.
```
MaterialApp
└── Scaffold
    ├── AppBar
    └── Body
        └── Column
            ├── Text
            └── Button
```

### **Element Tree**
Internal tree yang mengelola state dan lifecycle dari widgets.

### **Render Tree**
Tree yang bertanggung jawab untuk layout, painting, dan hit testing.

### **Three Trees Architecture**
Flutter menggunakan tiga tree: Widget Tree, Element Tree, dan Render Tree untuk efficiency.

### **Declarative UI**
Paradigma dimana UI dideskripsikan sebagai function dari state, bukan imperative commands.

### **Reactive Programming**
Programming paradigma dimana aplikasi react terhadap perubahan data.

---

## 🎨 Widget & UI

### **Composition over Inheritance**
Flutter menggunakan composition (combining widgets) daripada inheritance untuk building UI.

### **Material Widgets**
Widgets yang mengimplementasikan Material Design guidelines.
- `MaterialApp`, `Scaffold`, `AppBar`, `FloatingActionButton`

### **Cupertino Widgets**
Widgets yang mengimplementasikan iOS design guidelines.
- `CupertinoApp`, `CupertinoPageScaffold`, `CupertinoNavigationBar`

### **Layout Widgets**
Widgets yang mengatur posisi dan size dari child widgets.
- `Row`, `Column`, `Stack`, `Container`, `Padding`

### **Scrollable Widgets**
Widgets yang dapat di-scroll untuk konten yang lebih besar dari screen.
- `ListView`, `GridView`, `SingleChildScrollView`, `CustomScrollView`

### **Input Widgets**
Widgets untuk user input.
- `TextField`, `Checkbox`, `Radio`, `Switch`, `Slider`

---

## 🔄 State Management

### **Local State**
State yang hanya digunakan dalam satu widget, biasanya dikelola dengan `setState()`.

### **App State**
State yang digunakan di multiple widgets atau persists across screens.

### **Ephemeral State**
State sementara seperti animation values atau form validation.

### **Provider Pattern**
State management menggunakan `ChangeNotifier` dan `Consumer` widgets.

### **BLoC Pattern**
Business Logic Component pattern yang memisahkan business logic dari UI.

### **Riverpod**
Modern state management solution yang merupakan evolution dari Provider.

---

## 🎯 Dart Language

### **Strong Typing**
Dart adalah strongly typed language dengan type inference.

### **Null Safety**
System yang mencegah null reference errors pada compile time.

### **Extension Methods**
Cara untuk menambahkan methods ke existing classes tanpa inheritance.

### **Generics**
Type parameters yang memungkinkan writing reusable code.

### **Mixins**
Cara untuk reuse code di multiple classes tanpa inheritance.

### **Isolates**
Dart's approach untuk concurrent programming yang isolated dari main thread.

---

## 🛠️ Tools & Development

### **Flutter CLI**
Command line interface untuk creating, building, dan managing Flutter projects.

### **VS Code Extensions**
- Dart extension untuk language support
- Flutter extension untuk debugging dan tools

### **Android Studio**
IDE dengan comprehensive Flutter support dan Android emulator.

### **Xcode**
Apple's IDE untuk iOS development dan iOS simulator.

### **Firebase Console**
Web interface untuk managing Firebase services.

### **Fastlane**
Tool untuk automating app deployment dan release processes.

---

## 🚀 Performance Terms

### **Frame Rate**
Number of frames rendered per second, ideally 60fps untuk smooth UI.

### **Jank**
Stuttering atau choppy animations yang disebabkan dropped frames.

### **Build Cost**
Computational cost untuk building widgets, penting untuk performance.

### **Repaint Boundary**
Widget yang isolates repainting untuk mengurangi unnecessary rebuilds.

### **Const Constructor**
Constructor yang menghasilkan compile-time constant, reducing rebuilds.

---

## 🔗 Platform Integration

### **Platform Channel**
Communication mechanism antara Flutter dan native platform code.

### **Method Channel**
Type of platform channel untuk invoking platform-specific methods.

### **Event Channel**
Type of platform channel untuk streaming data dari platform ke Flutter.

### **Plugin**
Package yang menyediakan akses ke platform-specific functionality.

### **Federated Plugin**
Plugin architecture yang mendukung multiple platforms dengan shared interface.

---

## 📱 Mobile Development

### **APK Split**
Technique untuk reducing app size dengan membuat multiple APKs untuk different configurations.

### **Proguard**
Tool untuk code obfuscation dan minification pada Android builds.

### **App Store Connect**
Apple's platform untuk managing iOS app distribution.

### **Google Play Console**
Google's platform untuk managing Android app distribution.

### **Beta Testing**
Process untuk testing apps dengan limited audience sebelum public release.

---

## 🧪 Testing Terms

### **Widget Testing**
Testing individual widgets dalam controlled environment.

### **Integration Testing**
End-to-end testing pada real device atau emulator.

### **Golden Testing**
Visual regression testing menggunakan image comparison.

### **Mock**
Fake implementation yang digunakan dalam testing untuk isolating units.

### **Test Coverage**
Percentage code yang di-cover oleh tests.

---

## 📚 Additional Resources

### **Official Documentation**
- [Flutter.dev](https://flutter.dev)
- [Dart.dev](https://dart.dev)
- [API Documentation](https://api.flutter.dev)

### **Learning Resources**
- [Flutter Codelabs](https://codelabs.developers.google.com/?cat=Flutter)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter YouTube Channel](https://www.youtube.com/c/flutterdev)

### **Community**
- [Flutter Community on GitHub](https://github.com/fluttercommunity)
- [r/FlutterDev on Reddit](https://reddit.com/r/FlutterDev)
- [Flutter Discord](https://discord.gg/N7Yshp4)

---

## 🎯 Quick Reference Tips

### **Remember These Acronyms:**
- **DRY**: Don't Repeat Yourself
- **SOLID**: Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, Dependency Inversion
- **MVP**: Minimum Viable Product
- **CI/CD**: Continuous Integration/Continuous Deployment
- **API**: Application Programming Interface
- **JSON**: JavaScript Object Notation
- **HTTP**: HyperText Transfer Protocol
- **SDK**: Software Development Kit
- **IDE**: Integrated Development Environment

### **Common Patterns:**
- **Singleton**: One instance of a class
- **Factory**: Creating objects without specifying exact class
- **Observer**: Notifying multiple objects about state changes
- **Builder**: Constructing complex objects step by step
- **Strategy**: Selecting algorithm at runtime

---

**💡 Tip**: Bookmark this glossary dan gunakan Ctrl+F (Cmd+F) untuk mencari terms dengan cepat!