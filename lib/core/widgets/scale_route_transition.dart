import 'package:flutter/cupertino.dart';

class ScaleRouteTransition extends PageRouteBuilder {
  final Widget screen;
  final double posX;
  final double posY;

  ScaleRouteTransition({
    this.screen,
    this.posX,
    this.posY,
  }) : super(
          transitionDuration: Duration(milliseconds: 330),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              screen,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            alignment: Alignment(posX, posY),
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          ),
        );
}
