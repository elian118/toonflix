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
  List<int> numbers = [];

  void addNum() {
    setState(() {
      numbers.length <= 10 ? numbers.add(numbers.length) : null;
    });
  }

  void clearNums() {
    setState(() {
      numbers = [];
    });
  }

  void onPlus() {
    setState(() {
      counter++;
    });
    /* 아래 코드도 같은 결과를 보인다. -> 가독성이 별로다.
      counter++;
      setState(() {}); // reload => build 메서드 재실행
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$counter',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    width: numbers.isNotEmpty ? 10 : 0,
                  ),
                  for (var n in numbers) Text('$n, '),
                ],
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
                  IconButton(
                    iconSize: 40,
                    onPressed: addNum,
                    icon: Icon(
                      Icons.playlist_add,
                    ),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: clearNums,
                    icon: Icon(
                      Icons.playlist_remove,
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
