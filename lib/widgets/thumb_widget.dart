import 'package:flutter/material.dart';

class ThumbView extends StatelessWidget {
  final String thumb;
  final String id;

  const ThumbView({
    Key? key,
    required this.id,
    required this.thumb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Container(
        width: 250,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: Offset(10, 10),
              color: Colors.black.withOpacity(0.5),
            )
          ],
        ),
        child: Image.network(thumb),
      ),
    );
  }
}
