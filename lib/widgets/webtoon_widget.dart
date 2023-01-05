import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';
import 'package:toonflix/widgets/page_route_with_animation.dart';
import 'package:toonflix/widgets/thumb_widget.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
          DetailScreen(
            title: title,
            thumb: thumb,
            id: id,
          ),
        );
        Navigator.push(
          context,
          pageRouteWithAnimation.slideBottomToTop(),
        );
      },
      child: Column(
        children: [
          ThumbView(thumb: thumb, id: id),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
