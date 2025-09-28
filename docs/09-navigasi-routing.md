# 📍 Section 9: Navigasi & Routing

<div align="center">

![Flutter Navigation](https://img.shields.io/badge/Flutter-Navigation-blue?style=for-the-badge&logo=flutter)
![Difficulty](https://img.shields.io/badge/Level-Intermediate-orange?style=for-the-badge)
![Duration](https://img.shields.io/badge/Durasi-3--4_Jam-green?style=for-the-badge)

*Menguasai sistem navigasi Flutter untuk membuat aplikasi multi-halaman yang smooth dan intuitif*

</div>

---

## 🎯 Tujuan Pembelajaran

Setelah menyelesaikan section ini, Anda akan dapat:

- ✅ Memahami konsep routing dan navigation stack di Flutter
- ✅ Mengimplementasikan navigasi dasar (push, pop, replace)
- ✅ Membuat named routes dan route parameters
- ✅ Mengelola navigation drawer dan bottom navigation
- ✅ Mengimplementasikan nested navigation dan custom transitions
- ✅ Menangani deep linking dan route guards

---

## 📚 Daftar Isi

1. [Konsep Dasar Navigation](#konsep-dasar-navigation)
2. [Basic Navigation (Push & Pop)](#basic-navigation-push--pop)
3. [Named Routes](#named-routes)
4. [Passing Data Between Screens](#passing-data-between-screens)
5. [Navigation Drawer](#navigation-drawer)
6. [Bottom Navigation Bar](#bottom-navigation-bar)
7. [Tab Navigation](#tab-navigation)
8. [Custom Page Transitions](#custom-page-transitions)
9. [Deep Linking](#deep-linking)
10. [Route Guards & Protection](#route-guards--protection)
11. [Hands-on Project: Multi-Page App](#hands-on-project-multi-page-app)
12. [Best Practices](#best-practices)
13. [Troubleshooting](#troubleshooting)

---

## 1. Konsep Dasar Navigation

### 🎯 Navigation Stack

Flutter menggunakan konsep **navigation stack** seperti tumpukan kartu:

```dart
// Navigation Stack Visualization
/*
┌─────────────────┐ ← Current Screen (top)
│   Profile Page  │
├─────────────────┤
│   Home Page     │
├─────────────────┤
│   Login Page    │ ← Bottom of stack
└─────────────────┘
*/
```

### 📱 Navigator Widget

```dart
// Navigator adalah widget yang mengelola stack routes
Navigator.of(context).push(...);    // Tambah halaman baru
Navigator.of(context).pop(...);     // Kembali ke halaman sebelumnya
Navigator.of(context).replace(...); // Ganti halaman saat ini
```

### 🏗️ MaterialPageRoute

> 💡 **Cara menjalankan code examples:**
> Untuk menjalankan navigation examples di section ini, wrap dengan template berikut:
> ```dart
> import 'package:flutter/material.dart';
>
> void main() => runApp(MaterialApp(home: BasicNavigationExample()));
> ```

```dart
class BasicNavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman baru
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SecondPage(),
              ),
            );
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Kembali ke halaman sebelumnya
            Navigator.of(context).pop();
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}
```

---

## 2. Basic Navigation (Push & Pop)

### 🚀 Navigator.push()

```dart
// Method 1: Menggunakan MaterialPageRoute
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => DetailPage(),
  ),
);

// Method 2: Menggunakan PageRouteBuilder untuk custom animation
Navigator.of(context).push(
  PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => DetailPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(begin: Offset(1.0, 0.0), end: Offset.zero),
        ),
        child: child,
      );
    },
  ),
);
```

### ⬅️ Navigator.pop()

```dart
// Pop tanpa data
Navigator.of(context).pop();

// Pop dengan data kembali
Navigator.of(context).pop('Data dari halaman ini');

// Pop sampai halaman tertentu
Navigator.of(context).popUntil((route) => route.isFirst);

// Pop dan replace
Navigator.of(context).popAndPushNamed('/home');
```

### 🔄 Navigator.pushReplacement()

```dart
// Ganti halaman saat ini (tidak bisa kembali)
Navigator.of(context).pushReplacement(
  MaterialPageRoute(
    builder: (context) => HomePage(),
  ),
);

// Berguna untuk: Login → Home (tidak bisa kembali ke login)
```

### 🆕 Navigator.pushAndRemoveUntil()

```dart
// Hapus semua halaman sebelumnya
Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(builder: (context) => HomePage()),
  (route) => false, // Hapus semua
);

// Hapus sampai halaman tertentu
Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(builder: (context) => ProfilePage()),
  ModalRoute.withName('/home'),
);
```

---

## 3. Named Routes

### 📝 Definisi Routes

```dart
// main.dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/settings': (context) => SettingsPage(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => CartPage(),
      },
      // Route generator untuk dynamic routes
      onGenerateRoute: (settings) {
        // Handle routes with parameters
        if (settings.name!.startsWith('/product/')) {
          final productId = settings.name!.split('/')[2];
          return MaterialPageRoute(
            builder: (context) => ProductDetailPage(productId: productId),
          );
        }

        // Handle unknown routes
        return MaterialPageRoute(
          builder: (context) => NotFoundPage(),
        );
      },
    );
  }
}
```

### 🏷️ Navigasi dengan Named Routes

```dart
class NavigationExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Named Routes Demo')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Push named route
              Navigator.of(context).pushNamed('/profile');
            },
            child: Text('Go to Profile'),
          ),

          ElevatedButton(
            onPressed: () {
              // Push replacement named route
              Navigator.of(context).pushReplacementNamed('/settings');
            },
            child: Text('Go to Settings (Replace)'),
          ),

          ElevatedButton(
            onPressed: () {
              // Push and remove until
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/home',
                (route) => false,
              );
            },
            child: Text('Go Home (Clear Stack)'),
          ),
        ],
      ),
    );
  }
}
```

### 📋 Route Generator Pattern

```dart
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());

      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());

      case '/product':
        if (settings.arguments is Map<String, dynamic>) {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => ProductPage(
              productId: args['id'],
              category: args['category'],
            ),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(child: Text('Page not found')),
      ),
    );
  }
}

// Penggunaan di MaterialApp
MaterialApp(
  onGenerateRoute: RouteGenerator.generateRoute,
  initialRoute: '/',
)
```

---

## 4. Passing Data Between Screens

### 📤 Mengirim Data

```dart
// Method 1: Constructor parameters
class ProductPage extends StatelessWidget {
  final String productId;
  final String productName;

  ProductPage({required this.productId, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: Text('Product ID: $productId'),
    );
  }
}

// Navigasi dengan constructor
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => ProductPage(
      productId: '123',
      productName: 'Flutter Book',
    ),
  ),
);
```

```dart
// Method 2: Route arguments
Navigator.of(context).pushNamed(
  '/product',
  arguments: {
    'id': '123',
    'name': 'Flutter Book',
    'price': 29.99,
  },
);

// Menerima arguments
class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text(args['name'])),
      body: Column(
        children: [
          Text('ID: ${args['id']}'),
          Text('Price: \$${args['price']}'),
        ],
      ),
    );
  }
}
```

### 📥 Menerima Data Kembali

```dart
// Mengirim dan menunggu hasil
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Tunggu hasil dari halaman berikutnya
            final result = await Navigator.of(context).push<String>(
              MaterialPageRoute(
                builder: (context) => SelectionPage(),
              ),
            );

            if (result != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: $result')),
              );
            }
          },
          child: Text('Select Item'),
        ),
      ),
    );
  }
}

// Halaman yang mengembalikan data
class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Item')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.of(context).pop('Item 1');
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              Navigator.of(context).pop('Item 2');
            },
          ),
        ],
      ),
    );
  }
}
```

### 🎯 Type-Safe Navigation

```dart
// Model untuk type safety
class NavigationArgs {
  final String productId;
  final String category;

  NavigationArgs({required this.productId, required this.category});
}

// Extension untuk type-safe navigation
extension NavigatorExtension on NavigatorState {
  Future<T?> pushTyped<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushProduct<T>(NavigationArgs args) {
    return pushNamed<T>('/product', arguments: args);
  }
}

// Penggunaan
Navigator.of(context).pushProduct(
  NavigationArgs(productId: '123', category: 'books'),
);
```

---

## 5. Navigation Drawer

### 🎨 Basic Drawer

```dart
class DrawerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              accountName: Text('John Doe'),
              accountEmail: Text('john@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40),
              ),
            ),

            // Menu Items
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pop(); // Close drawer
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/profile');
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/settings');
              },
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Main Content'),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Close drawer
              // Perform logout logic
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
```

### 🎯 Custom Drawer with Sections

```dart
class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Custom Header
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://picsum.photos/100'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'john@example.com',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),

          // Menu Sections
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildSection('Main', [
                  _buildMenuItem(Icons.home, 'Home', '/'),
                  _buildMenuItem(Icons.dashboard, 'Dashboard', '/dashboard'),
                  _buildMenuItem(Icons.notifications, 'Notifications', '/notifications'),
                ]),

                _buildSection('Account', [
                  _buildMenuItem(Icons.person, 'Profile', '/profile'),
                  _buildMenuItem(Icons.settings, 'Settings', '/settings'),
                  _buildMenuItem(Icons.help, 'Help', '/help'),
                ]),

                _buildSection('Other', [
                  _buildMenuItem(Icons.info, 'About', '/about'),
                  _buildMenuItem(Icons.logout, 'Logout', null, isLogout: true),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
        ),
        ...items,
        Divider(),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String? route, {bool isLogout = false}) {
    return Builder(
      builder: (context) => ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          Navigator.of(context).pop();

          if (isLogout) {
            // Handle logout
            _handleLogout(context);
          } else if (route != null) {
            Navigator.of(context).pushNamed(route);
          }
        },
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    // Logout logic
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }
}
```

---

## 6. Bottom Navigation Bar

### 📱 Basic Bottom Navigation

```dart
class BottomNavigationExample extends StatefulWidget {
  @override
  _BottomNavigationExampleState createState() => _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<BottomNavigationExample> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
```

### 🎨 Custom Bottom Navigation

```dart
class CustomBottomNavigation extends StatefulWidget {
  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomePage(),
          SearchPage(),
          CartPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          items: [
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.search, 'Search', 1),
            _buildNavItem(Icons.shopping_cart, 'Cart', 2),
            _buildNavItem(Icons.person, 'Profile', 3),
          ],
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Icon(
          icon,
          size: _currentIndex == index ? 28 : 24,
        ),
      ),
      label: label,
    );
  }
}
```

### 🎯 Bottom Navigation with Badge

```dart
class BottomNavWithBadge extends StatefulWidget {
  @override
  _BottomNavWithBadgeState createState() => _BottomNavWithBadgeState();
}

class _BottomNavWithBadgeState extends State<BottomNavWithBadge> {
  int _currentIndex = 0;
  int _cartItemCount = 3;
  int _notificationCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          NotificationsPage(),
          CartPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildBadgeIcon(
              Icons.notifications,
              _notificationCount,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: _buildBadgeIcon(
              Icons.shopping_cart,
              _cartItemCount,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeIcon(IconData icon, int count) {
    return Stack(
      children: [
        Icon(icon),
        if (count > 0)
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
                count > 99 ? '99+' : count.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
```

---

## 7. Tab Navigation

### 📑 Basic TabBar

```dart
class TabNavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab Navigation'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Home Content')),
            Center(child: Text('Search Content')),
            Center(child: Text('Favorites Content')),
            Center(child: Text('Profile Content')),
          ],
        ),
      ),
    );
  }
}
```

### 🎨 Custom TabBar

```dart
class CustomTabNavigation extends StatefulWidget {
  @override
  _CustomTabNavigationState createState() => _CustomTabNavigationState();
}

class _CustomTabNavigationState extends State<CustomTabNavigation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Tabs'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.deepPurple,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.trending_up),
                      SizedBox(width: 8),
                      Text('Trending'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.new_releases),
                      SizedBox(width: 8),
                      Text('Latest'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star),
                      SizedBox(width: 8),
                      Text('Popular'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                TrendingPage(),
                LatestPage(),
                PopularPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### 🎯 Nested Tab Navigation

```dart
class NestedTabExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nested Tabs'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Categories'),
              Tab(text: 'Brands'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesTab(),
            BrandsTab(),
          ],
        ),
      ),
    );
  }
}

class CategoriesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            color: Colors.grey[200],
            child: TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(text: 'Electronics'),
                Tab(text: 'Clothing'),
                Tab(text: 'Books'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text('Electronics Content')),
                Center(child: Text('Clothing Content')),
                Center(child: Text('Books Content')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BrandsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Brands Content'));
  }
}
```

---

## 8. Custom Page Transitions

### ✨ Built-in Transitions

```dart
// Slide Transition
class SlideRoute extends PageRouteBuilder {
  final Widget page;
  final Offset beginOffset;

  SlideRoute({required this.page, this.beginOffset = const Offset(1.0, 0.0)})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: beginOffset, end: Offset.zero).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
              ),
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 300),
        );
}

// Penggunaan
Navigator.of(context).push(
  SlideRoute(page: DetailPage()),
);
```

```dart
// Fade Transition
class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}

// Scale Transition
class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastOutSlowIn,
                ),
              ),
              child: child,
            );
          },
        );
}
```

### 🎨 Custom Combined Transitions

```dart
class CustomTransition extends PageRouteBuilder {
  final Widget page;
  final TransitionType type;

