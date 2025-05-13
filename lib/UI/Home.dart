import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onIncrement;
  final int counter;

  const HomeScreen({super.key, required this.onIncrement, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: onIncrement,
            child: const Text("Raise"),
          ),
          const SizedBox(width: 12),
          Text(
            'Count: $counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
