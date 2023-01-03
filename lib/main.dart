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
  bool showTitle = true; // 초기값

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle
                  ? MyLargeTitle()
                  : Text(
                      'nothing'), // showTitle == false 일때, MyLargeTitle 가 사라진다. => MyLargeTitle.dispose 메서드 실행
              IconButton(
                onPressed: toggleTitle,
                icon: Icon(Icons.remove_red_eye),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  // State.initState(), State.dispose() 메서드는 부모 클래스의 state를 변경하고자 할 때 주로 사용된다.
  // 이는 리액트에서 자식 컴포넌트가 컴포넌트 생명주기를 활용해 useEffect()로 부모의 컨텍스트 state 를 변경하는 방법과 같다.

  // 클래스(컴포넌트) 빌드 직전에 수행 -> 반드시 build 보다 앞에 위치해야 한다. => useEffect(() => { 초기화 함수 }, []);
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  // 클래스(컴포넌트)가 화면에서 제거될 때 수행 => useEffect(() => () => { ... return () => 컴포넌트 파괴 시 수행될 함수 }, []);
  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context)
            .textTheme
            .titleLarge
            ?.color, // 컨텍스트로부터 최상위 부모 위젯에 선언된 테마의 특정(큰타이틀 색상) 값 참조.
      ),
    );
  }
}
