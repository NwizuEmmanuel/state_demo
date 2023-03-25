import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Flutter state demo',
            ),
          ),
          body: const CounterWidget()),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;
  bool _isMoreThanOne = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
                'You have clicked me $_count time${_isMoreThanOne ? "s" : ''}'),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: _increment,
              child: const Text('click me'),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: _reset,
              child: const Text('reset'),
            )
          ])
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      _count += 1;
      if (_count >= 2) {
        _isMoreThanOne = true;
      }
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
      _isMoreThanOne = false;
    });
  }
}
