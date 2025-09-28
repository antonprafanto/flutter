# 🔄 Chapter 8: State Management Sederhana

[![Progress](https://img.shields.io/badge/Progress-Chapter%208%2F15-blue?style=for-the-badge)](../README.md)
[![Difficulty](https://img.shields.io/badge/Difficulty-Intermediate-yellow?style=for-the-badge)](../README.md)
[![Estimated Time](https://img.shields.io/badge/Time-4--5%20hours-orange?style=for-the-badge)](../README.md)

> 🎯 **Learning Objectives**: Setelah chapter ini, Anda akan menguasai konsep state management dasar dengan setState(), memahami data flow, dan membuat aplikasi interaktif yang responsive.

## 📋 Daftar Isi
- [Apa itu State?](#-apa-itu-state)
- [setState() Deep Dive](#-setstate-deep-dive)
- [Data Flow Patterns](#-data-flow-patterns)
- [Form State Management](#-form-state-management)
- [List State Management](#-list-state-management)
- [State Sharing Between Widgets](#-state-sharing-between-widgets)
- [State Persistence](#-state-persistence)
- [Common State Patterns](#-common-state-patterns)
- [Performance Considerations](#-performance-considerations)
- [Hands-on Projects](#-hands-on-projects)

---

## 🧠 Apa itu State?

### 🔍 **State Definition & Concepts**

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
>       home: StateExplanation(), // ← Ganti dengan nama widget contoh
>       debugShowCheckedModeBanner: false,
>     );
>   }
> }
> ```

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
      home: StateExplanation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// State adalah data yang bisa berubah dan mempengaruhi UI
class StateExplanation extends StatefulWidget {
  @override
  _StateExplanationState createState() => _StateExplanationState();
}

class _StateExplanationState extends State<StateExplanation> {
  // STATE VARIABLES - Data yang bisa berubah
  int _counter = 0;           // Number state
  String _message = 'Hello';  // String state
  bool _isVisible = true;     // Boolean state
  List<String> _items = [];   // List state
  Color _bgColor = Colors.blue; // Object state

  @override
  Widget build(BuildContext context) {
    // UI yang dibangun berdasarkan state
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(title: Text('Understanding State')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // State demonstration
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current State Values:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Counter: $_counter'),
                    Text('Message: $_message'),
                    Text('Visible: $_isVisible'),
                    Text('Items count: ${_items.length}'),
                    Text('Background: ${_bgColor.toString()}'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Controls to modify state
            Text('Modify State:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter++; // Modify number state
                    });
                  },
                  child: Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _message = _message == 'Hello' ? 'Goodbye' : 'Hello'; // Modify string state
                    });
                  },
                  child: Text('Toggle Message'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible; // Modify boolean state
                    });
                  },
                  child: Text('Toggle Visibility'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _items.add('Item ${_items.length + 1}'); // Modify list state
                    });
                  },
                  child: Text('Add Item'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _bgColor = _bgColor == Colors.blue ? Colors.green : Colors.blue; // Modify object state
                    });
                  },
                  child: Text('Change Color'),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Conditional rendering based on state
            if (_isVisible)
              Card(
                color: Colors.green[100],
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    '$_message! You clicked $_counter times.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

            SizedBox(height: 16),

            // List rendering based on state
            if (_items.isNotEmpty) ...[
              Text('Items List:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_items[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _items.removeAt(index); // Modify list state
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
```

### 🏗️ **State vs Props**

```dart
class StateVsPropsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Props example - data passed from parent
        UserCard(
          name: 'John Doe',        // Props - immutable
          email: 'john@email.com', // Props - immutable
          age: 25,                 // Props - immutable
        ),

        SizedBox(height: 16),

        // State example - data managed internally
        CounterWidget(), // Has internal state
      ],
    );
  }
}

// Widget dengan props (StatelessWidget)
class UserCard extends StatelessWidget {
  final String name;   // Props - tidak bisa berubah
  final String email;  // Props - tidak bisa berubah
  final int age;       // Props - tidak bisa berubah

  const UserCard({
    Key? key,
    required this.name,
    required this.email,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Props Example:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Name: $name'),         // Uses props
            Text('Email: $email'),       // Uses props
            Text('Age: $age'),           // Uses props
          ],
        ),
      ),
    );
  }
}

// Widget dengan state (StatefulWidget)
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0; // State - bisa berubah

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('State Example:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Count: $_count'), // Uses state
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++; // Modifies state
                });
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## ⚙️ setState() Deep Dive

### 🔄 **How setState() Works**

```dart
class SetStateDiveExample extends StatefulWidget {
  @override
  _SetStateDiveExampleState createState() => _SetStateDiveExampleState();
}

class _SetStateDiveExampleState extends State<SetStateDiveExample> {
  int _buildCount = 0;
  String _status = 'Initial';
  List<String> _logs = [];

  void _logAction(String action) {
    setState(() {
      _logs.add('${DateTime.now().millisecondsSinceEpoch}: $action');
    });
  }

  @override
  Widget build(BuildContext context) {
    _buildCount++; // Count how many times build is called
    print('🏗️ build() called - Count: $_buildCount');

    return Scaffold(
      appBar: AppBar(title: Text('setState() Deep Dive')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Build counter
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Widget Lifecycle Info',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('build() called: $_buildCount times'),
                    Text('Current status: $_status'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // setState() examples
            Text('setState() Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

            // Correct setState usage
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('✅ Correct setState() Usage', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _status = 'Updated correctly';
                        });
                        _logAction('Correct setState used');
                      },
                      child: Text('Correct Update'),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8),

            // Async setState
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('⚡ Async setState() Usage', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _status = 'Loading...';
                        });

                        // Simulate async operation
                        await Future.delayed(Duration(seconds: 2));

                        if (mounted) { // Check if widget is still mounted
                          setState(() {
                            _status = 'Async operation completed';
                          });
                        }

                        _logAction('Async setState completed');
                      },
                      child: Text('Async Update'),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8),

            // Conditional setState
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🔍 Conditional setState()', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        String newStatus = 'Conditionally updated';

                        // Only call setState if value actually changes
                        if (_status != newStatus) {
                          setState(() {
                            _status = newStatus;
                          });
                          _logAction('Conditional setState (changed)');
                        } else {
                          _logAction('Conditional setState (no change)');
                        }
                      },
                      child: Text('Conditional Update'),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // setState() Performance Tips
            Card(
              color: Colors.yellow[50],
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('⚡ Performance Tips', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('• Keep setState() calls minimal'),
                    Text('• Don\'t do heavy computation inside setState()'),
                    Text('• Use conditional updates to avoid unnecessary rebuilds'),
                    Text('• Check mounted before async setState()'),
                    Text('• Extract widgets to avoid rebuilding entire tree'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Action logs
            Text('Action Logs:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              height: 200,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: ListView.builder(
                itemCount: _logs.length,
                itemBuilder: (context, index) {
                  return Text(
                    _logs[index],
                    style: TextStyle(fontSize: 12, fontFamily: 'monospace'),
                  );
                },
              ),
            ),

            SizedBox(height: 16),

            // Clear logs button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _logs.clear();
                });
              },
              child: Text('Clear Logs'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### ⚠️ **Common setState() Mistakes**

```dart
class SetStateMistakesExample extends StatefulWidget {
  @override
  _SetStateMistakesExampleState createState() => _SetStateMistakesExampleState();
}

class _SetStateMistakesExampleState extends State<SetStateMistakesExample> {
  List<String> _items = ['Item 1', 'Item 2'];
  int _counter = 0;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('setState() Mistakes')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mistake 1: Modifying state without setState
            Card(
              color: Colors.red[50],
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('❌ Mistake 1: No setState()', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    Text('Counter: $_counter'),
                    ElevatedButton(
                      onPressed: () {
                        // ❌ WRONG: Modifying state without setState()
                        _counter++; // UI won't update!
                      },
                      child: Text('Wrong Increment'),
                    ),
                    Text('This button won\'t update the UI because setState() is not called'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Mistake 2: Heavy computation in setState
            Card(
              color: Colors.orange[50],
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('⚠️ Mistake 2: Heavy computation in setState()', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                    Text('Result: $_result'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // ❌ WRONG: Heavy computation inside setState()
                          String result = '';
                          for (int i = 0; i < 1000000; i++) {
                            result += i.toString();
                          }
                          _result = 'Computed: ${result.length} characters';
                        });
                      },
                      child: Text('Heavy Computation (Wrong)'),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () async {
                        // ✅ CORRECT: Do computation outside setState()
                        String result = '';
                        for (int i = 0; i < 1000000; i++) {
                          result += i.toString();
                        }

                        setState(() {
                          _result = 'Computed: ${result.length} characters';
                        });
                      },
                      child: Text('Heavy Computation (Correct)'),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Mistake 3: Not checking mounted for async
            Card(
              color: Colors.purple[50],
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🔄 Mistake 3: Async setState() without mounted check', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      onPressed: () async {
                        await Future.delayed(Duration(seconds: 3));

                        // ❌ WRONG: Not checking if widget is still mounted
                        // setState(() {
                        //   _result = 'Async result without mounted check';
                        // });

                        // ✅ CORRECT: Check mounted before setState()
                        if (mounted) {
                          setState(() {
                            _result = 'Async result with mounted check';
                          });
                        }
                      },
                      child: Text('Async Operation'),
                    ),
                    Text('Always check mounted property before async setState()'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Mistake 4: Calling setState in build method
            Card(
              color: Colors.red[50],
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('💀 Mistake 4: setState() in build()', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    Text('NEVER call setState() inside build() method!'),
                    Text('This causes infinite rebuild loops and crashes'),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '❌ BAD:\n'
                        '@override\n'
                        'Widget build(BuildContext context) {\n'
                        '  setState(() { /* DON\'T DO THIS! */ });\n'
                        '  return Text("Widget");\n'
                        '}',
                        style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Correct patterns
            Card(
              color: Colors.green[50],
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('✅ Correct Patterns', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Items: ${_items.length}'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _items.add('Item ${_items.length + 1}');
                        });
                      },
                      child: Text('Add Item (Correct)'),
                    ),
                    SizedBox(height: 8),
                    Text('Counter: $_counter'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _counter++;
                        });
                      },
                      child: Text('Increment (Correct)'),
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
}
```

---

## 🔄 Data Flow Patterns

### 📊 **Unidirectional Data Flow**

```dart
class DataFlowExample extends StatefulWidget {
  @override
  _DataFlowExampleState createState() => _DataFlowExampleState();
}

class _DataFlowExampleState extends State<DataFlowExample> {
  List<Product> _products = [
    Product(id: 1, name: 'Laptop', price: 1000, inCart: false),
    Product(id: 2, name: 'Mouse', price: 25, inCart: false),
    Product(id: 3, name: 'Keyboard', price: 75, inCart: true),
  ];

  // State management methods
  void _toggleCart(int productId) {
    setState(() {
      final index = _products.indexWhere((p) => p.id == productId);
      if (index != -1) {
        _products[index] = _products[index].copyWith(
          inCart: !_products[index].inCart,
        );
      }
    });
  }

  void _updatePrice(int productId, double newPrice) {
    setState(() {
      final index = _products.indexWhere((p) => p.id == productId);
      if (index != -1) {
        _products[index] = _products[index].copyWith(price: newPrice);
      }
    });
  }

  double get _totalCartValue {
    return _products
        .where((p) => p.inCart)
        .fold(0.0, (sum, p) => sum + p.price);
  }

  int get _cartItemCount {
    return _products.where((p) => p.inCart).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Flow Example'),
        actions: [
          // Cart summary in app bar
          CartSummary(
            itemCount: _cartItemCount,
            totalValue: _totalCartValue,
          ),
        ],
      ),
      body: Column(
        children: [
          // Data flow diagram
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data Flow Pattern:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('1. State stored in parent widget'),
                Text('2. Data passed down as props'),
                Text('3. Events bubble up via callbacks'),
                Text('4. Parent updates state with setState()'),
                Text('5. UI rebuilds with new data'),
              ],
            ),
          ),

          // Product list
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return ProductCard(
                  product: product,
                  onToggleCart: () => _toggleCart(product.id),
                  onPriceUpdate: (newPrice) => _updatePrice(product.id, newPrice),
                );
              },
            ),
          ),

          // Bottom cart summary
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${_totalCartValue.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: _cartItemCount > 0 ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Checkout ${_cartItemCount} items for \$${_totalCartValue.toStringAsFixed(2)}'),
                      ),
                    );
                  } : null,
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Data model
class Product {
  final int id;
  final String name;
  final double price;
  final bool inCart;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.inCart,
  });

  Product copyWith({
    int? id,
    String? name,
    double? price,
    bool? inCart,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      inCart: inCart ?? this.inCart,
    );
  }
}

// Child widget that receives data and sends events up
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onToggleCart;
  final Function(double) onPriceUpdate;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onToggleCart,
    required this.onPriceUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    product.inCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
                    color: product.inCart ? Colors.red : Colors.blue,
                  ),
                  onPressed: onToggleCart, // Event sent up to parent
                ),
                TextButton(
                  onPressed: () {
                    _showPriceDialog(context);
                  },
                  child: Text('Edit Price'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showPriceDialog(BuildContext context) {
    final controller = TextEditingController(text: product.price.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update Price'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'New Price',
            prefixText: '\$',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final newPrice = double.tryParse(controller.text);
              if (newPrice != null && newPrice > 0) {
                onPriceUpdate(newPrice); // Event sent up to parent
                Navigator.pop(context);
              }
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }
}

// Another child widget
class CartSummary extends StatelessWidget {
  final int itemCount;
  final double totalValue;

  const CartSummary({
    Key? key,
    required this.itemCount,
    required this.totalValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.shopping_cart),
          SizedBox(width: 4),
          Text('$itemCount'),
          SizedBox(width: 8),
          Text('\$${totalValue.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
```

---

## 📝 Form State Management

### 📋 **Complete Form Example**

```dart
class FormStateExample extends StatefulWidget {
  @override
  _FormStateExampleState createState() => _FormStateExampleState();
}

class _FormStateExampleState extends State<FormStateExample> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  // Form state variables
  String _selectedCountry = 'Indonesia';
  String _selectedGender = 'Male';
  bool _agreeToTerms = false;
  bool _subscribeNewsletter = false;
  DateTime? _selectedDate;
  double _ageSlider = 25;
  List<String> _hobbies = [];

  // Available options
  final List<String> _countries = ['Indonesia', 'Malaysia', 'Singapore', 'Thailand'];
  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _availableHobbies = ['Reading', 'Sports', 'Music', 'Travel', 'Cooking', 'Gaming'];

  // Form validation state
  bool _isSubmitting = false;
  String? _submitMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form State Management')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Form progress indicator
              _buildProgressIndicator(),

              SizedBox(height: 24),

              // Personal Information Section
              _buildSectionHeader('Personal Information'),
              _buildNameField(),
              SizedBox(height: 16),
              _buildEmailField(),
              SizedBox(height: 16),
              _buildPhoneField(),
              SizedBox(height: 16),
              _buildCountryDropdown(),
              SizedBox(height: 16),
              _buildGenderSelection(),
              SizedBox(height: 16),
              _buildDatePicker(),
              SizedBox(height: 16),
              _buildAgeSlider(),

              SizedBox(height: 24),

              // Preferences Section
              _buildSectionHeader('Preferences'),
              _buildHobbiesSelection(),
              SizedBox(height: 16),
              _buildCheckboxes(),

              SizedBox(height: 24),

              // Submit button
              _buildSubmitButton(),

              // Submit message
              if (_submitMessage != null) ...[
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _submitMessage!.contains('Error') ? Colors.red[100] : Colors.green[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _submitMessage!,
                    style: TextStyle(
                      color: _submitMessage!.contains('Error') ? Colors.red[800] : Colors.green[800],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    double progress = _calculateFormProgress();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Form Progress: ${(progress * 100).toInt()}%'),
        SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ],
    );
  }

  double _calculateFormProgress() {
    int completedFields = 0;
    int totalFields = 8;

    if (_nameController.text.isNotEmpty) completedFields++;
    if (_emailController.text.isNotEmpty) completedFields++;
    if (_phoneController.text.isNotEmpty) completedFields++;
    if (_selectedCountry.isNotEmpty) completedFields++;
    if (_selectedDate != null) completedFields++;
    if (_hobbies.isNotEmpty) completedFields++;
    if (_agreeToTerms) completedFields++;
    if (_ageSlider > 18) completedFields++;

    return completedFields / totalFields;
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: 'Full Name *',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        if (value.length < 2) {
          return 'Name must be at least 2 characters';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {}); // Update progress
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email *',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!value.contains('@') || !value.contains('.')) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {}); // Update progress
      },
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(),
        hintText: '+62 812 3456 7890',
      ),
      onChanged: (value) {
        setState(() {}); // Update progress
      },
    );
  }

  Widget _buildCountryDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedCountry,
      decoration: InputDecoration(
        labelText: 'Country',
        prefixIcon: Icon(Icons.public),
        border: OutlineInputBorder(),
      ),
      items: _countries.map((country) {
        return DropdownMenuItem(
          value: country,
          child: Text(country),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedCountry = value!;
        });
      },
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gender', style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Row(
          children: _genders.map((gender) {
            return Expanded(
              child: RadioListTile<String>(
                title: Text(gender),
                value: gender,
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (date != null) {
          setState(() {
            _selectedDate = date;
          });
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Date of Birth',
          prefixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(),
        ),
        child: Text(
          _selectedDate != null
              ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
              : 'Select date',
        ),
      ),
    );
  }

  Widget _buildAgeSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Age: ${_ageSlider.toInt()}', style: TextStyle(fontSize: 16)),
        Slider(
          value: _ageSlider,
          min: 18,
          max: 80,
          divisions: 62,
          label: _ageSlider.toInt().toString(),
          onChanged: (value) {
            setState(() {
              _ageSlider = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildHobbiesSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hobbies', style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: _availableHobbies.map((hobby) {
            final isSelected = _hobbies.contains(hobby);
            return FilterChip(
              label: Text(hobby),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _hobbies.add(hobby);
                  } else {
                    _hobbies.remove(hobby);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCheckboxes() {
    return Column(
      children: [
        CheckboxListTile(
          title: Text('I agree to Terms and Conditions *'),
          value: _agreeToTerms,
          onChanged: (value) {
            setState(() {
              _agreeToTerms = value!;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          title: Text('Subscribe to newsletter'),
          value: _subscribeNewsletter,
          onChanged: (value) {
            setState(() {
              _subscribeNewsletter = value!;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: (_agreeToTerms && !_isSubmitting) ? _submitForm : null,
        child: _isSubmitting
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  SizedBox(width: 8),
                  Text('Submitting...'),
                ],
              )
            : Text('Submit Form'),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
        _submitMessage = null;
      });

      try {
        // Simulate API call
        await Future.delayed(Duration(seconds: 2));

        // Create form data
        final formData = {
          'name': _nameController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
          'country': _selectedCountry,
          'gender': _selectedGender,
          'dateOfBirth': _selectedDate?.toIso8601String(),
          'age': _ageSlider.toInt(),
          'hobbies': _hobbies,
          'agreeToTerms': _agreeToTerms,
          'subscribeNewsletter': _subscribeNewsletter,
        };

        setState(() {
          _isSubmitting = false;
          _submitMessage = 'Form submitted successfully!\nData: ${formData.toString()}';
        });

        // Clear form
        _clearForm();

      } catch (e) {
        setState(() {
          _isSubmitting = false;
          _submitMessage = 'Error submitting form: $e';
        });
      }
    }
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    setState(() {
      _selectedCountry = 'Indonesia';
      _selectedGender = 'Male';
      _agreeToTerms = false;
      _subscribeNewsletter = false;
      _selectedDate = null;
      _ageSlider = 25;
      _hobbies.clear();
    });
  }
}
```

---

## 📋 List State Management

### 🔄 **Dynamic List Operations**

```dart
class ListStateExample extends StatefulWidget {
  @override
  _ListStateExampleState createState() => _ListStateExampleState();
}

class _ListStateExampleState extends State<ListStateExample> {
  List<TodoItem> _todos = [
    TodoItem(id: 1, title: 'Learn Flutter', isCompleted: false, priority: Priority.high),
    TodoItem(id: 2, title: 'Build an app', isCompleted: false, priority: Priority.medium),
    TodoItem(id: 3, title: 'Share with friends', isCompleted: true, priority: Priority.low),
  ];

  final _titleController = TextEditingController();
  Priority _selectedPriority = Priority.medium;
  String _filter = 'All';
  String _sortBy = 'Date';

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredTodos = _getFilteredTodos();
    final sortedTodos = _getSortedTodos(filteredTodos);

    return Scaffold(
      appBar: AppBar(
        title: Text('List State Management'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _sortBy = value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'Date', child: Text('Sort by Date')),
              PopupMenuItem(value: 'Priority', child: Text('Sort by Priority')),
              PopupMenuItem(value: 'Alphabetical', child: Text('Sort Alphabetically')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Add new todo
          _buildAddTodoSection(),

          // Filter options
          _buildFilterSection(),

          // Statistics
          _buildStatistics(),

          // Todo list
          Expanded(
            child: sortedTodos.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    itemCount: sortedTodos.length,
                    itemBuilder: (context, index) {
                      final todo = sortedTodos[index];
                      return _buildTodoItem(todo, index);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildAddTodoSection() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Add new todo...',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              onSubmitted: (value) => _addTodo(),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: _addTodo,
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text('Filter: '),
          SizedBox(width: 8),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Active', 'Completed', 'High Priority', 'Medium Priority', 'Low Priority']
                    .map((filter) => Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(filter),
                            selected: _filter == filter,
                            onSelected: (selected) {
                              setState(() {
                                _filter = filter;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatistics() {
    final total = _todos.length;
    final completed = _todos.where((t) => t.isCompleted).length;
    final active = total - completed;

    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatCard('Total', total, Colors.blue),
          _buildStatCard('Active', active, Colors.orange),
          _buildStatCard('Completed', completed, Colors.green),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, int count, Color color) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, size: 80, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            'No todos found',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          Text(
            'Add a new todo to get started',
            style: TextStyle(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildTodoItem(TodoItem todo, int index) {
    return Dismissible(
      key: Key(todo.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        _deleteTodo(todo.id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${todo.title} deleted'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () => _undoDelete(todo, index),
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Checkbox(
            value: todo.isCompleted,
            onChanged: (value) => _toggleTodo(todo.id),
          ),
          title: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
              color: todo.isCompleted ? Colors.grey : null,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(
                _getPriorityIcon(todo.priority),
                size: 16,
                color: _getPriorityColor(todo.priority),
              ),
              SizedBox(width: 4),
              Text(
                todo.priority.name.toUpperCase(),
                style: TextStyle(
                  color: _getPriorityColor(todo.priority),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          trailing: PopupMenuButton(
            onSelected: (action) {
              switch (action) {
                case 'edit':
                  _editTodo(todo);
                  break;
                case 'delete':
                  _deleteTodo(todo.id);
                  break;
                case 'duplicate':
                  _duplicateTodo(todo);
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'edit', child: Text('Edit')),
              PopupMenuItem(value: 'duplicate', child: Text('Duplicate')),
              PopupMenuItem(value: 'delete', child: Text('Delete')),
            ],
          ),
        ),
      ),
    );
  }

  List<TodoItem> _getFilteredTodos() {
    switch (_filter) {
      case 'Active':
        return _todos.where((t) => !t.isCompleted).toList();
      case 'Completed':
        return _todos.where((t) => t.isCompleted).toList();
      case 'High Priority':
        return _todos.where((t) => t.priority == Priority.high).toList();
      case 'Medium Priority':
        return _todos.where((t) => t.priority == Priority.medium).toList();
      case 'Low Priority':
        return _todos.where((t) => t.priority == Priority.low).toList();
      default:
        return _todos;
    }
  }

  List<TodoItem> _getSortedTodos(List<TodoItem> todos) {
    switch (_sortBy) {
      case 'Priority':
        todos.sort((a, b) => a.priority.index.compareTo(b.priority.index));
        break;
      case 'Alphabetical':
        todos.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Date':
      default:
        // Keep original order (by creation date)
        break;
    }
    return todos;
  }

  void _addTodo() {
    if (_titleController.text.trim().isEmpty) return;

    setState(() {
      _todos.add(TodoItem(
        id: DateTime.now().millisecondsSinceEpoch,
        title: _titleController.text.trim(),
        isCompleted: false,
        priority: _selectedPriority,
      ));
    });

    _titleController.clear();
  }

  void _toggleTodo(int id) {
    setState(() {
      final index = _todos.indexWhere((t) => t.id == id);
      if (index != -1) {
        _todos[index] = _todos[index].copyWith(
          isCompleted: !_todos[index].isCompleted,
        );
      }
    });
  }

  void _deleteTodo(int id) {
    setState(() {
      _todos.removeWhere((t) => t.id == id);
    });
  }

  void _undoDelete(TodoItem todo, int originalIndex) {
    setState(() {
      _todos.insert(originalIndex, todo);
    });
  }

  void _editTodo(TodoItem todo) {
    _titleController.text = todo.title;
    _selectedPriority = todo.priority;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('Edit Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<Priority>(
                value: _selectedPriority,
                decoration: InputDecoration(labelText: 'Priority'),
                items: Priority.values.map((priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Text(priority.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (value) {
                  setDialogState(() {
                    _selectedPriority = value!;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_titleController.text.trim().isNotEmpty) {
                  setState(() {
                    final index = _todos.indexWhere((t) => t.id == todo.id);
                    if (index != -1) {
                      _todos[index] = _todos[index].copyWith(
                        title: _titleController.text.trim(),
                        priority: _selectedPriority,
                      );
                    }
                  });
                  _titleController.clear();
                  _selectedPriority = Priority.medium;
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _duplicateTodo(TodoItem todo) {
    setState(() {
      _todos.add(TodoItem(
        id: DateTime.now().millisecondsSinceEpoch,
        title: '${todo.title} (Copy)',
        isCompleted: false,
        priority: todo.priority,
      ));
    });
  }

  void _showAddTodoDialog() {
    _titleController.clear();
    _selectedPriority = Priority.medium;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('Add New Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                autofocus: true,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<Priority>(
                value: _selectedPriority,
                decoration: InputDecoration(labelText: 'Priority'),
                items: Priority.values.map((priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Row(
                      children: [
                        Icon(
                          _getPriorityIcon(priority),
                          color: _getPriorityColor(priority),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(priority.name.toUpperCase()),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setDialogState(() {
                    _selectedPriority = value!;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_titleController.text.trim().isNotEmpty) {
                  _addTodo();
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getPriorityIcon(Priority priority) {
    switch (priority) {
      case Priority.high:
        return Icons.arrow_upward;
      case Priority.medium:
        return Icons.remove;
      case Priority.low:
        return Icons.arrow_downward;
    }
  }

  Color _getPriorityColor(Priority priority) {
    switch (priority) {
      case Priority.high:
        return Colors.red;
      case Priority.medium:
        return Colors.orange;
      case Priority.low:
        return Colors.green;
    }
  }
}

// Data models
enum Priority { high, medium, low }

class TodoItem {
  final int id;
  final String title;
  final bool isCompleted;
  final Priority priority;

  TodoItem({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.priority,
  });

  TodoItem copyWith({
    int? id,
    String? title,
    bool? isCompleted,
    Priority? priority,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
    );
  }
}
```

---

## 🔗 State Sharing Between Widgets

### 📡 **Lifting State Up Pattern**

```dart
class StateSharingExample extends StatefulWidget {
  @override
  _StateSharingExampleState createState() => _StateSharingExampleState();
}

class _StateSharingExampleState extends State<StateSharingExample> {
  // Shared state - managed at parent level
  int _sharedCounter = 0;
  String _sharedMessage = 'Hello from parent!';
  List<String> _sharedItems = ['Item 1', 'Item 2'];
  bool _isDarkMode = false;

  // Methods to modify shared state
  void _incrementCounter() {
    setState(() {
      _sharedCounter++;
    });
  }

  void _updateMessage(String newMessage) {
    setState(() {
      _sharedMessage = newMessage;
    });
  }

  void _addItem(String item) {
    setState(() {
      _sharedItems.add(item);
    });
  }

  void _removeItem(int index) {
    setState(() {
      _sharedItems.removeAt(index);
    });
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white,
        appBar: AppBar(
          title: Text('State Sharing Example'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: _toggleDarkMode,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // State overview
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shared State Overview',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('Counter: $_sharedCounter'),
                      Text('Message: $_sharedMessage'),
                      Text('Items: ${_sharedItems.length}'),
                      Text('Dark Mode: $_isDarkMode'),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Child widgets that receive state and callbacks
              CounterWidget(
                counter: _sharedCounter,
                onIncrement: _incrementCounter,
              ),

              SizedBox(height: 16),

              MessageWidget(
                message: _sharedMessage,
                onMessageChanged: _updateMessage,
              ),

              SizedBox(height: 16),

              ItemListWidget(
                items: _sharedItems,
                onAddItem: _addItem,
                onRemoveItem: _removeItem,
              ),

              SizedBox(height: 16),

              // Multiple widgets sharing the same state
              Row(
                children: [
                  Expanded(
                    child: CounterDisplay(counter: _sharedCounter),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CounterControls(onIncrement: _incrementCounter),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Child widget that receives state and callbacks
class CounterWidget extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;

  const CounterWidget({
    Key? key,
    required this.counter,
    required this.onIncrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Counter Widget',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Current count: $counter'),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: onIncrement,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageWidget extends StatefulWidget {
  final String message;
  final Function(String) onMessageChanged;

  const MessageWidget({
    Key? key,
    required this.message,
    required this.onMessageChanged,
  }) : super(key: key);

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.message);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Message Widget',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Current message: ${widget.message}'),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'New message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    widget.onMessageChanged(_controller.text);
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemListWidget extends StatefulWidget {
  final List<String> items;
  final Function(String) onAddItem;
  final Function(int) onRemoveItem;

  const ItemListWidget({
    Key? key,
    required this.items,
    required this.onAddItem,
    required this.onRemoveItem,
  }) : super(key: key);

  @override
  _ItemListWidgetState createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item List Widget',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Items: ${widget.items.length}'),
            SizedBox(height: 8),

            // Add item section
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'New item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      widget.onAddItem(_controller.text.trim());
                      _controller.clear();
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Items list
            ...widget.items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return ListTile(
                title: Text(item),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => widget.onRemoveItem(index),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

// Separate display and control widgets
class CounterDisplay extends StatelessWidget {
  final int counter;

  const CounterDisplay({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Display Only'),
            SizedBox(height: 8),
            Text(
              counter.toString(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterControls extends StatelessWidget {
  final VoidCallback onIncrement;

  const CounterControls({Key? key, required this.onIncrement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Controls Only'),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: onIncrement,
              child: Text('+1'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 💾 State Persistence

### 💽 **SharedPreferences Example**

```dart
import 'package:shared_preferences/shared_preferences.dart';

class StatePersistenceExample extends StatefulWidget {
  @override
  _StatePersistenceExampleState createState() => _StatePersistenceExampleState();
}

class _StatePersistenceExampleState extends State<StatePersistenceExample> {
  // Persistent state variables
  int _persistentCounter = 0;
  String _persistentMessage = '';
  bool _isDarkMode = false;
  List<String> _favoriteItems = [];
  Map<String, dynamic> _userPreferences = {};

  @override
  void initState() {
    super.initState();
    _loadPersistedState();
  }

  // Load state from SharedPreferences
  Future<void> _loadPersistedState() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _persistentCounter = prefs.getInt('counter') ?? 0;
      _persistentMessage = prefs.getString('message') ?? 'No saved message';
      _isDarkMode = prefs.getBool('darkMode') ?? false;
      _favoriteItems = prefs.getStringList('favorites') ?? [];

      // Load complex data (JSON)
      final prefsJson = prefs.getString('userPreferences');
      if (prefsJson != null) {
        _userPreferences = Map<String, dynamic>.from(
          // In real app, use jsonDecode
          {'theme': 'blue', 'notifications': true}
        );
      }
    });
  }

  // Save individual values
  Future<void> _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', _persistentCounter);
  }

  Future<void> _saveMessage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('message', _persistentMessage);
  }

  Future<void> _saveDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', _isDarkMode);
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', _favoriteItems);
  }

  Future<void> _clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      _persistentCounter = 0;
      _persistentMessage = '';
      _isDarkMode = false;
      _favoriteItems.clear();
      _userPreferences.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('State Persistence'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: _clearAllData,
              tooltip: 'Clear All Data',
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info card
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'State Persistence Demo',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('This data survives app restarts using SharedPreferences'),
                      Text('Try closing and reopening the app to see persistence in action!'),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Persistent counter
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Persistent Counter',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('Count: $_persistentCounter'),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _persistentCounter++;
                              });
                              _saveCounter();
                            },
                            child: Text('+1'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _persistentCounter--;
                              });
                              _saveCounter();
                            },
                            child: Text('-1'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _persistentCounter = 0;
                              });
                              _saveCounter();
                            },
                            child: Text('Reset'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Persistent message
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Persistent Message',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('Current: $_persistentMessage'),
                      SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter message',
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (value) {
                          setState(() {
                            _persistentMessage = value;
                          });
                          _saveMessage();
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Dark mode toggle
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Theme Preference',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      SwitchListTile(
                        title: Text('Dark Mode'),
                        subtitle: Text('Theme preference is saved'),
                        value: _isDarkMode,
                        onChanged: (value) {
                          setState(() {
                            _isDarkMode = value;
                          });
                          _saveDarkMode();
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Favorite items
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Favorite Items',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Add favorite item',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.add),
                        ),
                        onSubmitted: (value) {
                          if (value.trim().isNotEmpty) {
                            setState(() {
                              _favoriteItems.add(value.trim());
                            });
                            _saveFavorites();
                          }
                        },
                      ),
                      SizedBox(height: 12),
                      if (_favoriteItems.isNotEmpty) ...[
                        Text('Saved favorites:'),
                        SizedBox(height: 8),
                        ...(_favoriteItems.asMap().entries.map((entry) {
                          final index = entry.key;
                          final item = entry.value;
                          return ListTile(
                            dense: true,
                            title: Text(item),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, size: 20),
                              onPressed: () {
                                setState(() {
                                  _favoriteItems.removeAt(index);
                                });
                                _saveFavorites();
                              },
                            ),
                          );
                        }).toList()),
                      ] else
                        Text('No favorites saved yet'),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Data overview
              Card(
                color: Colors.green[50],
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Persistence Overview',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('• Counter value is automatically saved'),
                      Text('• Message persists across app sessions'),
                      Text('• Theme preference is remembered'),
                      Text('• Favorite items list is maintained'),
                      Text('• All data survives app restarts'),
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

## 🎯 Common State Patterns

### 🔄 **Loading, Error, Success States**

```dart
enum DataState { loading, success, error, empty }

class StatePatternExample extends StatefulWidget {
  @override
  _StatePatternExampleState createState() => _StatePatternExampleState();
}

class _StatePatternExampleState extends State<StatePatternExample> {
  DataState _currentState = DataState.empty;
  List<String> _data = [];
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Common State Patterns')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Control buttons
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: _simulateLoading,
                  child: Text('Load Data'),
                ),
                ElevatedButton(
                  onPressed: _simulateSuccess,
                  child: Text('Success'),
                ),
                ElevatedButton(
                  onPressed: _simulateError,
                  child: Text('Error'),
                ),
                ElevatedButton(
                  onPressed: _simulateEmpty,
                  child: Text('Empty'),
                ),
              ],
            ),

            SizedBox(height: 16),

            // State indicator
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _getStateColor().withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _getStateColor()),
              ),
              child: Row(
                children: [
                  Icon(_getStateIcon(), color: _getStateColor()),
                  SizedBox(width: 8),
                  Text(
                    'Current State: ${_currentState.name.toUpperCase()}',
                    style: TextStyle(
                      color: _getStateColor(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Content based on state
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_currentState) {
      case DataState.loading:
        return _buildLoadingState();
      case DataState.success:
        return _buildSuccessState();
      case DataState.error:
        return _buildErrorState();
      case DataState.empty:
        return _buildEmptyState();
    }
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading data...'),
          SizedBox(height: 8),
          Text(
            'Please wait while we fetch your content',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data loaded successfully!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  title: Text(_data[index]),
                  subtitle: Text('Item ${index + 1} details'),
                  trailing: Icon(Icons.check_circle, color: Colors.green),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.red,
          ),
          SizedBox(height: 16),
          Text(
            'Oops! Something went wrong',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            _errorMessage ?? 'An unexpected error occurred',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _simulateLoading,
            icon: Icon(Icons.refresh),
            label: Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16),
          Text(
            'No data available',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'There\'s nothing to show here yet.\nTry loading some data!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _simulateLoading,
            icon: Icon(Icons.download),
            label: Text('Load Data'),
          ),
        ],
      ),
    );
  }

  Color _getStateColor() {
    switch (_currentState) {
      case DataState.loading:
        return Colors.blue;
      case DataState.success:
        return Colors.green;
      case DataState.error:
        return Colors.red;
      case DataState.empty:
        return Colors.grey;
    }
  }

  IconData _getStateIcon() {
    switch (_currentState) {
      case DataState.loading:
        return Icons.hourglass_empty;
      case DataState.success:
        return Icons.check_circle;
      case DataState.error:
        return Icons.error;
      case DataState.empty:
        return Icons.inbox;
    }
  }

  void _simulateLoading() async {
    setState(() {
      _currentState = DataState.loading;
      _errorMessage = null;
    });

    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Randomly succeed or fail
    if (DateTime.now().millisecond % 3 == 0) {
      _simulateError();
    } else {
      _simulateSuccess();
    }
  }

  void _simulateSuccess() {
    setState(() {
      _currentState = DataState.success;
      _data = List.generate(10, (index) => 'Data Item ${index + 1}');
      _errorMessage = null;
    });
  }

  void _simulateError() {
    setState(() {
      _currentState = DataState.error;
      _data.clear();
      _errorMessage = 'Failed to connect to server. Please check your internet connection and try again.';
    });
  }

  void _simulateEmpty() {
    setState(() {
      _currentState = DataState.empty;
      _data.clear();
      _errorMessage = null;
    });
  }
}
```

---

## ⚡ Performance Considerations

### 🚀 **Optimization Techniques**

```dart
class PerformanceExample extends StatefulWidget {
  @override
  _PerformanceExampleState createState() => _PerformanceExampleState();
}

class _PerformanceExampleState extends State<PerformanceExample> {
  int _rebuilds = 0;
  List<Item> _items = List.generate(100, (i) => Item(id: i, name: 'Item $i'));

  @override
  Widget build(BuildContext context) {
    _rebuilds++;
    print('🏗️ Parent rebuild #$_rebuilds');

    return Scaffold(
      appBar: AppBar(
        title: Text('Performance Optimization'),
        subtitle: Text('Rebuilds: $_rebuilds'),
      ),
      body: Column(
        children: [
          // Performance tips card
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.yellow[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.yellow[300]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Performance Tips',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('• Use const constructors when possible'),
                Text('• Extract widgets to avoid unnecessary rebuilds'),
                Text('• Use ListView.builder for large lists'),
                Text('• Minimize setState scope'),
                Text('• Use keys for efficient widget updates'),
              ],
            ),
          ),

          // Rebuild counter
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.refresh, color: Colors.blue),
                SizedBox(width: 8),
                Text('Parent rebuilds: $_rebuilds'),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Force rebuild
                    });
                  },
                  child: Text('Force Rebuild'),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Optimized vs Non-optimized comparison
          Expanded(
            child: Row(
              children: [
                // Non-optimized side
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.red[100],
                        child: Text(
                          '❌ Non-Optimized',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _items.length,
                          itemBuilder: (context, index) {
                            return NonOptimizedItem(
                              item: _items[index],
                              onTap: () => _updateItem(index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Container(width: 1, color: Colors.grey[300]),

                // Optimized side
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.green[100],
                        child: Text(
                          '✅ Optimized',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _items.length,
                          itemBuilder: (context, index) {
                            return OptimizedItem(
                              key: ValueKey(_items[index].id), // Key for efficient updates
                              item: _items[index],
                              onTap: () => _updateItem(index),
                            );
                          },
                        ),
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

  void _updateItem(int index) {
    setState(() {
      _items[index] = _items[index].copyWith(
        name: '${_items[index].name} (updated)',
      );
    });
  }
}

// Data model
class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});

  Item copyWith({int? id, String? name}) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

// ❌ Non-optimized widget - rebuilds unnecessarily
class NonOptimizedItem extends StatefulWidget {
  final Item item;
  final VoidCallback onTap;

  const NonOptimizedItem({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  _NonOptimizedItemState createState() => _NonOptimizedItemState();
}

class _NonOptimizedItemState extends State<NonOptimizedItem> {
  int _localRebuilds = 0;

  @override
  Widget build(BuildContext context) {
    _localRebuilds++;
    print('❌ NonOptimizedItem ${widget.item.id} rebuild #$_localRebuilds');

    return ListTile(
      title: Text(widget.item.name),
      subtitle: Text('Rebuilds: $_localRebuilds'),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: widget.onTap,
      ),
      // Expensive operation on every build
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: _calculateExpensiveColor(), // Expensive calculation
          shape: BoxShape.circle,
        ),
        child: Center(child: Text('${widget.item.id}')),
      ),
    );
  }

  // Expensive operation that runs on every build
  Color _calculateExpensiveColor() {
    var hash = 0;
    for (int i = 0; i < widget.item.name.length; i++) {
      hash = widget.item.name.codeUnitAt(i) + ((hash << 5) - hash);
    }
    return Color((hash & 0xFFFFFF) | 0xFF000000);
  }
}

// ✅ Optimized widget - uses const, memo, and efficient patterns
class OptimizedItem extends StatefulWidget {
  final Item item;
  final VoidCallback onTap;

  const OptimizedItem({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  _OptimizedItemState createState() => _OptimizedItemState();
}

class _OptimizedItemState extends State<OptimizedItem> {
  int _localRebuilds = 0;
  late Color _memoizedColor;

  @override
  void initState() {
    super.initState();
    _memoizedColor = _calculateColor();
  }

  @override
  void didUpdateWidget(OptimizedItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only recalculate if item actually changed
    if (oldWidget.item.name != widget.item.name) {
      _memoizedColor = _calculateColor();
    }
  }

  @override
  Widget build(BuildContext context) {
    _localRebuilds++;
    print('✅ OptimizedItem ${widget.item.id} rebuild #$_localRebuilds');

    return ListTile(
      title: Text(widget.item.name),
      subtitle: Text('Rebuilds: $_localRebuilds'),
      trailing: IconButton(
        icon: const Icon(Icons.edit), // const
        onPressed: widget.onTap,
      ),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: _memoizedColor, // Pre-calculated, memoized
          shape: BoxShape.circle,
        ),
        child: Center(child: Text('${widget.item.id}')),
      ),
    );
  }

  Color _calculateColor() {
    var hash = 0;
    for (int i = 0; i < widget.item.name.length; i++) {
      hash = widget.item.name.codeUnitAt(i) + ((hash << 5) - hash);
    }
    return Color((hash & 0xFFFFFF) | 0xFF000000);
  }
}
```

---

## 🛠️ Hands-on Projects

### 🎯 **Project 1: Shopping Cart App**

```dart
class ShoppingCartProject extends StatefulWidget {
  @override
  _ShoppingCartProjectState createState() => _ShoppingCartProjectState();
}

class _ShoppingCartProjectState extends State<ShoppingCartProject> {
  List<Product> _products = [
    Product(id: 1, name: 'Laptop', price: 999.99, image: '💻'),
    Product(id: 2, name: 'Mouse', price: 29.99, image: '🖱️'),
    Product(id: 3, name: 'Keyboard', price: 79.99, image: '⌨️'),
    Product(id: 4, name: 'Monitor', price: 299.99, image: '🖥️'),
    Product(id: 5, name: 'Headphones', price: 159.99, image: '🎧'),
  ];

  Map<int, int> _cart = {}; // productId -> quantity
  bool _isCheckingOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart Project'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: _showCartDialog,
              ),
              if (_totalItemsInCart > 0)
                Positioned(
                  right: 8,
                  top: 8,
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
                      '$_totalItemsInCart',
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
      ),
      body: Column(
        children: [
          // Cart summary
          if (_cart.isNotEmpty)
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.green[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cart: $_totalItemsInCart items',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Total: \$${_totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

          // Product list
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                final quantity = _cart[product.id] ?? 0;

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        // Product image
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              product.image,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),

                        SizedBox(width: 16),

                        // Product info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Quantity controls
                        if (quantity > 0) ...[
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline),
                                onPressed: () => _decrementQuantity(product.id),
                              ),
                              Text(
                                '$quantity',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                onPressed: () => _incrementQuantity(product.id),
                              ),
                            ],
                          ),
                        ] else ...[
                          ElevatedButton(
                            onPressed: () => _addToCart(product.id),
                            child: Text('Add to Cart'),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Checkout button
          if (_cart.isNotEmpty)
            Container(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isCheckingOut ? null : _checkout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: _isCheckingOut
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
                            Text('Processing...'),
                          ],
                        )
                      : Text(
                          'Checkout (\$${_totalPrice.toStringAsFixed(2)})',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  int get _totalItemsInCart {
    return _cart.values.fold(0, (sum, quantity) => sum + quantity);
  }

  double get _totalPrice {
    double total = 0;
    _cart.forEach((productId, quantity) {
      final product = _products.firstWhere((p) => p.id == productId);
      total += product.price * quantity;
    });
    return total;
  }

  void _addToCart(int productId) {
    setState(() {
      _cart[productId] = (_cart[productId] ?? 0) + 1;
    });
  }

  void _incrementQuantity(int productId) {
    setState(() {
      _cart[productId] = (_cart[productId] ?? 0) + 1;
    });
  }

  void _decrementQuantity(int productId) {
    setState(() {
      if (_cart[productId] != null && _cart[productId]! > 1) {
        _cart[productId] = _cart[productId]! - 1;
      } else {
        _cart.remove(productId);
      }
    });
  }

  void _showCartDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Shopping Cart'),
        content: Container(
          width: double.maxFinite,
          child: _cart.isEmpty
              ? Text('Your cart is empty')
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _cart.entries.map((entry) {
                    final product = _products.firstWhere((p) => p.id == entry.key);
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text('\$${product.price.toStringAsFixed(2)} x ${entry.value}'),
                      trailing: Text('\$${(product.price * entry.value).toStringAsFixed(2)}'),
                    );
                  }).toList(),
                ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
          if (_cart.isNotEmpty)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _checkout();
              },
              child: Text('Checkout'),
            ),
        ],
      ),
    );
  }

  void _checkout() async {
    setState(() {
      _isCheckingOut = true;
    });

    // Simulate checkout process
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isCheckingOut = false;
      _cart.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order placed successfully! 🎉'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });
}
```

---

## 🎓 Chapter Summary

Congratulations! Anda telah menguasai state management sederhana dengan Flutter:

### ✅ **What You've Mastered**
- **State Concepts**: Understanding state vs props, mutable vs immutable data
- **setState() Mastery**: Best practices, common mistakes, async handling
- **Data Flow**: Unidirectional data flow, lifting state up
- **Form Management**: Complex form state, validation, persistence
- **List Operations**: Dynamic lists, filtering, sorting, CRUD operations
- **State Sharing**: Parent-child communication, callback patterns
- **Persistence**: SharedPreferences, surviving app restarts
- **Performance**: Optimization techniques, efficient rebuilds

### 🎯 **Key Skills Acquired**
- **State Design**: Proper state architecture dan organization
- **Event Handling**: User interactions dan state updates
- **Data Modeling**: Creating robust data structures
- **Performance Awareness**: Minimizing unnecessary rebuilds
- **User Experience**: Loading states, error handling, feedback

### 🚀 **Ready for Advanced Topics**
Dengan state management fundamentals yang solid, Anda siap untuk:
- Navigation dan routing
- External data integration
- Testing dan debugging
- Real-world application development

---

<div align="center">

### 🎯 **Achievement Unlocked!**
![State Management Master Badge](../assets/badges/state-master.png)

**🔄 State Management Master** - Mastered Flutter State Management

---

**Ready to explore navigation and routing?**

[⬅️ Previous: Styling & Theming](07-styling-theming.md) | [➡️ Next: Navigation & Routing](09-navigasi-routing.md)

---

**💬 State Management Questions?** Check our [cheat sheets](cheat-sheets.md) atau open an [issue](../../issues)

</div>