import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class ProgressPage extends StatefulWidget {
  @override
  createState() => new ProgressPageState();
}

class ProgressPageState extends State<ProgressPage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitRotatingCircle(color: Colors.blue, size: 100.0);
    final bodys = <Widget>[
      Padding(
        padding: EdgeInsets.all(28.0),
        child: spinkit,
      ),
      Padding(
        padding: EdgeInsets.all(28.0),
        child: LinearProgressIndicator(backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(Colors.blue)),
      ),
      Padding(
        padding: EdgeInsets.all(28.0),
        child: LinearProgressIndicator(backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(Colors.blue), value: 0.5),
      ),
      Padding(
        padding: EdgeInsets.all(28.0),
        child: CircularProgressIndicator(backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(Colors.blue)),
      ),
      Padding(
        padding: EdgeInsets.all(28.0),
        child: CircularProgressIndicator(backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(Colors.blue), value: 0.5),
      ),
      Padding(
          padding: EdgeInsets.all(28.0),
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.red, end: Colors.blue).animate(_animationController),
              value: _animationController.value,
            ),
          )),
    ];
    return CenterScaffold("Progress", bodys);
  }
}
