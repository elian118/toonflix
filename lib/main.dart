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
        backgroundColor: const Color(0xFF181818), // 16진수 색상 설정
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20
          ), // 수평 오프셋 20 지정
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                          'Hey, Elian',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          )
                      ),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.8), // RGB색상 설정
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text(
                  'Total Balance',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '\$5 194 382',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2B33A),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 45,
                      ),
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 45,
                      ),
                      child: Text(
                        'Request',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    ); // 디자인 시스템 선택: MaterialApp -> android, CupertinoApp -> iOS. 플러터는 같은 구글에서 만든 MaterialApp 호환도가 더 높고 안정적이다.
  }

}
