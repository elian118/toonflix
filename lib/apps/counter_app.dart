import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _StfAppState();
}

class _StfAppState extends State<CounterApp> {
  int counter = 0;
  List<int> numbers = [];

  void plus() {
    counter++;
    setState(() {});
  }

  void minus() {
    counter--;
    setState(() {});
  }

  void addNum() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  void clearNums() {
    setState(() {
      numbers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 40,
                    onPressed: minus,
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(
                    '$counter',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: plus,
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Add Numbers',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 40,
                    onPressed: clearNums,
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: addNum,
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
              ),
              Column(
                children: numbers.map((num) => Text('$num')).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
