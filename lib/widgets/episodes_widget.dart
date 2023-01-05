import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/widgets/episode_widget.dart';

class Episodes extends StatelessWidget {
  final Future<List<WebtoonEpisodeModel>> episodes;
  final String webtoonId;

  const Episodes({
    Key? key,
    required this.episodes,
    required this.webtoonId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: episodes,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // 데이터량이 많지 않을 거란 확신이 있다면, 최적화에 특화된 ListView 쓰지 않아도 된다.
          return Column(
            children: [
              for (var episode in snapshot.data!)
                Episode(episode: episode, webtoonId: webtoonId),
            ],
          );
        }
        return Container();
      },
    );
  }
}