  CustomTransition({required this.page, required this.type})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            switch (type) {
              case TransitionType.slideUp:
                return SlideTransition(
                  position: animation.drive(
                    Tween(begin: Offset(0.0, 1.0), end: Offset.zero),
                  ),
                  child: child,
                );

              case TransitionType.slideDown:
                return SlideTransition(
                  position: animation.drive(
                    Tween(begin: Offset(0.0, -1.0), end: Offset.zero),
                  ),
                  child: child,
                );

              case TransitionType.scaleRotate:
                return ScaleTransition(
                  scale: animation,
                  child: RotationTransition(
                    turns: animation,
                    child: child,
                  ),
                );

              case TransitionType.slideAndFade:
                return SlideTransition(
                  position: animation.drive(
                    Tween(begin: Offset(1.0, 0.0), end: Offset.zero),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );

              default:
                return child;
            }
          },
          transitionDuration: Duration(milliseconds: 300),
        );
}

enum TransitionType {
  slideUp,
  slideDown,
  scaleRotate,
  slideAndFade,
}
```

### 🎯 Shared Element Transition

```dart
// Hero Widget untuk shared element transition
class HeroTransitionExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Transition')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    heroTag: 'hero-$index',
                    imageUrl: 'https://picsum.photos/200?random=$index',
                  ),
                ),
              );
            },
            child: Hero(
              tag: 'hero-$index',
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/200?random=$index'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String heroTag;
  final String imageUrl;

  DetailPage({required this.heroTag, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Column(
        children: [
          Hero(
            tag: heroTag,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Detail content here...'),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## 9. Deep Linking

### 🔗 Basic Deep Linking Setup

```dart
// pubspec.yaml dependencies
dependencies:
  flutter:
    sdk: flutter
  go_router: ^10.1.2  # Untuk routing yang lebih advanced

// Route configuration
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/product/:id',
        builder: (context, state) {
          final productId = state.pathParameters['id']!;
          return ProductPage(productId: productId);
        },
      ),
      GoRoute(
        path: '/user/:userId/profile',
        builder: (context, state) {
          final userId = state.pathParameters['userId']!;
          final tab = state.queryParameters['tab'];
          return UserProfilePage(userId: userId, initialTab: tab);
        },
      ),
    ],
    errorBuilder: (context, state) => NotFoundPage(),
  );
}

// Main App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
```

### 📱 Android Deep Link Configuration

```xml
<!-- android/app/src/main/AndroidManifest.xml -->
<activity
    android:name=".MainActivity"
    android:exported="true"
    android:launchMode="singleTop">

    <!-- Default intent filter -->
    <intent-filter android:autoVerify="true">
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.LAUNCHER"/>
    </intent-filter>

    <!-- Deep link intent filter -->
    <intent-filter android:autoVerify="true">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="myapp"
              android:host="example.com" />
    </intent-filter>

    <!-- HTTP/HTTPS deep links -->
    <intent-filter android:autoVerify="true">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="https"
              android:host="myapp.com" />
    </intent-filter>
</activity>
```

### 🍎 iOS Deep Link Configuration

```xml
<!-- ios/Runner/Info.plist -->
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLName</key>
        <string>myapp.com</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>myapp</string>
            <string>https</string>
        </array>
    </dict>
</array>
```

### 🎯 Handling Deep Links in Flutter

```dart
import 'package:go_router/go_router.dart';

class DeepLinkHandler {
  static void handleIncomingLink(String link) {
    final uri = Uri.parse(link);

    // Handle different types of deep links
    switch (uri.pathSegments.first) {
      case 'product':
        if (uri.pathSegments.length > 1) {
          final productId = uri.pathSegments[1];
          GoRouter.of(context).go('/product/$productId');
        }
        break;

      case 'user':
        if (uri.pathSegments.length > 2) {
          final userId = uri.pathSegments[1];
          final action = uri.pathSegments[2];
          GoRouter.of(context).go('/user/$userId/$action');
        }
        break;

      case 'share':
        final shareId = uri.queryParameters['id'];
        if (shareId != null) {
          GoRouter.of(context).go('/share?id=$shareId');
        }
        break;

      default:
        GoRouter.of(context).go('/');
    }
  }
}

// Example: Generating deep links
class DeepLinkGenerator {
  static String generateProductLink(String productId) {
    return 'myapp://example.com/product/$productId';
  }

  static String generateUserProfileLink(String userId, {String? tab}) {
    var link = 'myapp://example.com/user/$userId/profile';
    if (tab != null) {
      link += '?tab=$tab';
    }
    return link;
  }

  static String generateShareLink(String shareId) {
    return 'https://myapp.com/share?id=$shareId';
  }
}
```

---

## 10. Route Guards & Protection

### 🔐 Authentication Guard

```dart
class AuthGuard {
  static bool isAuthenticated() {
    // Check authentication status
    // This could check SharedPreferences, secure storage, etc.
    return UserSession.isLoggedIn;
  }

  static void redirectToLogin(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/login',
      (route) => false,
    );
  }
}

// Route wrapper with authentication check
class ProtectedRoute extends StatelessWidget {
  final Widget child;
  final bool requireAuth;

  ProtectedRoute({
    required this.child,
    this.requireAuth = true,
  });

  @override
  Widget build(BuildContext context) {
    if (requireAuth && !AuthGuard.isAuthenticated()) {
      // Redirect to login if not authenticated
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AuthGuard.redirectToLogin(context);
      });

      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return child;
  }
}
```

### 🎯 Role-based Access Control

```dart
enum UserRole { admin, moderator, user, guest }

class PermissionGuard {
  static UserRole getCurrentUserRole() {
    // Get user role from storage or API
    return UserSession.currentRole ?? UserRole.guest;
  }

  static bool hasPermission(UserRole requiredRole) {
    final currentRole = getCurrentUserRole();

    switch (requiredRole) {
      case UserRole.admin:
        return currentRole == UserRole.admin;
      case UserRole.moderator:
        return [UserRole.admin, UserRole.moderator].contains(currentRole);
      case UserRole.user:
        return [UserRole.admin, UserRole.moderator, UserRole.user].contains(currentRole);
      case UserRole.guest:
        return true;
    }
  }

  static void handleUnauthorizedAccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Access Denied'),
        content: Text('You do not have permission to access this page.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

// Role-protected route
class RoleProtectedRoute extends StatelessWidget {
  final Widget child;
  final UserRole requiredRole;

  RoleProtectedRoute({
    required this.child,
    required this.requiredRole,
  });

  @override
  Widget build(BuildContext context) {
    if (!PermissionGuard.hasPermission(requiredRole)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        PermissionGuard.handleUnauthorizedAccess(context);
      });

      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text('Access Denied', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      );
    }

    return child;
  }
}
```

### 🛡️ Complete Route Protection System

```dart
class RouteGuard {
  static Route<dynamic> generateProtectedRoute(RouteSettings settings) {
    // Define route protection rules
    final protectedRoutes = {
      '/admin': UserRole.admin,
      '/dashboard': UserRole.user,
      '/settings': UserRole.user,
      '/profile': UserRole.user,
    };

    final authRequiredRoutes = {
      '/dashboard',
      '/profile',
      '/settings',
      '/admin',
      '/cart',
      '/orders',
    };

    // Check if route requires authentication
    if (authRequiredRoutes.contains(settings.name)) {
      if (!AuthGuard.isAuthenticated()) {
        return MaterialPageRoute(
          builder: (_) => LoginPage(redirectTo: settings.name),
        );
      }
    }

    // Check role-based permissions
    if (protectedRoutes.containsKey(settings.name)) {
      final requiredRole = protectedRoutes[settings.name]!;
      if (!PermissionGuard.hasPermission(requiredRole)) {
        return MaterialPageRoute(
          builder: (_) => UnauthorizedPage(),
        );
      }
    }

    // Generate normal route
    return _generateNormalRoute(settings);
  }

  static Route<dynamic> _generateNormalRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/dashboard':
        return MaterialPageRoute(
          builder: (_) => ProtectedRoute(
            child: DashboardPage(),
          ),
        );
      case '/admin':
        return MaterialPageRoute(
          builder: (_) => RoleProtectedRoute(
            requiredRole: UserRole.admin,
            child: AdminPage(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}

// Usage in MaterialApp
MaterialApp(
  onGenerateRoute: RouteGuard.generateProtectedRoute,
  initialRoute: '/',
)
```

---

## 11. Hands-on Project: Multi-Page App

Mari kita buat aplikasi e-commerce sederhana dengan navigasi lengkap:

### 📱 Project Structure

```
lib/
├── main.dart
├── models/
│   ├── product.dart
│   └── user.dart
├── pages/
│   ├── home_page.dart
│   ├── product_detail_page.dart
│   ├── cart_page.dart
│   ├── profile_page.dart
│   └── login_page.dart
├── widgets/
│   ├── custom_drawer.dart
│   ├── product_card.dart
│   └── cart_item.dart
└── services/
    ├── auth_service.dart
    └── cart_service.dart
```

### 🏗️ Main App Setup

```dart
// main.dart
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/cart_page.dart';
import 'pages/profile_page.dart';
import 'pages/product_detail_page.dart';

void main() {
  runApp(MyECommerceApp());
}

class MyECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainNavigation(),
        '/login': (context) => LoginPage(),
        '/product-detail': (context) => ProductDetailPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name!.startsWith('/product/')) {
          final productId = settings.name!.split('/')[2];
          return MaterialPageRoute(
            builder: (context) => ProductDetailPage(productId: productId),
          );
        }
        return null;
      },
    );
  }
}
```

### 📱 Main Navigation

```dart
// main_navigation.dart
class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                // Cart badge
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
                      '2', // Dynamic cart count
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
```

### 🏠 Home Page

```dart
// pages/home_page.dart
class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Flutter T-Shirt',
      price: 25.99,
      imageUrl: 'https://picsum.photos/200/200?random=1',
      description: 'Comfortable Flutter branded t-shirt',
    ),
    Product(
      id: '2',
      name: 'Dart Mug',
      price: 12.99,
      imageUrl: 'https://picsum.photos/200/200?random=2',
      description: 'Perfect mug for Dart developers',
    ),
    // Add more products...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search
            },
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    product: products[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
```

### 🛍️ Product Detail Page

```dart
// pages/product_detail_page.dart
class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Share product
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Hero(
            tag: 'product-${widget.product.id}',
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 8),
                  Text(widget.product.description),

                  Spacer(),

                  // Quantity Selector
                  Row(
                    children: [
                      Text('Quantity: '),
                      IconButton(
                        onPressed: quantity > 1 ? () {
                          setState(() {
                            quantity--;
                          });
                        } : null,
                        icon: Icon(Icons.remove),
                      ),
                      Text('$quantity'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Add to cart
                  CartService.addToCart(widget.product, quantity);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added to cart!'),
                      action: SnackBarAction(
                        label: 'View Cart',
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Navigate to cart tab
                        },
                      ),
                    ),
                  );
                },
                child: Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Buy now
                },
                child: Text('Buy Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 🛒 Cart Page

```dart
// pages/cart_page.dart
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartService.getCartItems();
    final total = CartService.getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          if (cartItems.isNotEmpty)
            IconButton(
              icon: Icon(Icons.clear_all),
              onPressed: () {
                _showClearCartDialog();
              },
            ),
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  Text('Add some products to get started'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to home
                      DefaultTabController.of(context)?.animateTo(0);
                    },
                    child: Text('Start Shopping'),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        cartItem: cartItems[index],
                        onQuantityChanged: (newQuantity) {
                          setState(() {
                            CartService.updateQuantity(
                              cartItems[index].product.id,
                              newQuantity,
                            );
                          });
                        },
                        onRemove: () {
                          setState(() {
                            CartService.removeFromCart(cartItems[index].product.id);
                          });
                        },
                      );
                    },
                  ),
                ),

                // Total and Checkout
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border(
                      top: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            '\$${total.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: cartItems.isNotEmpty ? () {
                            _proceedToCheckout();
                          } : null,
                          child: Text('Proceed to Checkout'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  void _showClearCartDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Clear Cart'),
        content: Text('Are you sure you want to remove all items from your cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                CartService.clearCart();
              });
            },
            child: Text('Clear'),
          ),
        ],
      ),
    );
  }

  void _proceedToCheckout() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CheckoutPage(),
      ),
    );
  }
}
```

---

## 12. Best Practices

### ✅ Navigation Best Practices

1. **Consistent Navigation Patterns**
```dart
// DO: Use consistent navigation methods
class NavigationHelper {
  static void pushNamed(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static void pushReplacement(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  static void pushAndClearStack(BuildContext context, String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
```

2. **Type-Safe Route Parameters**
```dart
// DO: Create typed route arguments
class ProductRouteArgs {
  final String productId;
  final String? category;

  ProductRouteArgs({required this.productId, this.category});
}

// DO: Validate route arguments
class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null || args is! ProductRouteArgs) {
      return ErrorPage(message: 'Invalid route arguments');
    }

    final productArgs = args as ProductRouteArgs;
    return _buildProductPage(productArgs);
  }
}
```

3. **Memory Management**
```dart
// DO: Dispose controllers properly
class TabNavigationPage extends StatefulWidget {
  @override
  _TabNavigationPageState createState() => _TabNavigationPageState();
}

class _TabNavigationPageState extends State<TabNavigationPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
```

### 🚫 Common Mistakes to Avoid

1. **DON'T: Create new routes unnecessarily**
```dart
// DON'T
Navigator.of(context).push(
  MaterialPageRoute(builder: (context) => SamePage()),
);
Navigator.of(context).push(
  MaterialPageRoute(builder: (context) => SamePage()),
); // Creates duplicate routes

// DO: Check if route already exists or use replacement
Navigator.of(context).pushReplacementNamed('/same-page');
```

2. **DON'T: Ignore route result handling**
```dart
// DON'T: Ignore potential null results
final result = await Navigator.of(context).push(route);
processResult(result); // Could be null!

// DO: Handle null results properly
final result = await Navigator.of(context).push(route);
if (result != null) {
  processResult(result);
}
```

3. **DON'T: Create complex nested navigation without state management**
```dart
// DON'T: Complex nesting without proper state
// This becomes hard to maintain and debug

// DO: Use proper state management for complex navigation
class NavigationState extends ChangeNotifier {
  int _currentIndex = 0;
  List<int> _navigationStack = [0];

