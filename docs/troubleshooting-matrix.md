# 🛠️ Troubleshooting Matrix - Flutter Development

[![Difficulty](https://img.shields.io/badge/Difficulty-Reference-blue?style=for-the-badge)](../README.md)
[![Type](https://img.shields.io/badge/Type-Troubleshooting-red?style=for-the-badge)](../README.md)

> 🎯 **Panduan lengkap untuk mengatasi error umum dalam Flutter development**

## 📋 Daftar Isi
- [Environment Setup Errors](#-environment-setup-errors)
- [Build & Compilation Errors](#-build--compilation-errors)
- [Runtime Errors](#-runtime-errors)
- [Performance Issues](#-performance-issues)
- [Device & Emulator Issues](#-device--emulator-issues)

---

## 🔧 Environment Setup Errors

### Error: "flutter: command not found"

| **Error Code** | **FLT-ENV-001** |
|----------------|----------------|
| **Symptoms** | Command `flutter` tidak dikenali di terminal |
| **Common Causes** | PATH environment variable tidak di-set dengan benar |
| **Solutions** | **Windows:** <br>1. Buka Environment Variables<br>2. Tambahkan `C:\flutter\bin` ke PATH<br>3. Restart terminal<br><br>**macOS/Linux:**<br>1. Edit `~/.zshrc` atau `~/.bashrc`<br>2. Tambahkan: `export PATH="$PATH:$HOME/flutter/bin"`<br>3. Run: `source ~/.zshrc` |
| **Verification** | `flutter --version` should work |
| **Related Issues** | FLT-ENV-002, FLT-ENV-003 |

### Error: "Flutter SDK not found"

| **Error Code** | **FLT-ENV-002** |
|----------------|----------------|
| **Symptoms** | IDE tidak bisa detect Flutter SDK |
| **Common Causes** | Incorrect SDK path in IDE settings |
| **Solutions** | **Android Studio:**<br>1. File → Settings → Languages & Frameworks → Flutter<br>2. Set Flutter SDK path ke lokasi instalasi<br>3. Apply & restart<br><br>**VS Code:**<br>1. Ctrl+Shift+P → "Flutter: Change SDK"<br>2. Browse ke folder Flutter installation |
| **Verification** | IDE shows Flutter tools and can create new projects |
| **Related Issues** | FLT-ENV-001 |

### Error: "Android SDK not found"

| **Error Code** | **FLT-ENV-003** |
|----------------|----------------|
| **Symptoms** | `flutter doctor` shows Android toolchain issues |
| **Common Causes** | Android SDK tidak terinstall atau path salah |
| **Solutions** | 1. Install Android Studio<br>2. Run Android Studio → SDK Manager<br>3. Download Android SDK<br>4. Set ANDROID_HOME environment variable<br>5. Add platform-tools to PATH |
| **Verification** | `flutter doctor` shows ✓ for Android toolchain |
| **Related Issues** | FLT-DEV-001 |

---

## 🏗️ Build & Compilation Errors

### Error: "Gradle build failed"

| **Error Code** | **FLT-BLD-001** |
|----------------|----------------|
| **Symptoms** | Build gagal dengan Gradle error messages |
| **Common Causes** | Gradle cache corrupted, dependency conflicts, version issues |
| **Solutions** | ```bash<br># Clean project<br>flutter clean<br>cd android<br>./gradlew clean<br>cd ..<br><br># Reset dependencies<br>flutter packages get<br><br># Rebuild<br>flutter run<br>``` |
| **Prevention** | Regular `flutter clean` sebelum major builds |
| **Related Issues** | FLT-BLD-002, FLT-BLD-003 |

### Error: "Pod install failed" (iOS)

| **Error Code** | **FLT-BLD-002** |
|----------------|----------------|
| **Symptoms** | iOS build gagal dengan CocoaPods errors |
| **Common Causes** | CocoaPods cache issues, outdated pods |
| **Solutions** | ```bash<br># Clean pods<br>cd ios<br>pod clean<br>pod deintegrate<br>pod setup<br>pod install<br>cd ..<br><br># Alternative<br>flutter clean<br>cd ios<br>rm -rf Pods<br>rm Podfile.lock<br>pod install<br>``` |
| **Verification** | iOS build completes successfully |
| **Related Issues** | FLT-BLD-001 |

### Error: "Multidex error"

| **Error Code** | **FLT-BLD-003** |
|----------------|----------------|
| **Symptoms** | Build fails dengan "Cannot fit requested classes in a single dex file" |
| **Common Causes** | Too many dependencies, 64K method limit exceeded |
| **Solutions** | Add to `android/app/build.gradle`:<br>```gradle<br>android {<br>    defaultConfig {<br>        multiDexEnabled true<br>    }<br>}<br><br>dependencies {<br>    implementation 'androidx.multidex:multidex:2.0.1'<br>}<br>``` |
| **Prevention** | Monitor dependency count, use tree shaking |
| **Related Issues** | FLT-BLD-001 |

---

## 🚀 Runtime Errors

### Error: "RenderFlex overflowed"

| **Error Code** | **FLT-RUN-001** |
|----------------|----------------|
| **Symptoms** | Yellow/black stripes, "RenderFlex overflowed by X pixels" |
| **Common Causes** | Widget content larger than available space |
| **Solutions** | 1. Wrap with `Expanded` or `Flexible`<br>2. Use `SingleChildScrollView`<br>3. Set `overflow: TextOverflow.ellipsis`<br>4. Adjust widget sizes |
| **Example Fix** | ```dart<br>// Before<br>Row(children: [Text('Very long text')])<br><br>// After<br>Row(children: [<br>  Expanded(child: Text('Very long text'))<br>])<br>``` |
| **Prevention** | Test on different screen sizes |

### Error: "setState() called after dispose()"

| **Error Code** | **FLT-RUN-002** |
|----------------|----------------|
| **Symptoms** | Runtime exception when calling setState on disposed widget |
| **Common Causes** | Async operations continue after widget disposal |
| **Solutions** | ```dart<br>// Check if widget is still mounted<br>if (mounted) {<br>  setState(() {<br>    // Update state<br>  });<br>}<br><br>// Or cancel subscriptions in dispose<br>@override<br>void dispose() {<br>  subscription?.cancel();<br>  super.dispose();<br>}<br>``` |
| **Prevention** | Always check `mounted` before setState, properly dispose resources |

### Error: "Navigator operation requested with a context that does not include a Navigator"

| **Error Code** | **FLT-RUN-003** |
|----------------|----------------|
| **Symptoms** | Navigation fails dengan context error |
| **Common Causes** | Using wrong BuildContext for navigation |
| **Solutions** | 1. Use correct context (from Scaffold body)<br>2. Get context from Builder widget<br>3. Use GlobalKey for navigation |
| **Example Fix** | ```dart<br>// Use Builder to get correct context<br>Builder(<br>  builder: (context) => ElevatedButton(<br>    onPressed: () => Navigator.push(context, ...),<br>    child: Text('Navigate'),<br>  ),<br>)<br>``` |

---

## ⚡ Performance Issues

### Issue: "App startup slow"

| **Performance Code** | **FLT-PERF-001** |
|---------------------|------------------|
| **Symptoms** | App takes >3 seconds to start |
| **Common Causes** | Heavy operations in main(), large asset files |
| **Solutions** | 1. Move heavy operations to async<br>2. Optimize image sizes<br>3. Use lazy loading<br>4. Enable tree shaking |
| **Measurement** | Use `flutter run --profile` untuk measure |
| **Target** | <2 seconds on mid-range devices |

### Issue: "UI lag and janky scrolling"

| **Performance Code** | **FLT-PERF-002** |
|---------------------|------------------|
| **Symptoms** | UI tidak smooth, scrolling tersendat-sendat |
| **Common Causes** | Heavy build methods, unnecessary rebuilds |
| **Solutions** | 1. Use `const` constructors<br>2. Implement `shouldRebuild` in custom widgets<br>3. Use `ListView.builder()` for large lists<br>4. Optimize image loading |
| **Tools** | Flutter Inspector, Performance Overlay |
| **Target** | 60 FPS (16ms per frame) |

---

## 📱 Device & Emulator Issues

### Error: "No devices found"

| **Device Code** | **FLT-DEV-001** |
|----------------|----------------|
| **Symptoms** | `flutter devices` returns empty list |
| **Common Causes** | USB debugging disabled, driver issues |
| **Solutions** | **Android:**<br>1. Enable Developer Options<br>2. Enable USB Debugging<br>3. Install ADB drivers<br>4. Try different USB cable/port<br><br>**iOS:**<br>1. Trust computer<br>2. Enable Developer Mode<br>3. Restart devices |
| **Verification** | Device appears in `flutter devices` |

### Error: "Emulator won't start"

| **Device Code** | **FLT-DEV-002** |
|----------------|----------------|
| **Symptoms** | Android emulator fails to boot |
| **Common Causes** | Insufficient RAM, HAXM issues, virtualization disabled |
| **Solutions** | 1. Enable virtualization in BIOS<br>2. Install Intel HAXM<br>3. Allocate more RAM to emulator<br>4. Use ARM64 image if x86 fails |
| **Alternative** | Use physical device for testing |

---

## 🆘 Emergency Quick Fixes

### 🚨 **When everything breaks:**

```bash
# Nuclear option - reset everything
flutter clean
flutter packages get
cd android && ./gradlew clean && cd ..
cd ios && pod clean && pod install && cd ..
flutter run
```

### 🚨 **IDE acting weird:**

```bash
# Invalidate caches
# Android Studio: File → Invalidate Caches and Restart
# VS Code: Reload window (Ctrl+Shift+P → "Reload Window")
```

### 🚨 **Can't build anything:**

```bash
# Update everything
flutter upgrade
flutter doctor
# Fix any issues shown by doctor
```

---

## 📞 Getting Help

### 🔍 **Before asking for help:**
1. ✅ Check this troubleshooting matrix
2. ✅ Run `flutter doctor` dan resolve issues
3. ✅ Try `flutter clean` dan rebuild
4. ✅ Search error message di Google/StackOverflow
5. ✅ Check official Flutter GitHub issues

### 💬 **Where to get help:**
- [Flutter GitHub Issues](https://github.com/flutter/flutter/issues)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)
- [Flutter Discord](https://discord.gg/flutter)
- [Reddit r/FlutterDev](https://reddit.com/r/FlutterDev)
- [Tutorial Discussions](../../discussions)

---

<div align="center">

### 🛠️ **Keep This Reference Handy!**

Bookmark halaman ini untuk akses cepat saat debugging.

[⬅️ Back to Main Tutorial](../README.md) | [📚 View All Docs](../docs/)

</div>