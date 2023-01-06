import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/decript_widget.dart';
import 'package:toonflix/widgets/episodes_widget.dart';
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

  // https://pub.dev/packages/shared_preferences
  // Shared preferences plugin => 플랫폼 고유의 영속적인 간편 저장소 제공
  // 비동기적으로 저장된 값을 저장/수정/조회할 수 있어, 마치 또 다른 서버에 접속하는 느낌을 준다.
  // 단, 이 저장소는 영구 지속성을 보증하지 않으므로, 중요 데이터 보관에 부적합하다.
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons =
        prefs.getStringList('likedToons'); // getStringList() 기본 초기값 null

    likedToons != null
        ? setState(() => isLiked = likedToons.contains(widget.id))
        : await prefs.setStringList('likedToons', []); // 초기화
  }

  void onHeartTab() async {
    final likedToons = prefs.getStringList('likedToons'); // 저장소 복사본

    if (likedToons != null) {
      isLiked ? likedToons.remove(widget.id) : likedToons.add(widget.id);
      await prefs.setStringList('likedToons', likedToons);
      setState(() => isLiked = !isLiked);
    }
  }

  // 초기화
  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
    initPrefs();
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
        actions: [
          IconButton(
            onPressed: onHeartTab,
            icon: isLiked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_outline_outlined),
          ),
        ],
        title: Text(
          widget.title, // 특정 state 가 보관된 인스턴스에 접근해 값을 가져온다.
          style: GoogleFonts.nanumGothic(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ThumbView(thumb: widget.thumb, id: widget.id),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Description(webtoon: webtoon),
              SizedBox(
                height: 25,
              ),
              Episodes(episodes: episodes, webtoonId: widget.id)
            ],
          ),
        ),
      ),
    );
  }
}
