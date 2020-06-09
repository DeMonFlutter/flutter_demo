import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PageBar.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class GobangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PageBar("Gobang"),
        body: Center(
          child: CustomPaint(
            size: Size(300, 300),
            painter: MyPainter(),
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    //画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Colors.yellow; //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 1.0;

    //画横线
    for (int i = 0; i <= 15; i++) {
      canvas.drawLine(Offset(0, eHeight * i), Offset(size.width, eHeight * i), paint);
    }
    //画竖线
    for (int i = 0; i <= 15; i++) {
      canvas.drawLine(Offset(eWidth * i, 0), Offset(eWidth * i, size.height), paint);
    }

    //画子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2), min(eWidth / 2, eHeight / 2) - 2, paint);

    paint.color = Colors.white;
    canvas.drawCircle(Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2), min(eWidth / 2, eHeight / 2) - 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
