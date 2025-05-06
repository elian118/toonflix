import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_services.dart';
import 'package:toonflix/widgets/episode.dart';

import '../models/webtoon_episode_model.dart';

class DetailHookScreen extends HookWidget {
  final WebtoonModel webtoon;

  const DetailHookScreen({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    final detail = useState<Future<WebtoonDetailModel>?>(null);
    final episodes = useState<Future<List<WebtoonEpisodeModel>>?>(null);
    final prefs = useState<SharedPreferences?>(null);
    final isLiked = useState<bool>(false);

    Future initPrefs() async {
      final instance = await SharedPreferences.getInstance();
      prefs.value = instance;
      final likedToons = instance.getStringList('likedToons');
      if (likedToons != null) {
        if (likedToons.contains(webtoon.id) == true) {
          isLiked.value = true;
        }
      } else {
        await instance.setStringList('likedToons', []);
      }
    }

    void onHeartTab() async {
      final likedToons = prefs.value?.getStringList('likedToons');
      if (likedToons != null) {
        isLiked.value
            ? likedToons.remove(webtoon.id)
            : likedToons.add(webtoon.id);
        await prefs.value?.setStringList('likedToons', likedToons);
        isLiked.value = !isLiked.value;
      }
    }

    useEffect(() {
      detail.value = ApiService.getToonById(webtoon.id);
      episodes.value = ApiService.getLatestEpisodesById(webtoon.id); // 최대 10개
      initPrefs();
      return null;
    }, [webtoon.id]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: onHeartTab,
            icon: isLiked.value
                ? const Icon(Icons.favorite_rounded)
                : const Icon(Icons.favorite_outline_outlined),
          )
        ],
        title: Text(
          webtoon.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: webtoon.id,
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Image.network(
                        webtoon.thumb,
                        headers: const {
                          "User-Agent":
                              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, lilke Gecko)"
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: detail.value,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '${snapshot.data!.genre} | ${snapshot.data!.age}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  }
                  return const Text('...');
                },
              ),
              const SizedBox(height: 25),
              FutureBuilder(
                future: episodes.value,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        ...snapshot.data!.map(
                          (episode) =>
                              Episode(webtoonId: webtoon.id, episode: episode),
                        ),
                      ],
                    );
                  }
                  return const LinearProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
