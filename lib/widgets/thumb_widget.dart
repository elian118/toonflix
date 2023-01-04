import 'package:flutter/material.dart';

class ThumbView extends StatelessWidget {
  const ThumbView({
    Key? key,
    required this.thumb,
  }) : super(key: key);

  final String thumb;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