  int get currentIndex => _currentIndex;

  void navigateToTab(int index) {
    _currentIndex = index;
    _navigationStack.add(index);
    notifyListeners();
  }

  bool canPop() {
    return _navigationStack.length > 1;
  }

  void pop() {
    if (canPop()) {
      _navigationStack.removeLast();
      _currentIndex = _navigationStack.last;
      notifyListeners();
    }
  }
}
```

---

## 13. Troubleshooting

### 🐛 Common Issues

| Issue | Cause | Solution |
|-------|--------|----------|
| **Black screen during navigation** | Missing route or incorrect route name | Check route definitions and spelling |
| **Navigator operation failed** | Context is no longer valid | Use NavigatorState or check if mounted |
| **Can't pop from first route** | Trying to pop from initial route | Check if route can pop: `Navigator.canPop(context)` |
| **Arguments not passed correctly** | Incorrect argument type or structure | Use typed arguments and validation |
| **Deep links not working** | Incorrect configuration | Check Android/iOS deep link setup |
| **Memory leaks in navigation** | Controllers not disposed | Always dispose controllers in `dispose()` |

### 🔧 Debug Navigation

```dart
// Debug navigation stack
class NavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('Pushed: ${route.settings.name}');
    print('Stack depth: ${navigator?.widget.pages.length}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('Popped: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print('Replaced: ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
  }
}

// Use in MaterialApp
MaterialApp(
  navigatorObservers: [NavigationObserver()],
  // ... other properties
)
```

### 🎯 Performance Optimization

```dart
// 1. Use IndexedStack for tab navigation (preserves state)
IndexedStack(
  index: currentIndex,
  children: pages,
)

// 2. Lazy load pages for memory efficiency
class LazyTabView extends StatefulWidget {
  @override
  _LazyTabViewState createState() => _LazyTabViewState();
}

class _LazyTabViewState extends State<LazyTabView> {
  final Map<int, Widget> _pages = {};

