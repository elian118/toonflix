import 'package:flutter/material.dart';

class PageRouteWithAnimation {
  final Widget page;

  PageRouteWithAnimation(this.page);

  makeSlideAnimation({required double dx, required double dy}) =>
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        fullscreenDialog: true,
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          var begin = Offset(dx, dy);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );

  Route slideRightToLeft() => makeSlideAnimation(dx: 1.0, dy: 0.0);

  Route slideLeftToRight() => makeSlideAnimation(dx: -1.0, dy: 0.0);

  Route slideBottomToTop() => makeSlideAnimation(dx: 0.0, dy: 1.0);

  Route slideTopToBottom() => makeSlideAnimation(dx: 0.0, dy: -1.0);
}
