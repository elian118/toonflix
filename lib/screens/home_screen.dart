import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSecond = 1500;
  bool isRunning = false;
  late Timer timer;

  // 콜백: 오류 방지를 위해, 실제로는 사용하지도 않을 Timer 인수 추가
  void onTick(Timer timer) {
    setState(() {
      totalSecond = isRunning ? totalSecond - 1 : totalSecond;
    });
  }

  void onStartPress() {
    // 아래 Timer 위젯은 플러터에서 기본 제공하며, 자바스크립트의 setInterval()과 같다.
    timer = Timer.periodic(
      Duration(seconds: 1),
      onTick, // 두 번째 인자로 들어갈 콜백은 Timer 인수를 꼭 받아야 하지만, 여기서는 넘길 이유가 없다.
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel(); // 자바스크립트의 clearInterval()과 같다.
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '$totalSecond',
                style: TextStyle(
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                color: Theme.of(context).cardColor,
                iconSize: 120,
                icon: isRunning
                    ? Icon(Icons.play_circle_outline)
                    : Icon(Icons.pause_circle_filled_outlined),
                onPressed: isRunning ? onPausePressed : onStartPress,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1?.color,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1?.color,
                          ),
                        ),
                      ],
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
}