  Widget _getPage(int index) {
    if (!_pages.containsKey(index)) {
      _pages[index] = _createPage(index);
    }
    return _pages[index]!;
  }

  Widget _createPage(int index) {
    switch (index) {
      case 0: return HomePage();
      case 1: return SearchPage();
      default: return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex,
      children: List.generate(4, (index) => _getPage(index)),
    );
  }
}
```

---

## 🎯 Latihan Mandiri

### **Latihan 1: Basic Navigation (⭐⭐)**
Buat aplikasi dengan 3 halaman:
1. Home Page dengan daftar kategori
2. Category Page dengan daftar produk
3. Product Detail Page

**Requirements:**
- Navigasi menggunakan MaterialPageRoute
- Kirim data kategori dari Home ke Category
- Kirim data produk dari Category ke Detail
- Implementasi tombol back yang proper

**Bonus:**
- Tambahkan custom page transition
- Implementasi Hero animation untuk gambar produk

### **Latihan 2: Tab Navigation dengan State (⭐⭐⭐)**
Buat aplikasi social media sederhana:
1. Feed Tab dengan list posts
2. Search Tab dengan search functionality
3. Profile Tab dengan user info
4. Notifications Tab dengan badge counter

**Requirements:**
- Gunakan TabController dan TabBarView
- State harus preserved saat switch tab
- Notifications badge harus update dinamis
- Implementasi pull-to-refresh di Feed

### **Latihan 3: Complex Navigation System (⭐⭐⭐⭐)**
Buat aplikasi e-learning dengan:
1. Bottom navigation (Home, Courses, Progress, Profile)
2. Drawer navigation untuk settings dan help
3. Course detail dengan nested tabs (Overview, Lessons, Reviews)
4. Video player page dengan custom navigation

**Requirements:**
- Kombinasi bottom nav + drawer + nested tabs
- Deep linking untuk course dan lesson
- Route guards untuk premium content
- Breadcrumb navigation di course detail

---

## 📝 Rangkuman

Dalam section ini, Anda telah mempelajari:

### 🎯 **Key Concepts**
- **Navigation Stack**: Konsep tumpukan halaman di Flutter
- **MaterialPageRoute**: Route dasar untuk navigasi
- **Named Routes**: Sistem routing dengan nama untuk maintainability
- **Route Parameters**: Cara mengirim dan menerima data antar halaman

### 🛠️ **Navigation Types**
- **Basic Navigation**: Push, pop, dan replace
- **Bottom Navigation**: Tab navigation di bagian bawah
- **Drawer Navigation**: Side menu untuk navigasi sekunder
- **Tab Navigation**: Horizontal tabs dengan TabBar

### 🔒 **Advanced Features**
- **Custom Transitions**: Animasi perpindahan halaman custom
- **Deep Linking**: URL-based navigation
- **Route Guards**: Proteksi halaman berdasarkan auth/role
- **Hero Animations**: Shared element transitions

### 📱 **Best Practices**
- Gunakan named routes untuk maintainability
- Implement proper error handling untuk navigation
- Dispose controllers untuk prevent memory leaks
- Use type-safe route parameters

### 🎨 **UI Patterns**
- Konsisten dengan platform guidelines (Material/Cupertino)
- Provide clear navigation feedback
- Implement proper loading states
- Handle navigation errors gracefully

---

## 🚀 What's Next?

Di **Section 10: Mengakses Data & API**, kita akan belajar:
- HTTP requests dan REST API integration
- JSON parsing dan serialization
- State management untuk data fetching
- Error handling dan offline support
- Local storage dan caching strategies

**Selamat!** 🎉 Anda telah menguasai sistem navigasi Flutter yang komprehensif. Navigation adalah fondasi penting untuk aplikasi multi-halaman yang user-friendly dan maintainable.

---

<div align="center">
<strong>💡 Pro Tip:</strong> Selalu test navigation flow di berbagai skenario - normal flow, back button, deep links, dan edge cases untuk memastikan UX yang smooth!
</div>