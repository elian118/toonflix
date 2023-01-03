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

  void onPlus() {
    setState(() {
      counter++;
    });
    /* 아래 코드도 같은 결과를 보인다.
      counter++;
      setState(() {}); // reload
    */
  }

  void onMinus() {
    setState(() {
      counter--;
    });
  }

  void init() {
    setState(() {
      counter = 0;
    });
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 40,
                    onPressed: onPlus,
                    icon: Icon(
                      Icons.add_circle,
                    ),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: onMinus,
                    icon: Icon(
                      Icons.remove_circle,
                    ),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: init,
                    icon: Icon(
                      Icons.settings_backup_restore,
                    ),
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
