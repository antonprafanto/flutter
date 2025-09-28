import 'package:flutter/material.dart';
import '../widgets/counter_display.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _animateButton();
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    _animateButton();
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _animateButton();
  }

  void _animateButton() {
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
  }

  Color _getCounterColor() {
    if (_counter > 0) return Colors.green;
    if (_counter < 0) return Colors.red;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: _getCounterColor(),
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
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: CounterDisplay(
                    counter: _counter,
                    color: _getCounterColor(),
                  ),
                );
              },
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                  backgroundColor: Colors.red,
                  heroTag: "decrement",
                ),
                FloatingActionButton.extended(
                  onPressed: _resetCounter,
                  tooltip: 'Reset',
                  label: Text('RESET'),
                  icon: Icon(Icons.refresh),
                  backgroundColor: Colors.grey,
                  heroTag: "reset",
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                  backgroundColor: Colors.green,
                  heroTag: "increment",
                ),
              ],
            ),
            SizedBox(height: 30),
            _buildCounterInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterInfo() {
    String message;
    IconData icon;
    Color color = _getCounterColor();

    if (_counter > 0) {
      message = 'Positive number! 📈';
      icon = Icons.trending_up;
    } else if (_counter < 0) {
      message = 'Negative number! 📉';
      icon = Icons.trending_down;
    } else {
      message = 'Zero - perfectly balanced! ⚖️';
      icon = Icons.balance;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          SizedBox(width: 10),
          Text(
            message,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}