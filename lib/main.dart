import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

// 루트 위젯 -> StatelessWidget 상속: 화면에 띄워주는 것 외엔 특별한 추가 기능 없는 위젯
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 10,
          title: Text('Hello Flutter!'),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    ); // 디자인 시스템 선택: MaterialApp -> android, CupertinoApp -> iOS. 플러터는 같은 구글에서 만든 MaterialApp 호환도가 더 높고 안정적이다.
  }

}
