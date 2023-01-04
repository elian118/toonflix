import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  // final 을 붙여야 HomeScreen 에 뜬 경고가 사라진다.
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
      // FutureBuilder: 비동기 함수 실행 결과를 추적하고 실시간 반영해 빌드(랜더)하는 위젯 => 따라서, 플러터는 리액트처럼 state 애용 X
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // ListView: 배열 데이터를 목록 형태로 빌드하는 위젯. 스크롤 기능이 화면에 자동 부여한다.
            // ListView.builder: 페이징 등 최적화가 가능한 옵션 다수 제공
            // ListView.separated: builder 메서드와 인수가 거의 동일하고, separatorBuilder 를 추가 필수 인수로 요구한다.
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              // itemBuilder: 사용자가 현재 보려는 아이템만 실시간 빌드하는 옵션
              itemBuilder: (context, index) {
                print('built index: $index'); // 실시간 빌드 여부 확인
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              // separatorBuilder: 요소 구분자(스타일 래퍼) 빌더
              separatorBuilder: (context, index) => SizedBox(
                width: 20, // 요소 간 간격 20 부여 => 처음과 끝은 자동 생략 처리
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
