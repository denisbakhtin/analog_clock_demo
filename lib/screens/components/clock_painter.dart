import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    //Minute calculation
    double minX = centerX +
        size.width * 0.35 * cos((dateTime.minute * 6 - 90) * pi / 180);
    double minY = centerY +
        size.width * 0.35 * sin((dateTime.minute * 6 - 90) * pi / 180);

    //minute line
    canvas.drawLine(
      center,
      Offset(minX, minY),
      Paint()
        ..color = Theme.of(context).accentColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10
        ..strokeCap = StrokeCap.round,
    );

    //hour calculation
    //dateTime.hour * 30 -> 30 degrees per hour
    //+ dateTime.minute * 0.5 -> 30 degrees / 60 minutes per hour -> angle offset depending on minute
    double hourX = centerX +
        size.width *
            0.28 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5 - 90) * pi / 180);
    double hourY = centerY +
        size.width *
            0.28 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5 - 90) * pi / 180);

    //hour line
    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      Paint()
        ..color = Theme.of(context).colorScheme.secondary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10
        ..strokeCap = StrokeCap.round,
    );

    //second calculation
    //size.width * 0.4 defines line length
    //dateTime.second * 6 because 360 / 60 = 6 -> 6 degrees per second
    //dateTime.second * 6 - 90 -> minus 90 states that we want 0 degrees to be on 12 hour position,
    //by default it is on 3 hours
    //cos((dateTime.second * 6 - 90) * pi / 180) - angle projection on X axis
    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6 - 90) * pi / 180);
    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6 - 90) * pi / 180);

    //second line
    canvas.drawLine(
      center,
      Offset(secondX, secondY),
      Paint()
        ..color = Theme.of(context).primaryColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round,
    );

    //center Dots
    Paint dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color;
    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(
        center, 23, Paint()..color = Theme.of(context).backgroundColor);
    canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
