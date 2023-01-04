import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

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
            return Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 40,
      ),
    );
  }
}

/*
  ListView: 배열 데이터를 목록 형태로 빌드하는 위젯. 스크롤 기능이 화면에 자동 부여한다.
  ListView.builder: 페이징 등 최적화가 가능한 옵션 다수 제공
  ListView.separated: builder 메서드와 거의 동일하나, 필수인수로 separatorBuilder 추가 요구
*/
