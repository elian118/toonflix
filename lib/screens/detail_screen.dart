import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/thumb_widget.dart';

import '../models/webtoon_detail_model.dart';

// Api 호출 시 특정 파라미터를 입력해야 할 경우,
// StatefulWidget 의 멤버상수를 state 로 가져와 사용해야 한다.
class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  // 화면에서는 지정된 위치에 사용자가 확인할 state 를 보유한
  // 여러 State 상속 클래스가 계속해서 생성 및 교체되는 식으로 빌드된다.
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

// 제네릭 State 를 상속하면 해당 클래스 멤버번수가 state 화되고, widget 으로 접근 가능하다.(this 와 구분)
class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  // 초기화
  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

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
          widget.title, // 특정 state 가 보관된 인스턴스에 접근해 값을 가져온다.
          style: GoogleFonts.nanumGothic(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ThumbView(thumb: widget.thumb, id: widget.id),
            ],
          ),
        ],
      ),
    );
  }
}
