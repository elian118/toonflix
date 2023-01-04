import 'package:flutter/material.dart';

class PageRouteWithAnimation {
  final Widget page;

  PageRouteWithAnimation(this.page);

  Route slideRightToLeft() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        // Offset 기준은 화면 왼쪽 위 끝을 (0, 0)으로 하고, y 좌표는 아래로 갈수록 값이 증가한다.
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(
          CurveTween(
            curve: curve,
          ),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route slideLeftToRight() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(
          CurveTween(
            curve: curve,
          ),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route slideBottomToTop() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      fullscreenDialog: true,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        var begin = Offset(0.0, 1.0); // y 좌표는 화면 맨 위부터 아래로 갈수록 증가하며, 맨 위가 0이다.
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(
          CurveTween(
            curve: curve,
          ),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route slideTopToBottom() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      fullscreenDialog: true,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        var begin = Offset(0.0, -1.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(
          CurveTween(
            curve: curve,
          ),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
