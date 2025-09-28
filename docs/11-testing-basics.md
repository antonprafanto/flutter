# 🧪 Section 11: Testing & Debugging

<div align="center">

![Flutter Testing](https://img.shields.io/badge/Flutter-Testing_&_Debugging-blue?style=for-the-badge&logo=flutter)
![Difficulty](https://img.shields.io/badge/Level-Advanced-red?style=for-the-badge)
![Duration](https://img.shields.io/badge/Durasi-4--5_Jam-green?style=for-the-badge)

*Membangun aplikasi Flutter yang reliable dengan testing comprehensive dan debugging yang efektif*

</div>

---

## 🎯 Tujuan Pembelajaran

Setelah menyelesaikan section ini, Anda akan dapat:

- ✅ Memahami konsep testing (Unit, Widget, Integration)
- ✅ Menulis unit tests untuk business logic
- ✅ Membuat widget tests untuk UI components
- ✅ Implementasi integration tests untuk user flows
- ✅ Menggunakan debugging tools Flutter
- ✅ Melakukan performance testing dan optimization
- ✅ Setup CI/CD untuk automated testing

---

## 📚 Daftar Isi

1. [Konsep Dasar Testing](#konsep-dasar-testing)
2. [Setup Testing Environment](#setup-testing-environment)
3. [Unit Testing](#unit-testing)
4. [Widget Testing](#widget-testing)
5. [Integration Testing](#integration-testing)
6. [Mocking & Test Doubles](#mocking--test-doubles)
7. [Testing State Management](#testing-state-management)
8. [Testing API Calls](#testing-api-calls)
9. [Debugging Tools & Techniques](#debugging-tools--techniques)
10. [Performance Testing](#performance-testing)
11. [Test Coverage & Reporting](#test-coverage--reporting)
12. [CI/CD Integration](#cicd-integration)
13. [Best Practices](#best-practices)
14. [Troubleshooting](#troubleshooting)

---

## 1. Konsep Dasar Testing

### 🏗️ Testing Pyramid

```dart
/*
Testing Pyramid for Flutter:

        /\
       /  \
      /    \  Integration Tests (E2E)
     /      \  - Full app flows
    /________\  - Real device/simulator
   /          \
  /            \
 /              \ Widget Tests
/                \ - UI component testing
\                / - Widget interaction
 \              /
  \____________/
 /              \
/                \
\________________/ Unit Tests
                   - Business logic
                   - Functions & methods
                   - Models & services

Ratio: 70% Unit : 20% Widget : 10% Integration
*/
```

### 🎯 Test Types Overview

```dart
// 1. Unit Tests - Test individual functions/methods
test('should calculate total price correctly', () {
  final cart = ShoppingCart();
  cart.addItem(Product(name: 'Test', price: 10.0), quantity: 2);

  expect(cart.totalPrice, equals(20.0));
});

// 2. Widget Tests - Test UI components
testWidgets('should display product name', (WidgetTester tester) async {
  await tester.pumpWidget(ProductCard(product: testProduct));

  expect(find.text('Test Product'), findsOneWidget);
});

// 3. Integration Tests - Test complete user flows
testWidgets('should complete checkout flow', (WidgetTester tester) async {
  await tester.pumpWidget(MyApp());

  // Navigate to cart
  await tester.tap(find.byIcon(Icons.shopping_cart));
  await tester.pumpAndSettle();

  // Proceed to checkout
  await tester.tap(find.text('Checkout'));
  await tester.pumpAndSettle();

  // Verify checkout page
  expect(find.text('Checkout'), findsOneWidget);
});
```

### 📋 Testing Checklist

```dart
/*
Testing Checklist for Flutter Apps:

✅ Unit Tests:
   - Business logic functions
   - Model validation
   - Utility functions
   - Service methods
   - State management logic

✅ Widget Tests:
   - UI component rendering
   - User interactions
   - State changes
   - Navigation
   - Form validation

✅ Integration Tests:
   - Complete user journeys
   - API integration
   - Database operations
   - Navigation flows
   - Error scenarios

✅ Performance Tests:
   - Memory usage
   - CPU performance
   - Network efficiency
   - Battery consumption
   - App startup time
*/
```

---

## 2. Setup Testing Environment

### 📦 Dependencies

```yaml
# pubspec.yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
    sdk: flutter
  mockito: ^5.4.2          # Mocking library
  build_runner: ^2.4.7     # Code generation
  mocktail: ^1.0.1         # Alternative mocking
  flutter_driver:          # Integration testing
    sdk: flutter
  test: ^1.24.6            # Dart testing framework
  fake_async: ^1.3.1       # Async testing utilities
  clock: ^1.1.1            # Time manipulation for tests
  http_mock_adapter: ^0.4.4 # HTTP mocking
  shared_preferences_test: ^2.2.2 # SharedPreferences testing
  sqflite_common_ffi: ^2.3.0 # SQLite testing
```

### 🔧 Test Configuration

```dart
// test/test_config.dart
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class TestConfig {
  static Future<void> initialize() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Setup SharedPreferences for testing
    SharedPreferences.setMockInitialValues({});

    // Setup SQLite for testing
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    // Setup platform channels
    _setupPlatformChannels();
  }

  static void _setupPlatformChannels() {
    const channel = MethodChannel('flutter/platform');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'SystemChrome.setPreferredOrientations':
          return null;
        case 'SystemNavigator.pop':
          return null;
        default:
          return null;
      }
    });
  }

  static void reset() {
    // Reset shared preferences
    SharedPreferences.setMockInitialValues({});

    // Reset any global state
    TestConfig.resetGlobalState();
  }

  static void resetGlobalState() {
    // Reset singletons, global variables, etc.
    // This is app-specific
  }
}

// Helper function for widget testing
Widget createTestableWidget(Widget child) {
  return MaterialApp(
    home: Scaffold(body: child),
    navigatorObservers: [TestNavigatorObserver()],
  );
}

class TestNavigatorObserver extends NavigatorObserver {
  List<Route<dynamic>> routes = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routes.add(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routes.remove(route);
  }
}
```

### 🎯 Test Data Factory

```dart
// test/factories/test_data_factory.dart
class TestDataFactory {
  static User createUser({
    int? id,
    String? name,
    String? email,
    String? phone,
  }) {
    return User(
      id: id ?? 1,
      name: name ?? 'John Doe',
      email: email ?? 'john@example.com',
      phone: phone ?? '+1234567890',
      address: createAddress(),
      company: createCompany(),
    );
  }

  static Address createAddress({
    String? street,
    String? city,
    String? zipcode,
  }) {
    return Address(
      street: street ?? '123 Main St',
      suite: 'Apt 1',
      city: city ?? 'Anytown',
      zipcode: zipcode ?? '12345',
      geo: Geo(lat: '40.7128', lng: '-74.0060'),
    );
  }

  static Company createCompany({
    String? name,
    String? catchPhrase,
  }) {
    return Company(
      name: name ?? 'Test Company',
      catchPhrase: catchPhrase ?? 'Test catchphrase',
      bs: 'Test business',
    );
  }

  static Post createPost({
    int? id,
    int? userId,
    String? title,
    String? body,
  }) {
    return Post(
      id: id ?? 1,
      userId: userId ?? 1,
      title: title ?? 'Test Post Title',
      body: body ?? 'This is a test post body.',
    );
  }

  static List<Post> createPosts(int count) {
    return List.generate(
      count,
      (index) => createPost(
        id: index + 1,
        title: 'Post ${index + 1}',
        body: 'Body for post ${index + 1}',
      ),
    );
  }

  static Comment createComment({
    int? id,
    int? postId,
    String? name,
    String? email,
    String? body,
  }) {
    return Comment(
      id: id ?? 1,
      postId: postId ?? 1,
      name: name ?? 'John Commenter',
      email: email ?? 'commenter@example.com',
      body: body ?? 'This is a test comment.',
    );
  }

  static ApiResponse<T> createApiResponse<T>({
    bool? success,
    String? message,
    T? data,
    List<String>? errors,
  }) {
    return ApiResponse<T>(
      success: success ?? true,
      message: message ?? 'Success',
      data: data,
      errors: errors,
    );
  }

  // Helper for creating test widgets with common setup
  static Widget createTestApp({
    required Widget child,
    List<NavigatorObserver>? navigatorObservers,
    ThemeData? theme,
  }) {
    return MaterialApp(
      theme: theme ?? ThemeData.light(),
      navigatorObservers: navigatorObservers ?? [],
      home: Scaffold(body: child),
    );
  }
}
```

---

## 3. Unit Testing

### 🧮 Testing Business Logic

```dart
// test/models/shopping_cart_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/models/shopping_cart.dart';
import 'package:my_app/models/product.dart';

void main() {
  group('ShoppingCart', () {
    late ShoppingCart cart;
    late Product testProduct;

    setUp(() {
      cart = ShoppingCart();
      testProduct = TestDataFactory.createProduct(
        id: '1',
        name: 'Test Product',
        price: 10.0,
      );
    });

    tearDown(() {
      cart.clear();
    });

    group('addItem', () {
      test('should add item to cart', () {
        // Act
        cart.addItem(testProduct, quantity: 2);

        // Assert
        expect(cart.items.length, equals(1));
        expect(cart.items.first.product, equals(testProduct));
        expect(cart.items.first.quantity, equals(2));
      });

      test('should increase quantity if item already exists', () {
        // Arrange
        cart.addItem(testProduct, quantity: 1);

        // Act
        cart.addItem(testProduct, quantity: 2);

        // Assert
        expect(cart.items.length, equals(1));
        expect(cart.items.first.quantity, equals(3));
      });

      test('should throw exception for invalid quantity', () {
        // Act & Assert
        expect(
          () => cart.addItem(testProduct, quantity: 0),
          throwsA(isA<ArgumentError>()),
        );

        expect(
          () => cart.addItem(testProduct, quantity: -1),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    group('removeItem', () {
      test('should remove item from cart', () {
        // Arrange
        cart.addItem(testProduct, quantity: 2);

        // Act
        cart.removeItem(testProduct.id);

        // Assert
        expect(cart.items.isEmpty, isTrue);
      });

      test('should do nothing if item not found', () {
        // Arrange
        cart.addItem(testProduct, quantity: 1);

        // Act
        cart.removeItem('non-existent');

        // Assert
        expect(cart.items.length, equals(1));
      });
    });

    group('updateQuantity', () {
      test('should update item quantity', () {
        // Arrange
        cart.addItem(testProduct, quantity: 1);

        // Act
        cart.updateQuantity(testProduct.id, 5);

        // Assert
        expect(cart.items.first.quantity, equals(5));
      });

      test('should remove item if quantity is 0', () {
        // Arrange
        cart.addItem(testProduct, quantity: 2);

        // Act
        cart.updateQuantity(testProduct.id, 0);

        // Assert
        expect(cart.items.isEmpty, isTrue);
      });

      test('should throw exception for negative quantity', () {
        // Arrange
        cart.addItem(testProduct, quantity: 1);

        // Act & Assert
        expect(
          () => cart.updateQuantity(testProduct.id, -1),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    group('calculations', () {
      test('should calculate total price correctly', () {
        // Arrange
        final product1 = TestDataFactory.createProduct(price: 10.0);
        final product2 = TestDataFactory.createProduct(price: 15.0);

        cart.addItem(product1, quantity: 2);
        cart.addItem(product2, quantity: 1);

        // Act
        final total = cart.totalPrice;

        // Assert
        expect(total, equals(35.0));
      });

      test('should calculate total items correctly', () {
        // Arrange
        final product1 = TestDataFactory.createProduct(id: '1');
        final product2 = TestDataFactory.createProduct(id: '2');

        cart.addItem(product1, quantity: 3);
        cart.addItem(product2, quantity: 2);

        // Act
        final totalItems = cart.totalItems;

        // Assert
        expect(totalItems, equals(5));
      });

      test('should return 0 for empty cart', () {
        // Assert
        expect(cart.totalPrice, equals(0.0));
        expect(cart.totalItems, equals(0));
        expect(cart.isEmpty, isTrue);
      });
    });

    group('clear', () {
      test('should clear all items', () {
        // Arrange
        cart.addItem(testProduct, quantity: 5);

        // Act
        cart.clear();

        // Assert
        expect(cart.items.isEmpty, isTrue);
        expect(cart.totalPrice, equals(0.0));
        expect(cart.totalItems, equals(0));
      });
    });
  });
}
```

### 🔧 Testing Utility Functions

```dart
// test/utils/validation_utils_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/utils/validation_utils.dart';

void main() {
  group('ValidationUtils', () {
    group('isValidEmail', () {
      test('should return true for valid emails', () {
        final validEmails = [
          'test@example.com',
          'user.name@domain.co.uk',
          'user+tag@example.org',
          'user123@test-domain.com',
        ];

        for (final email in validEmails) {
          expect(
            ValidationUtils.isValidEmail(email),
            isTrue,
            reason: '$email should be valid',
          );
        }
      });

      test('should return false for invalid emails', () {
        final invalidEmails = [
          '',
          'invalid',
          '@example.com',
          'test@',
          'test..test@example.com',
          'test@example',
          'test@.com',
        ];

        for (final email in invalidEmails) {
          expect(
            ValidationUtils.isValidEmail(email),
            isFalse,
            reason: '$email should be invalid',
          );
        }
      });
    });

    group('isValidPhone', () {
      test('should return true for valid phone numbers', () {
        final validPhones = [
          '+1234567890',
          '+44 20 7946 0958',
          '(555) 123-4567',
          '555-123-4567',
          '5551234567',
        ];

        for (final phone in validPhones) {
          expect(
            ValidationUtils.isValidPhone(phone),
            isTrue,
            reason: '$phone should be valid',
          );
        }
      });

      test('should return false for invalid phone numbers', () {
        final invalidPhones = [
          '',
          '123',
          'abc-def-ghij',
          '+',
          '123-456-78901',
        ];

        for (final phone in invalidPhones) {
          expect(
            ValidationUtils.isValidPhone(phone),
            isFalse,
            reason: '$phone should be invalid',
          );
        }
      });
    });

    group('formatCurrency', () {
      test('should format currency correctly', () {
        expect(ValidationUtils.formatCurrency(10.0), equals('\$10.00'));
        expect(ValidationUtils.formatCurrency(1234.56), equals('\$1,234.56'));
        expect(ValidationUtils.formatCurrency(0), equals('\$0.00'));
      });

      test('should handle negative values', () {
        expect(ValidationUtils.formatCurrency(-10.0), equals('-\$10.00'));
      });

      test('should handle custom currency symbol', () {
        expect(
          ValidationUtils.formatCurrency(100.0, symbol: '€'),
          equals('€100.00'),
        );
      });
    });

    group('truncateText', () {
      test('should truncate long text', () {
        const longText = 'This is a very long text that should be truncated';
        final result = ValidationUtils.truncateText(longText, maxLength: 20);

        expect(result, equals('This is a very lo...'));
        expect(result.length, equals(23)); // 20 + 3 dots
      });

      test('should not truncate short text', () {
        const shortText = 'Short text';
        final result = ValidationUtils.truncateText(shortText, maxLength: 20);

        expect(result, equals(shortText));
      });

      test('should handle empty text', () {
        final result = ValidationUtils.truncateText('', maxLength: 10);
        expect(result, equals(''));
      });
    });
  });
}
```

### 📅 Testing Async Functions

```dart
// test/services/user_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/services/user_service.dart';
import 'package:my_app/models/user.dart';

// Generate mocks
import 'user_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('UserService', () {
    late MockClient mockClient;
    late UserService userService;

    setUp(() {
      mockClient = MockClient();
      userService = UserService(client: mockClient);
    });

    group('getUsers', () {
      test('should return list of users when successful', () async {
        // Arrange
        const responseBody = '''
        [
          {
            "id": 1,
            "name": "John Doe",
            "email": "john@example.com",
            "phone": "123-456-7890",
            "address": {
              "street": "123 Main St",
              "city": "Anytown",
              "zipcode": "12345",
              "geo": {"lat": "40.7128", "lng": "-74.0060"}
            },
            "company": {
              "name": "Test Company",
              "catchPhrase": "Test phrase",
              "bs": "Test business"
            }
          }
        ]
        ''';

        when(mockClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response(responseBody, 200));

        // Act
        final users = await userService.getUsers();

        // Assert
        expect(users, isA<List<User>>());
        expect(users.length, equals(1));
        expect(users.first.name, equals('John Doe'));
        expect(users.first.email, equals('john@example.com'));

        verify(mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users'),
          headers: {'Content-Type': 'application/json'},
        )).called(1);
      });

      test('should throw exception when response is not 200', () async {
        // Arrange
        when(mockClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response('Not Found', 404));

        // Act & Assert
        expect(
          () => userService.getUsers(),
          throwsA(isA<Exception>()),
        );
      });

      test('should throw exception when network error occurs', () async {
        // Arrange
        when(mockClient.get(any, headers: anyNamed('headers')))
            .thenThrow(const SocketException('No internet connection'));

        // Act & Assert
        expect(
          () => userService.getUsers(),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('createUser', () {
      test('should create user successfully', () async {
        // Arrange
        final user = TestDataFactory.createUser();
        const responseBody = '''
        {
          "id": 11,
          "name": "John Doe",
          "email": "john@example.com",
          "phone": "123-456-7890"
        }
        ''';

        when(mockClient.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        )).thenAnswer((_) async => http.Response(responseBody, 201));

        // Act
        final createdUser = await userService.createUser(user);

        // Assert
        expect(createdUser, isA<User>());
        expect(createdUser.id, equals(11));
        expect(createdUser.name, equals('John Doe'));

        verify(mockClient.post(
          Uri.parse('https://jsonplaceholder.typicode.com/users'),
          headers: {'Content-Type': 'application/json'},
          body: anyNamed('body'),
        )).called(1);
      });
    });

    group('timeout handling', () {
      test('should handle timeout correctly', () async {
        // Arrange
        when(mockClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) => Future.delayed(
                  Duration(seconds: 10),
                  () => http.Response('OK', 200),
                ));

        // Act & Assert
        expect(
          () => userService.getUsers().timeout(Duration(seconds: 1)),
          throwsA(isA<TimeoutException>()),
        );
      });
    });
  });
}
```

---

## 4. Widget Testing

### 🎨 Testing UI Components

```dart
// test/widgets/product_card_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/widgets/product_card.dart';
import 'package:my_app/models/product.dart';

void main() {
  group('ProductCard', () {
    late Product testProduct;

    setUp(() {
      testProduct = TestDataFactory.createProduct(
        id: '1',
        name: 'Test Product',
        price: 29.99,
        imageUrl: 'https://example.com/image.jpg',
        description: 'Test product description',
      );
    });

    testWidgets('should display product information', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: ProductCard(product: testProduct),
      ));

      // Assert
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('\$29.99'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should handle tap events', (WidgetTester tester) async {
      // Arrange
      bool tapped = false;
      void onTap() => tapped = true;

      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: ProductCard(
          product: testProduct,
          onTap: onTap,
        ),
      ));

      // Act
      await tester.tap(find.byType(ProductCard));
      await tester.pump();

      // Assert
      expect(tapped, isTrue);
    });

    testWidgets('should show favorite indicator when favorite', (WidgetTester tester) async {
      // Arrange
      final favoriteProduct = testProduct.copyWith(isFavorite: true);

      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: ProductCard(product: favoriteProduct),
      ));

      // Assert
      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsNothing);
    });

    testWidgets('should show unfavorite indicator when not favorite', (WidgetTester tester) async {
      // Arrange
      final unfavoriteProduct = testProduct.copyWith(isFavorite: false);

      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: ProductCard(product: unfavoriteProduct),
      ));

      // Assert
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });

    testWidgets('should handle favorite toggle', (WidgetTester tester) async {
      // Arrange
      bool favoriteToggled = false;
      void onFavoriteToggle() => favoriteToggled = true;

      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: ProductCard(
          product: testProduct,
          onFavoriteToggle: onFavoriteToggle,
        ),
      ));

      // Act
      await tester.tap(find.byIcon(Icons.favorite_border));
      await tester.pump();

      // Assert
      expect(favoriteToggled, isTrue);
    });

    testWidgets('should show discount badge when product has discount', (WidgetTester tester) async {
      // Arrange
      final discountProduct = testProduct.copyWith(
        originalPrice: 39.99,
        discountPercentage: 25,
      );

      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: ProductCard(product: discountProduct),
      ));

      // Assert
      expect(find.text('25% OFF'), findsOneWidget);
      expect(find.text('\$39.99'), findsOneWidget); // Original price
    });

    testWidgets('should handle loading state for image', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: ProductCard(product: testProduct),
      ));

      // Act - Wait for image to start loading
      await tester.pump();

      // Assert - Should show placeholder while loading
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    group('accessibility', () {
      testWidgets('should have proper semantic labels', (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(TestDataFactory.createTestApp(
          child: ProductCard(product: testProduct),
        ));

        // Assert
        expect(
          find.bySemanticsLabel('Product: Test Product, Price: \$29.99'),
          findsOneWidget,
        );
      });

      testWidgets('should be accessible via keyboard', (WidgetTester tester) async {
        // Arrange
        bool tapped = false;
        await tester.pumpWidget(TestDataFactory.createTestApp(
          child: ProductCard(
            product: testProduct,
            onTap: () => tapped = true,
          ),
        ));

        // Act
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pump();

        // Assert
        expect(tapped, isTrue);
      });
    });
  });
}
```

### 📋 Testing Forms

```dart
// test/widgets/user_form_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/widgets/user_form.dart';
import 'package:my_app/models/user.dart';

void main() {
  group('UserForm', () {
    testWidgets('should display all form fields', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: UserForm(),
      ));

      // Assert
      expect(find.byKey(Key('name_field')), findsOneWidget);
      expect(find.byKey(Key('email_field')), findsOneWidget);
      expect(find.byKey(Key('phone_field')), findsOneWidget);
      expect(find.byKey(Key('submit_button')), findsOneWidget);
    });

    testWidgets('should validate required fields', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: UserForm(),
      ));

      // Act - Try to submit empty form
      await tester.tap(find.byKey(Key('submit_button')));
      await tester.pump();

      // Assert
      expect(find.text('Name is required'), findsOneWidget);
      expect(find.text('Email is required'), findsOneWidget);
    });

    testWidgets('should validate email format', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: UserForm(),
      ));

      // Act
      await tester.enterText(find.byKey(Key('email_field')), 'invalid-email');
      await tester.tap(find.byKey(Key('submit_button')));
      await tester.pump();

      // Assert
      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('should submit form with valid data', (WidgetTester tester) async {
      // Arrange
      User? submittedUser;
      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: UserForm(
          onSubmit: (user) => submittedUser = user,
        ),
      ));

      // Act
      await tester.enterText(find.byKey(Key('name_field')), 'John Doe');
      await tester.enterText(find.byKey(Key('email_field')), 'john@example.com');
      await tester.enterText(find.byKey(Key('phone_field')), '123-456-7890');
      await tester.tap(find.byKey(Key('submit_button')));
      await tester.pump();

      // Assert
      expect(submittedUser, isNotNull);
      expect(submittedUser!.name, equals('John Doe'));
      expect(submittedUser!.email, equals('john@example.com'));
      expect(submittedUser!.phone, equals('123-456-7890'));
    });

    testWidgets('should pre-populate form when editing user', (WidgetTester tester) async {
      // Arrange
      final existingUser = TestDataFactory.createUser(
        name: 'Jane Doe',
        email: 'jane@example.com',
        phone: '987-654-3210',
      );

      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: UserForm(user: existingUser),
      ));

      // Assert
      expect(find.text('Jane Doe'), findsOneWidget);
      expect(find.text('jane@example.com'), findsOneWidget);
      expect(find.text('987-654-3210'), findsOneWidget);
    });

    testWidgets('should show loading state during submission', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: UserForm(
          onSubmit: (user) async {
            // Simulate async operation
            await Future.delayed(Duration(seconds: 1));
          },
        ),
      ));

      // Fill form
      await tester.enterText(find.byKey(Key('name_field')), 'John Doe');
      await tester.enterText(find.byKey(Key('email_field')), 'john@example.com');

      // Act
      await tester.tap(find.byKey(Key('submit_button')));
      await tester.pump();

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Submitting...'), findsOneWidget);
    });

    group('field interactions', () {
      testWidgets('should clear field when clear button is tapped', (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(TestDataFactory.createTestApp(
          child: UserForm(),
        ));

        // Act
        await tester.enterText(find.byKey(Key('name_field')), 'Test Name');
        await tester.tap(find.byIcon(Icons.clear));
        await tester.pump();

        // Assert
        expect(find.text('Test Name'), findsNothing);
      });

      testWidgets('should show/hide password field', (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(TestDataFactory.createTestApp(
          child: UserForm(includePassword: true),
        ));

        // Act
        await tester.enterText(find.byKey(Key('password_field')), 'password123');

        // Initially hidden
        expect(find.text('password123'), findsNothing);

        // Show password
        await tester.tap(find.byIcon(Icons.visibility));
        await tester.pump();

        // Assert
        expect(find.text('password123'), findsOneWidget);
      });
    });
  });
}
```

### 🎬 Testing Animations

```dart
// test/widgets/animated_counter_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/widgets/animated_counter.dart';

void main() {
  group('AnimatedCounter', () {
    testWidgets('should animate counter value changes', (WidgetTester tester) async {
      // Arrange
      int currentValue = 0;
      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: StatefulBuilder(
          builder: (context, setState) => Column(
            children: [
              AnimatedCounter(value: currentValue),
              ElevatedButton(
                onPressed: () => setState(() => currentValue++),
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ));

      // Initial state
      expect(find.text('0'), findsOneWidget);

      // Act
      await tester.tap(find.text('Increment'));
      await tester.pump(); // Start animation
      await tester.pump(Duration(milliseconds: 500)); // Mid animation

      // Assert - Should be animating
      final middleText = tester.widget<AnimatedCounter>(
        find.byType(AnimatedCounter),
      );
      // Value should be between 0 and 1 during animation

      // Complete animation
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('should handle rapid value changes', (WidgetTester tester) async {
      // Arrange
      int currentValue = 0;
      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: StatefulBuilder(
          builder: (context, setState) => Column(
            children: [
              AnimatedCounter(value: currentValue),
              ElevatedButton(
                onPressed: () => setState(() => currentValue += 5),
                child: Text('Add 5'),
              ),
            ],
          ),
        ),
      ));

      // Act - Rapid changes
      await tester.tap(find.text('Add 5'));
      await tester.pump();
      await tester.tap(find.text('Add 5'));
      await tester.pump();

      // Complete all animations
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('should handle custom animation duration', (WidgetTester tester) async {
      // Arrange
      const customDuration = Duration(seconds: 2);
      await tester.pumpWidget(TestDataFactory.createTestApp(
        child: AnimatedCounter(
          value: 100,
          duration: customDuration,
        ),
      ));

      // Act
      await tester.pump();
      await tester.pump(Duration(seconds: 1)); // Half duration

      // The animation should still be in progress
      await tester.pump(Duration(seconds: 2)); // Complete

      // Assert
      expect(find.text('100'), findsOneWidget);
    });
  });
}
```

---

## 5. Integration Testing

### 🎯 Complete User Flows

```dart
// integration_test/app_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Tests', () {
    testWidgets('complete user registration and login flow', (WidgetTester tester) async {
      // Launch app
      app.main();
      await tester.pumpAndSettle();

      // Navigate to registration
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      // Fill registration form
      await tester.enterText(find.byKey(Key('name_field')), 'John Doe');
      await tester.enterText(find.byKey(Key('email_field')), 'john@example.com');
      await tester.enterText(find.byKey(Key('password_field')), 'password123');
      await tester.enterText(find.byKey(Key('confirm_password_field')), 'password123');

      // Submit registration
      await tester.tap(find.text('Register'));
      await tester.pumpAndSettle(Duration(seconds: 3));

      // Verify successful registration
      expect(find.text('Registration Successful'), findsOneWidget);

      // Navigate to login
      await tester.tap(find.text('Login Now'));
      await tester.pumpAndSettle();

      // Login with registered credentials
      await tester.enterText(find.byKey(Key('login_email_field')), 'john@example.com');
      await tester.enterText(find.byKey(Key('login_password_field')), 'password123');
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle(Duration(seconds: 3));

      // Verify successful login - should be on home page
      expect(find.text('Welcome, John!'), findsOneWidget);
      expect(find.byKey(Key('home_page')), findsOneWidget);
    });

    testWidgets('shopping cart flow', (WidgetTester tester) async {
      // Launch app and login
      app.main();
      await tester.pumpAndSettle();
      await _performLogin(tester);

      // Navigate to products
      await tester.tap(find.text('Products'));
      await tester.pumpAndSettle();

      // Add first product to cart
      await tester.tap(find.byKey(Key('product_card_0')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      // Verify product added message
      expect(find.text('Product added to cart'), findsOneWidget);

      // Go back to products
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Add second product
      await tester.tap(find.byKey(Key('product_card_1')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      // Navigate to cart
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      // Verify cart contents
      expect(find.byType(CartItem), findsNWidgets(2));

      // Update quantity
      await tester.tap(find.byKey(Key('increase_quantity_0')));
      await tester.pumpAndSettle();

      // Verify quantity updated
      expect(find.text('2'), findsOneWidget);

      // Proceed to checkout
      await tester.tap(find.text('Checkout'));
      await tester.pumpAndSettle();

      // Fill checkout form
      await tester.enterText(find.byKey(Key('address_field')), '123 Main St');
      await tester.enterText(find.byKey(Key('city_field')), 'Anytown');
      await tester.enterText(find.byKey(Key('zip_field')), '12345');

      // Complete order
      await tester.tap(find.text('Place Order'));
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Verify order completion
      expect(find.text('Order Placed Successfully'), findsOneWidget);
    });

    testWidgets('search and filter functionality', (WidgetTester tester) async {
      // Launch app
      app.main();
      await tester.pumpAndSettle();

      // Navigate to search
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      // Enter search query
      await tester.enterText(find.byKey(Key('search_field')), 'flutter');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle(Duration(seconds: 2));

      // Verify search results
      expect(find.byType(ProductCard), findsWidgets);
      expect(find.textContaining('flutter'), findsWidgets);

      // Apply filter
      await tester.tap(find.byIcon(Icons.filter_list));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Price: Low to High'));
      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();

      // Verify filtered results
      expect(find.byType(ProductCard), findsWidgets);

      // Clear search
      await tester.tap(find.byIcon(Icons.clear));
      await tester.pumpAndSettle();

      // Verify all products shown
      expect(find.byType(ProductCard), findsWidgets);
    });

    testWidgets('offline functionality', (WidgetTester tester) async {
      // Launch app
      app.main();
      await tester.pumpAndSettle();

      // Navigate to products and wait for data to load
      await tester.tap(find.text('Products'));
      await tester.pumpAndSettle(Duration(seconds: 3));

      // Verify products loaded
      expect(find.byType(ProductCard), findsWidgets);

      // Simulate network disconnection
      await tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('connectivity_plus'),
        (MethodCall methodCall) async {
          if (methodCall.method == 'check') {
            return 'none';
          }
          return null;
        },
      );

      // Trigger refresh
      await tester.fling(find.byType(RefreshIndicator), Offset(0, 300), 1000);
      await tester.pumpAndSettle();

      // Verify offline message
      expect(find.text('No internet connection'), findsOneWidget);

      // Verify cached data still available
      expect(find.byType(ProductCard), findsWidgets);
    });
  });

  group('Error Scenarios', () {
    testWidgets('should handle API errors gracefully', (WidgetTester tester) async {
      // Configure app to use mock API that returns errors
      app.main();
      await tester.pumpAndSettle();

      // Navigate to a section that requires API calls
      await tester.tap(find.text('Products'));
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Verify error state
      expect(find.text('Failed to load products'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);

      // Test retry functionality
      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle(Duration(seconds: 3));
    });

    testWidgets('should handle form validation errors', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to registration
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      // Try to submit empty form
      await tester.tap(find.text('Register'));
      await tester.pumpAndSettle();

      // Verify validation errors
      expect(find.text('Name is required'), findsOneWidget);
      expect(find.text('Email is required'), findsOneWidget);
      expect(find.text('Password is required'), findsOneWidget);

      // Fill with invalid data
      await tester.enterText(find.byKey(Key('email_field')), 'invalid-email');
      await tester.enterText(find.byKey(Key('password_field')), '123');
      await tester.tap(find.text('Register'));
      await tester.pumpAndSettle();

      // Verify specific validation errors
      expect(find.text('Please enter a valid email'), findsOneWidget);
      expect(find.text('Password must be at least 8 characters'), findsOneWidget);
    });
  });
}

// Helper function for login
Future<void> _performLogin(WidgetTester tester) async {
  await tester.tap(find.text('Login'));
  await tester.pumpAndSettle();

  await tester.enterText(find.byKey(Key('login_email_field')), 'test@example.com');
  await tester.enterText(find.byKey(Key('login_password_field')), 'password123');
  await tester.tap(find.text('Login'));
  await tester.pumpAndSettle(Duration(seconds: 3));
}
```

### 📱 Platform-specific Testing

```dart
// integration_test/platform_test.dart
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Platform-specific Tests', () {
    testWidgets('should handle platform channels correctly', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Test platform-specific functionality
      if (Platform.isAndroid) {
        // Test Android-specific features
        await _testAndroidFeatures(tester);
      } else if (Platform.isIOS) {
        // Test iOS-specific features
        await _testIOSFeatures(tester);
      }
    });

    testWidgets('should handle device orientations', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Test portrait orientation
      await tester.binding.setSurfaceSize(Size(400, 800));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('portrait_layout')), findsOneWidget);

      // Test landscape orientation
      await tester.binding.setSurfaceSize(Size(800, 400));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('landscape_layout')), findsOneWidget);

      // Reset to portrait
      await tester.binding.setSurfaceSize(Size(400, 800));
      await tester.pumpAndSettle();
    });

    testWidgets('should handle different screen sizes', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Test tablet size
      await tester.binding.setSurfaceSize(Size(1024, 768));
      await tester.pumpAndSettle();

      // Verify tablet-specific layout
      expect(find.byKey(Key('tablet_layout')), findsOneWidget);

      // Test phone size
      await tester.binding.setSurfaceSize(Size(375, 667));
      await tester.pumpAndSettle();

      // Verify phone-specific layout
      expect(find.byKey(Key('phone_layout')), findsOneWidget);
    });

    testWidgets('should handle back button on Android', (WidgetTester tester) async {
      if (!Platform.isAndroid) return;

      app.main();
      await tester.pumpAndSettle();

      // Navigate to second page
      await tester.tap(find.text('Go to Details'));
      await tester.pumpAndSettle();

      // Simulate Android back button
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/platform',
        const StandardMethodCodec().encodeMethodCall(
          const MethodCall('SystemNavigator.pop'),
        ),
        (data) {},
      );
      await tester.pumpAndSettle();

      // Verify back navigation
      expect(find.text('Home'), findsOneWidget);
    });
  });
}

Future<void> _testAndroidFeatures(WidgetTester tester) async {
  // Test Android-specific features like permissions
  await tester.tap(find.text('Request Permission'));
  await tester.pumpAndSettle();

  // Simulate permission granted
  expect(find.text('Permission Granted'), findsOneWidget);
}

Future<void> _testIOSFeatures(WidgetTester tester) async {
  // Test iOS-specific features
  await tester.tap(find.text('Show Action Sheet'));
  await tester.pumpAndSettle();

  expect(find.byType(CupertinoActionSheet), findsOneWidget);
}
```

---

Saya akan melanjutkan dengan bagian selanjutnya dari Section 11. Apakah Anda ingin saya lanjutkan?