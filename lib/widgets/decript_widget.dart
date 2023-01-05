import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.webtoon,
  }) : super(key: key);

  final Future<WebtoonDetailModel> webtoon;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: webtoon,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                snapshot.data!.about,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '${snapshot.data!.genre} / ${snapshot.data!.age}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          );
        }
        return Text('...');
      },
    );
  }
}
