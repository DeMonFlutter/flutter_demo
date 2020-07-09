import 'package:flutter/material.dart';
import 'package:flutter_demo/Routes.dart';
import 'package:flutter_demo/widget/GradientButton.dart';
import 'package:flutter_demo/widget/PageBar.dart';


/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = <String>[];
    Routes.routes.forEach((e, s) {
      if (!e.startsWith("/")) {
        list.add(e);
      }
    });
    return Scaffold(
      appBar: PageBar("Home"),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3.5,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: GradientButton(list[index], onPressed: () {
              Navigator.pushNamed(context, list[index]);
            }),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
