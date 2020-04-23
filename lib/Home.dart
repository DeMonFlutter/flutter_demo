import 'package:flutter/material.dart';
import 'package:flutter_demo/RandomWords.dart';
import 'package:flutter_demo/Timer.dart';
import 'package:flutter_demo/widget/PageBar.dart';

import 'widget/Button.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar("Home"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Button(
              "RandomWords",
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RandomWords();
                }));
              },
            ),
            Button(
              "Timer",
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TimerPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
