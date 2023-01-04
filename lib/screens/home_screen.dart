import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          '오늘의 웹툰',
          style: GoogleFonts.nanumGothic(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        // FutureBuilder: 비동기 함수 실행 결과를 추적하고 실시간 반영해 빌드(랜더)하는 위젯 => 따라서, 플러터는 리액트처럼 state 애용 X
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('There is Data!');
            return Text('There is Data!');
          }
          print('Loading...');
          return Text('Loading...');
        },
      ),
    );
  }
}
