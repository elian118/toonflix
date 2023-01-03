import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

// 루트 위젯 -> StatelessWidget 상속: 화면에 띄워주는 것 외엔 특별한 추가 기능 없는 위젯
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onClicked() {
    counter++;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                '$counter',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: Icon(
                  Icons.add_box_rounded,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
