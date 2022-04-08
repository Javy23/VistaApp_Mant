import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all/style/colors/colors_views.dart';

class ProgressPainter extends CustomPainter {
  ProgressPainter(this.porcentaje1);
  var porcentaje1 = 0;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.strokeWidth = 4;
    paint.color = ColorsSelect.txtBoHe;
    paint.style = PaintingStyle.stroke;

    Offset offset = Offset(size.width * .5, size.height * .5);
    double radius = size.width / 2;
    canvas.drawCircle(offset, radius, paint);

    final load = Paint();
    load.strokeWidth = 4;
    load.color = ColorsSelect.paginatorNext;
    load.style = PaintingStyle.stroke;

    double porcentaje = pi * 2 * (porcentaje1 / 100.0);
    Rect rect = Rect.fromCircle(center: offset, radius: radius);
    canvas.drawArc(rect, -pi / 2, porcentaje, false, load);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
