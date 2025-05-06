import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterHookApp extends HookWidget {
  const CounterHookApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    final numbers = useState<List<int>>([]);

    void plus() => counter.value++;

    void minus() => counter.value--;

    void addNum() => numbers.value = [...numbers.value, numbers.value.length];

    void clearNums() => numbers.value = [];

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
                    counter.value.toString(),
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
                children: numbers.value.map((num) => Text('$num')).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
