import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';

import '../models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final List<dynamic> webtoons = jsonDecode(response.body);
        webtoons.forEach((webtoon) {
          // final webtoonInstance = WebtoonModel.fromJson(webtoon);
          // print(webtoonInstance.toString());
          // webtoonInstances.add(webtoonInstance);
          webtoonInstances.add(WebtoonModel.fromJson(webtoon));
        });
      } else {
        print('요청 실패: $response.statusCode');
      }
      return webtoonInstances;
    } catch (err) {
      print('예외: $err');
      throw Error();
    } finally {
      print('오늘의 웹툰 데이터 가져오기 완료');
    }
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final webtoon = jsonDecode(response.body);
        return WebtoonDetailModel.fromJson(webtoon);
      } else {
        print('요청 실패: $response.statusCode');
        throw Error();
      }
    } catch (err) {
      print('예외: $err');
      throw Error();
    } finally {
      print('웹툰 상세 데이터 가져오기 완료');
    }
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final List<dynamic> episodes = jsonDecode(response.body);
        episodes.forEach((episode) {
          episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
        });
        return episodesInstances;
      } else {
        print('요청 실패: $response.statusCode');
        throw Error();
      }
    } catch (err) {
      print('예외: $err');
      throw Error();
    } finally {
      print('최근 웹툰 에피소드 목록 데이터 가져오기 완료');
    }
  }
}
