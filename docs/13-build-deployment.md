# 🚀 Section 13: Build & Deployment

<div align="center">

![Flutter Deployment](https://img.shields.io/badge/Flutter-Build_&_Deployment-blue?style=for-the-badge&logo=flutter)
![Difficulty](https://img.shields.io/badge/Level-Advanced-red?style=for-the-badge)
![Duration](https://img.shields.io/badge/Durasi-3--4_Jam-green?style=for-the-badge)

*Menguasai proses build dan deployment aplikasi Flutter ke berbagai platform dengan optimasi production-ready*

</div>

---

## 🎯 Tujuan Pembelajaran

Setelah menyelesaikan section ini, Anda akan dapat:

- ✅ Memahami proses build Flutter untuk Android dan iOS
- ✅ Mengoptimalkan aplikasi untuk production
- ✅ Mengelola app signing dan certificates
- ✅ Deploy ke Google Play Store dan App Store
- ✅ Menggunakan CI/CD untuk automated deployment
- ✅ Implementasi app versioning dan updates
- ✅ Monitoring dan analytics post-deployment

---

## 📚 Daftar Isi

1. [Build Fundamentals](#build-fundamentals)
2. [Android Build & Deployment](#android-build--deployment)
3. [iOS Build & Deployment](#ios-build--deployment)
4. [Web & Desktop Deployment](#web--desktop-deployment)
5. [Performance Optimization](#performance-optimization)
6. [App Signing & Security](#app-signing--security)
7. [Store Deployment](#store-deployment)
8. [CI/CD Implementation](#cicd-implementation)
9. [Versioning & Updates](#versioning--updates)
10. [Monitoring & Analytics](#monitoring--analytics)
11. [Troubleshooting Deployment](#troubleshooting-deployment)
12. [Best Practices](#best-practices)

---

## 1. Build Fundamentals

### 🏗️ Build Modes

```bash
# Development Build (Debug)
flutter run
flutter build apk --debug
flutter build ios --debug

# Profile Build (Performance Testing)
flutter run --profile
flutter build apk --profile
flutter build ios --profile

# Production Build (Release)
flutter build apk --release
flutter build ios --release
flutter build web --release
```

### 📋 Build Configuration

```yaml
# pubspec.yaml - Version Management
name: my_flutter_app
description: A comprehensive Flutter application
version: 1.2.3+15  # version+buildNumber

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: ">=3.10.0"

# Flutter Configuration
flutter:
  uses-material-design: true

  # Assets
  assets:
    - assets/images/
    - assets/animations/
    - assets/icons/

  # Fonts
  fonts:
    - family: Roboto
      fonts:
        - asset: assets/fonts/Roboto-Regular.ttf
        - asset: assets/fonts/Roboto-Bold.ttf
          weight: 700

# Platform-specific configurations
flutter:
  # Generate localization files
  generate: true
```

### 🔧 Build Scripts

```dart
// scripts/build_runner.dart
import 'dart:io';

void main(List<String> args) async {
  final platform = args.isNotEmpty ? args[0] : 'android';
  final buildMode = args.length > 1 ? args[1] : 'release';

  print('🏗️ Building for $platform in $buildMode mode...');

  // Pre-build steps
  await _runPreBuildSteps();

  // Platform-specific build
  switch (platform.toLowerCase()) {
    case 'android':
      await _buildAndroid(buildMode);
      break;
    case 'ios':
      await _buildIOS(buildMode);
      break;
    case 'web':
      await _buildWeb(buildMode);
      break;
    case 'all':
      await _buildAll(buildMode);
      break;
    default:
      print('❌ Unknown platform: $platform');
      exit(1);
  }

  print('✅ Build completed successfully!');
}

Future<void> _runPreBuildSteps() async {
  print('📋 Running pre-build steps...');

  // Generate code
  await _runCommand('flutter', ['packages', 'pub', 'run', 'build_runner', 'build']);

  // Generate localizations
  await _runCommand('flutter', ['gen-l10n']);

  // Analyze code
  await _runCommand('flutter', ['analyze']);

  // Run tests
  await _runCommand('flutter', ['test']);
}

Future<void> _buildAndroid(String mode) async {
  print('🤖 Building Android $mode...');

  final args = ['build', 'apk', '--$mode'];
  if (mode == 'release') {
    args.addAll(['--shrink', '--obfuscate', '--split-debug-info=build/debug-info']);
  }

  await _runCommand('flutter', args);

  // Also build AAB for Play Store
  if (mode == 'release') {
    await _runCommand('flutter', ['build', 'appbundle', '--release']);
  }
}

Future<void> _buildIOS(String mode) async {
  print('🍎 Building iOS $mode...');

  final args = ['build', 'ios', '--$mode'];
  if (mode == 'release') {
    args.addAll(['--obfuscate', '--split-debug-info=build/debug-info']);
  }

  await _runCommand('flutter', args);
}

Future<void> _buildWeb(String mode) async {
  print('🌐 Building Web $mode...');

  final args = ['build', 'web', '--$mode'];
  if (mode == 'release') {
    args.addAll(['--web-renderer', 'html', '--dart-define=FLUTTER_WEB_USE_SKIA=false']);
  }

  await _runCommand('flutter', args);
}

Future<void> _buildAll(String mode) async {
  await _buildAndroid(mode);
  await _buildIOS(mode);
  await _buildWeb(mode);
}

Future<void> _runCommand(String command, List<String> args) async {
  final process = await Process.start(command, args);

  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);

  final exitCode = await process.exitCode;
  if (exitCode != 0) {
    print('❌ Command failed: $command ${args.join(' ')}');
    exit(exitCode);
  }
}
```

---

## 2. Android Build & Deployment

### 🤖 Android Configuration

```gradle
// android/app/build.gradle
def localProperties = new Properties()
def localPropertiesFile = rootProject.file('local.properties')
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader('UTF-8') { reader ->
        localProperties.load(reader)
    }
}

def flutterRoot = localProperties.getProperty('flutter.sdk')
if (flutterRoot == null) {
    throw new GradleException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")
}

def flutterVersionCode = localProperties.getProperty('flutter.versionCode')
if (flutterVersionCode == null) {
    flutterVersionCode = '1'
}

def flutterVersionName = localProperties.getProperty('flutter.versionName')
if (flutterVersionName == null) {
    flutterVersionName = '1.0'
}

apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
apply from: "$flutterRoot/packages/flutter_tools/gradle/flutter.gradle"

// Signing configuration
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    namespace "com.example.myapp"
    compileSdkVersion flutter.compileSdkVersion
    ndkVersion flutter.ndkVersion

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = '1.8'
    }

    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
    }

    defaultConfig {
        applicationId "com.example.myapp"
        minSdkVersion flutter.minSdkVersion
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName

        // Multidex support
        multiDexEnabled true

        // ProGuard optimization
        proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
    }

    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }

    buildTypes {
        debug {
            applicationIdSuffix ".debug"
            debuggable true
            minifyEnabled false
            shrinkResources false
        }

        profile {
            applicationIdSuffix ".profile"
            debuggable false
            minifyEnabled true
            shrinkResources true
            signingConfig signingConfigs.debug
        }

        release {
            debuggable false
            minifyEnabled true
            shrinkResources true
            signingConfig signingConfigs.release

            // Optimization flags
            zipAlignEnabled true
            crunchPngs true
        }
    }

    // Flavor configurations
    flavorDimensions "environment"
    productFlavors {
        dev {
            dimension "environment"
            applicationIdSuffix ".dev"
            versionNameSuffix "-dev"
            resValue "string", "app_name", "MyApp Dev"
        }
        staging {
            dimension "environment"
            applicationIdSuffix ".staging"
            versionNameSuffix "-staging"
            resValue "string", "app_name", "MyApp Staging"
        }
        prod {
            dimension "environment"
            resValue "string", "app_name", "MyApp"
        }
    }
}

flutter {
    source '../..'
}

dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
    implementation 'androidx.multidex:multidex:2.0.1'
}
```

### 🔐 App Signing Setup

```bash
# Generate keystore
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# Create key.properties file
echo "storePassword=your_store_password" > android/key.properties
echo "keyPassword=your_key_password" >> android/key.properties
echo "keyAlias=upload" >> android/key.properties
echo "storeFile=../../upload-keystore.jks" >> android/key.properties
```

### 📦 Build Commands

```bash
# Debug builds
flutter build apk --debug --flavor dev
flutter build apk --debug --flavor staging

# Profile builds
flutter build apk --profile --flavor staging

# Release builds
flutter build apk --release --flavor prod
flutter build appbundle --release --flavor prod

# Build with optimization
flutter build apk --release --shrink --obfuscate --split-debug-info=build/debug-info

# Build specific ABI
flutter build apk --release --target-platform android-arm64
flutter build apk --release --split-per-abi
```

### 🚀 Android Deployment Script

```bash
#!/bin/bash
# deploy_android.sh

set -e

echo "🤖 Starting Android deployment..."

# Configuration
FLAVOR=${1:-prod}
BUILD_MODE=${2:-release}
DEPLOY_TARGET=${3:-internal}  # internal, alpha, beta, production

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
    exit 1
}

# Pre-deployment checks
echo "📋 Running pre-deployment checks..."

# Check Flutter installation
if ! command -v flutter &> /dev/null; then
    print_error "Flutter is not installed or not in PATH"
fi

# Check for required files
if [ ! -f "android/key.properties" ]; then
    print_error "key.properties file not found"
fi

if [ ! -f "android/app/google-services.json" ]; then
    print_warning "google-services.json not found - Firebase features may not work"
fi

# Version check
echo "📊 Current version info:"
flutter --version
grep "version:" pubspec.yaml

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean
flutter pub get

# Generate code
echo "🔧 Generating code..."
flutter packages pub run build_runner build --delete-conflicting-outputs

# Run tests
echo "🧪 Running tests..."
flutter test

# Analyze code
echo "🔍 Analyzing code..."
flutter analyze --fatal-infos

# Build the app
echo "🏗️ Building $BUILD_MODE app for $FLAVOR flavor..."

if [ "$BUILD_MODE" = "release" ]; then
    # Build AAB for Play Store
    flutter build appbundle --release --flavor $FLAVOR \
        --obfuscate --split-debug-info=build/debug-info \
        --dart-define=FLUTTER_WEB_AUTO_DETECT=true

    # Also build APK for testing
    flutter build apk --release --flavor $FLAVOR \
        --obfuscate --split-debug-info=build/debug-info

    print_status "Release build completed"
    echo "📦 AAB: build/app/outputs/bundle/${FLAVOR}Release/app-${FLAVOR}-release.aab"
    echo "📦 APK: build/app/outputs/flutter-apk/app-${FLAVOR}-release.apk"
else
    flutter build apk --$BUILD_MODE --flavor $FLAVOR
    print_status "$BUILD_MODE build completed"
fi

# Deploy to Play Console (requires fastlane setup)
if [ "$DEPLOY_TARGET" != "none" ] && [ "$BUILD_MODE" = "release" ]; then
    echo "🚀 Deploying to Play Console ($DEPLOY_TARGET track)..."

    if command -v fastlane &> /dev/null; then
        cd android
        fastlane deploy track:$DEPLOY_TARGET
        cd ..
        print_status "Deployment to $DEPLOY_TARGET track completed"
    else
        print_warning "Fastlane not installed - skipping automatic deployment"
        echo "Manual upload required to: https://play.google.com/console"
    fi
fi

# Generate release notes
echo "📝 Generating release notes..."
VERSION=$(grep "version:" pubspec.yaml | cut -d' ' -f2)
echo "# Release Notes - Version $VERSION" > release_notes.md
echo "" >> release_notes.md
echo "## What's New" >> release_notes.md
git log --oneline --since="1 week ago" >> release_notes.md

print_status "Android deployment completed successfully!"
echo "🎉 Ready for distribution!"
```

---

## 3. iOS Build & Deployment

### 🍎 iOS Configuration

```xml
<!-- ios/Runner/Info.plist -->
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>$(DEVELOPMENT_LANGUAGE)</string>

    <key>CFBundleDisplayName</key>
    <string>My Flutter App</string>

    <key>CFBundleExecutable</key>
    <string>$(EXECUTABLE_NAME)</string>

    <key>CFBundleIdentifier</key>
    <string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>

    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>

    <key>CFBundleName</key>
    <string>Runner</string>

    <key>CFBundlePackageType</key>
    <string>APPL</string>

    <key>CFBundleShortVersionString</key>
    <string>$(FLUTTER_BUILD_NAME)</string>

    <key>CFBundleSignature</key>
    <string>????</string>

    <key>CFBundleVersion</key>
    <string>$(FLUTTER_BUILD_NUMBER)</string>

    <key>LSRequiresIPhoneOS</key>
    <true/>

    <key>UILaunchStoryboardName</key>
    <string>LaunchScreen</string>

    <key>UIMainStoryboardFile</key>
    <string>Main</string>

    <key>UISupportedInterfaceOrientations</key>
    <array>
        <string>UIInterfaceOrientationPortrait</string>
        <string>UIInterfaceOrientationLandscapeLeft</string>
        <string>UIInterfaceOrientationLandscapeRight</string>
    </array>

    <key>UISupportedInterfaceOrientations~ipad</key>
    <array>
        <string>UIInterfaceOrientationPortrait</string>
        <string>UIInterfaceOrientationPortraitUpsideDown</string>
        <string>UIInterfaceOrientationLandscapeLeft</string>
        <string>UIInterfaceOrientationLandscapeRight</string>
    </array>

    <key>UIViewControllerBasedStatusBarAppearance</key>
    <false/>

    <!-- App Transport Security -->
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <false/>
        <key>NSAllowsLocalNetworking</key>
        <true/>
    </dict>

    <!-- Permissions -->
    <key>NSCameraUsageDescription</key>
    <string>This app needs camera access to take photos</string>

    <key>NSPhotoLibraryUsageDescription</key>
    <string>This app needs photo library access to select images</string>

    <key>NSLocationWhenInUseUsageDescription</key>
    <string>This app needs location access for location-based features</string>

    <!-- Background modes -->
    <key>UIBackgroundModes</key>
    <array>
        <string>background-fetch</string>
        <string>background-processing</string>
    </array>
</dict>
</plist>
```

### 🔧 Xcode Project Configuration

```ruby
# ios/fastlane/Fastfile
default_platform(:ios)

platform :ios do
  desc "Build and deploy to TestFlight"
  lane :beta do
    # Increment build number
    increment_build_number(xcodeproj: "Runner.xcodeproj")

    # Build the app
    build_app(
      scheme: "Runner",
      export_method: "app-store",
      output_directory: "./build",
      include_bitcode: true,
      include_symbols: true
    )

    # Upload to TestFlight
    upload_to_testflight(
      skip_waiting_for_build_processing: true,
      skip_submission: true
    )

    # Notify team
    slack(
      message: "New iOS beta build uploaded to TestFlight! 🚀",
      success: true
    )
  end

  desc "Deploy to App Store"
  lane :release do
    # Ensure git is clean
    ensure_git_status_clean

    # Increment version
    increment_version_number(xcodeproj: "Runner.xcodeproj")
    increment_build_number(xcodeproj: "Runner.xcodeproj")

    # Build the app
    build_app(
      scheme: "Runner",
      export_method: "app-store",
      output_directory: "./build"
    )

    # Upload to App Store
    upload_to_app_store(
      force: true,
      submit_for_review: false
    )

    # Commit version bump
    commit_version_bump(xcodeproj: "Runner.xcodeproj")
    push_to_git_remote

    # Create git tag
    add_git_tag(tag: get_version_number)
    push_git_tags
  end

  desc "Run tests"
  lane :test do
    run_tests(
      scheme: "Runner",
      device: "iPhone 14"
    )
  end
end
```

### 📱 iOS Build Scripts

```bash
#!/bin/bash
# build_ios.sh

set -e

echo "🍎 Starting iOS build process..."

# Configuration
SCHEME=${1:-Runner}
CONFIGURATION=${2:-Release}
EXPORT_METHOD=${3:-app-store}  # app-store, ad-hoc, development, enterprise

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
    exit 1
}

# Check requirements
echo "📋 Checking requirements..."

if ! command -v xcodebuild &> /dev/null; then
    print_error "Xcode is not installed"
fi

if ! command -v flutter &> /dev/null; then
    print_error "Flutter is not installed"
fi

# Check for required files
if [ ! -f "ios/Runner.xcodeproj/project.pbxproj" ]; then
    print_error "iOS project not found"
fi

# Clean and prepare
echo "🧹 Cleaning workspace..."
flutter clean
flutter pub get
cd ios
xcodebuild clean -workspace Runner.xcworkspace -scheme $SCHEME
cd ..

# Generate Flutter build
echo "🏗️ Building Flutter app..."
flutter build ios --release --no-codesign

# Build iOS app
echo "📱 Building iOS archive..."
cd ios

# Create archive
xcodebuild \
    -workspace Runner.xcworkspace \
    -scheme $SCHEME \
    -configuration $CONFIGURATION \
    -destination generic/platform=iOS \
    -archivePath build/Runner.xcarchive \
    archive

print_status "Archive created successfully"

# Export IPA
echo "📦 Exporting IPA..."

# Create export options plist
cat > ExportOptions.plist << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>method</key>
    <string>$EXPORT_METHOD</string>
    <key>teamID</key>
    <string>YOUR_TEAM_ID</string>
    <key>uploadBitcode</key>
    <true/>
    <key>uploadSymbols</key>
    <true/>
    <key>compileBitcode</key>
    <true/>
</dict>
</plist>
EOF

xcodebuild \
    -exportArchive \
    -archivePath build/Runner.xcarchive \
    -exportPath build \
    -exportOptionsPlist ExportOptions.plist

print_status "IPA exported successfully"

# Upload to TestFlight (if app-store method)
if [ "$EXPORT_METHOD" = "app-store" ]; then
    echo "🚀 Uploading to TestFlight..."

    if command -v xcrun &> /dev/null; then
        xcrun altool \
            --upload-app \
            --type ios \
            --file "build/Runner.ipa" \
            --username "$APPLE_ID" \
            --password "$APP_SPECIFIC_PASSWORD"

        print_status "Upload to TestFlight completed"
    else
        print_warning "xcrun not available - manual upload required"
    fi
fi

cd ..
print_status "iOS build process completed!"
```

---

## 4. Web & Desktop Deployment

### 🌐 Web Deployment

```bash
# Build for web
flutter build web --release --web-renderer html

# Build with custom base href
flutter build web --release --base-href /myapp/

# Build with tree shaking
flutter build web --release --tree-shake-icons

# Build with specific target
flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=false
```

### 🌐 Web Deployment Configuration

```yaml
# web/index.html optimization
<!DOCTYPE html>
<html>
<head>
  <base href="$FLUTTER_BASE_HREF">

  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="description" content="A comprehensive Flutter web application">
  <meta name="keywords" content="flutter,web,app">
  <meta name="author" content="Your Name">

  <!-- iOS meta tags & icons -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="My Flutter App">

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="favicon.png"/>
  <link rel="apple-touch-icon" href="icons/Icon-192.png">

  <!-- Manifest -->
  <link rel="manifest" href="manifest.json">

  <!-- PWA -->
  <script>
    if ('serviceWorker' in navigator) {
      window.addEventListener('flutter-first-frame', function () {
        navigator.serviceWorker.register('flutter_service_worker.js');
      });
    }
  </script>

  <title>My Flutter App</title>
</head>
<body>
  <!-- Loading indicator -->
  <div id="loading">
    <div class="spinner"></div>
    <p>Loading...</p>
  </div>

  <script>
    window.addEventListener('load', function(ev) {
      // Download main.dart.js
      _flutter.loader.loadEntrypoint({
        serviceWorker: {
          serviceWorkerVersion: serviceWorkerVersion,
        }
      }).then(function(engineInitializer) {
        return engineInitializer.initializeEngine();
      }).then(function(appRunner) {
        // Hide loading indicator
        document.getElementById('loading').style.display = 'none';
        return appRunner.runApp();
      });
    });
  </script>
</body>
</html>
```

### 💻 Desktop Deployment

```bash
# Windows
flutter build windows --release

# macOS
flutter build macos --release

# Linux
flutter build linux --release

# Build with custom target
flutter build windows --release --dart-define=ENVIRONMENT=production
```

### 🚀 Web Deployment Script

```bash
#!/bin/bash
# deploy_web.sh

set -e

echo "🌐 Starting web deployment..."

# Configuration
DEPLOY_TARGET=${1:-staging}  # staging, production
BUILD_MODE=${2:-release}

# Build the web app
echo "🏗️ Building web app..."
flutter build web \
    --$BUILD_MODE \
    --web-renderer html \
    --dart-define=FLUTTER_WEB_AUTO_DETECT=true \
    --tree-shake-icons

# Optimize build
echo "⚡ Optimizing build..."

cd build/web

# Compress assets
if command -v gzip &> /dev/null; then
    find . -type f \( -name "*.js" -o -name "*.css" -o -name "*.html" \) -exec gzip -9 -k {} \;
    echo "✅ Assets compressed"
fi

# Generate sitemap
cat > sitemap.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <url>
        <loc>https://myapp.com/</loc>
        <lastmod>$(date +%Y-%m-%d)</lastmod>
        <changefreq>weekly</changefreq>
        <priority>1.0</priority>
    </url>
</urlset>
EOF

# Generate robots.txt
cat > robots.txt << EOF
User-agent: *
Allow: /
Sitemap: https://myapp.com/sitemap.xml
EOF

cd ../..

# Deploy based on target
case $DEPLOY_TARGET in
    "staging")
        echo "🚀 Deploying to staging..."
        # Deploy to staging server (example with Firebase)
        if command -v firebase &> /dev/null; then
            firebase deploy --only hosting:staging
        fi
        ;;
    "production")
        echo "🚀 Deploying to production..."
        # Deploy to production server
        if command -v firebase &> /dev/null; then
            firebase deploy --only hosting
        fi
        ;;
    "github")
        echo "🚀 Deploying to GitHub Pages..."
        # Deploy to GitHub Pages
        if [ -d ".git" ]; then
            git subtree push --prefix build/web origin gh-pages
        fi
        ;;
    *)
        echo "❌ Unknown deploy target: $DEPLOY_TARGET"
        exit 1
        ;;
esac

echo "✅ Web deployment completed!"
```

---

## 5. Performance Optimization

### ⚡ Build Optimization

```yaml
# flutter_build_config.yaml
targets:
  $default:
    builders:
      # Enable tree shaking
      flutter_tools|dill:
        options:
          tree-shake: true

      # Minify code
      flutter_tools|kernel_snapshot:
        options:
          minify: true

      # Optimize images
      flutter_tools|assets:
        options:
          compress: true
```

### 📊 Performance Analysis

```bash
# Analyze app size
flutter build apk --analyze-size
flutter build ios --analyze-size
flutter build web --analyze-size

# Profile app performance
flutter run --profile --trace-startup

# Memory profiling
flutter run --profile --enable-impeller

# Performance metrics
flutter drive --profile test_driver/perf_test.dart
```

### 🎯 Code Optimization

```dart
// lib/utils/performance_utils.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class PerformanceUtils {
  // Preload critical assets
  static Future<void> preloadAssets() async {
    final futures = <Future>[];

    // Preload images
    const criticalImages = [
      'assets/images/logo.png',
      'assets/images/placeholder.png',
    ];

    for (final imagePath in criticalImages) {
      futures.add(rootBundle.load(imagePath));
    }

    // Preload fonts
    futures.add(rootBundle.load('assets/fonts/Roboto-Regular.ttf'));

    await Future.wait(futures);
    debugPrint('✅ Critical assets preloaded');
  }

  // Optimize widget rebuilds
  static bool shouldRebuild(Widget oldWidget, Widget newWidget) {
    return oldWidget.runtimeType != newWidget.runtimeType;
  }

  // Memory cleanup
  static void cleanup() {
    // Clear image cache if needed
    imageCache.clear();
    imageCache.clearLiveImages();

    // Force garbage collection in debug mode
    if (kDebugMode) {
      SystemChannels.system.invokeMethod('System.requestGC');
    }
  }

  // Performance monitoring
  static void measurePerformance(String operation, Function() function) {
    final stopwatch = Stopwatch()..start();
    function();
    stopwatch.stop();

    debugPrint('⏱️ $operation took ${stopwatch.elapsedMilliseconds}ms');
  }

  // Bundle size analysis
  static Future<void> analyzeBundleSize() async {
    if (kDebugMode) {
      final binding = WidgetsFlutterBinding.ensureInitialized();
      final renderView = binding.renderView;

      debugPrint('📊 Performance metrics:');
      debugPrint('  Screen size: ${renderView.size}');
      debugPrint('  Device pixel ratio: ${renderView.devicePixelRatio}');
      debugPrint('  Memory usage: ${await _getMemoryUsage()}MB');
    }
  }

  static Future<double> _getMemoryUsage() async {
    if (kDebugMode) {
      final info = await MemoryInfo.fromPlatform();
      return info.totalPhysicalMemory / (1024 * 1024); // Convert to MB
    }
    return 0.0;
  }
}

// Custom performance widget
class PerformanceOptimizedWidget extends StatelessWidget {
  final Widget child;
  final String? debugLabel;

  const PerformanceOptimizedWidget({
    Key? key,
    required this.child,
    this.debugLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode && debugLabel != null) {
      return RepaintBoundary(
        child: child,
      );
    }
    return child;
  }
}

// Memory info helper
class MemoryInfo {
  final int totalPhysicalMemory;
  final int availableMemory;

  MemoryInfo({
    required this.totalPhysicalMemory,
    required this.availableMemory,
  });

  static Future<MemoryInfo> fromPlatform() async {
    // Platform-specific memory info implementation
    return MemoryInfo(
      totalPhysicalMemory: 0,
      availableMemory: 0,
    );
  }
}
```

---

## 6. App Signing & Security

### 🔐 Android Signing

```bash
# Generate upload keystore
keytool -genkey -v -keystore ~/upload-keystore.jks \
    -keyalg RSA -keysize 2048 -validity 10000 \
    -alias upload \
    -storepass your_keystore_password \
    -keypass your_key_password

# Sign APK manually
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
    -keystore ~/upload-keystore.jks \
    app-release-unsigned.apk upload

# Verify signature
jarsigner -verify -verbose -certs app-release.apk
```

### 🍎 iOS Signing

```bash
# Install certificates
security import certificate.p12 -k ~/Library/Keychains/login.keychain -P password

# List available identities
security find-identity -v -p codesigning

# Sign app manually
codesign --force --verify --verbose --sign "iPhone Distribution: Your Name" Runner.app
```

### 🛡️ Security Configuration

```dart
// lib/config/security_config.dart
class SecurityConfig {
  // API security
  static const String apiBaseUrl = kDebugMode
      ? 'https://api-dev.myapp.com'
      : 'https://api.myapp.com';

  // Certificate pinning
  static const List<String> pinnedCertificates = [
    'sha256/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=',
    'sha256/BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB=',
  ];

  // Encryption keys (should be stored securely)
  static String get encryptionKey {
    // In production, use secure storage or key derivation
    return kDebugMode ? 'debug_key_32_chars_long_string' : _getProductionKey();
  }

  static String _getProductionKey() {
    // Implement secure key retrieval
    return 'production_key_from_secure_storage';
  }

  // Security headers
  static Map<String, String> get securityHeaders => {
    'X-API-Version': '1.0',
    'X-Client-Platform': Platform.operatingSystem,
    'X-Client-Version': _getAppVersion(),
    'X-Request-ID': _generateRequestId(),
  };

  static String _getAppVersion() {
    // Get app version from package info
    return '1.0.0';
  }

  static String _generateRequestId() {
    return Uuid().v4();
  }

  // Root detection
  static Future<bool> isDeviceSecure() async {
    // Implement root/jailbreak detection
    if (Platform.isAndroid) {
      return await _checkAndroidSecurity();
    } else if (Platform.isIOS) {
      return await _checkIOSSecurity();
    }
    return true;
  }

  static Future<bool> _checkAndroidSecurity() async {
    // Check for root indicators
    const rootPaths = [
      '/system/app/Superuser.apk',
      '/sbin/su',
      '/system/bin/su',
      '/system/xbin/su',
      '/data/local/xbin/su',
      '/data/local/bin/su',
      '/system/sd/xbin/su',
      '/system/bin/failsafe/su',
      '/data/local/su',
    ];

    for (final path in rootPaths) {
      if (await File(path).exists()) {
        return false;
      }
    }

    return true;
  }

  static Future<bool> _checkIOSSecurity() async {
    // Check for jailbreak indicators
    const jailbreakPaths = [
      '/Applications/Cydia.app',
      '/Library/MobileSubstrate/MobileSubstrate.dylib',
      '/bin/bash',
      '/usr/sbin/sshd',
      '/etc/apt',
    ];

    for (final path in jailbreakPaths) {
      if (await File(path).exists()) {
        return false;
      }
    }

    return true;
  }
}
```

---

Saya telah membuat bagian pertama dari Section 13: Build & Deployment. Apakah Anda ingin saya melanjutkan dengan bagian selanjutnya (Store Deployment, CI/CD, dll) atau ada yang ingin ditanyakan tentang bagian yang sudah dibuat?