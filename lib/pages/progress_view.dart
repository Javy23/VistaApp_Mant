import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvp_all/style/colors/colors_views.dart';
import 'package:mvp_all/painters/progress_painter.dart';

class ProgressView extends StatefulWidget {
  const ProgressView({Key key}) : super(key: key);

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {
  int porcentaje = 0;
  Timer timer;
  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsSelect.fondo,
      child: Center(
        child: SizedBox(
          width: 120,
          height: 120,
          child: CustomPaint(
            painter: ProgressPainter(porcentaje),
          ),
        ),
      ),
    );
  }

  void load() {
    timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      setState(() {
        if (porcentaje < 100) {
          porcentaje += 1;
        } else {
          timer.cancel();
          Navigator.of(context).pushNamed('/home');
          //load();
          porcentaje = 0;
        }
      });
    });
  }
}
