import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PageBar.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class ScrollControllerPage extends StatefulWidget {
  @override
  createState() => new ScrollControllerPageState();
}

class ScrollControllerPageState extends State<ScrollControllerPage> {
  var _controller = ScrollController();
  bool isShow = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && isShow) {
        setState(() {
          isShow = false;
        });
      } else if (_controller.offset >= 1000 && isShow == false) {
        setState(() {
          isShow = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar("ScrollController"),
      body: Scrollbar(
        child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(title: Text("$index"));
            },
            itemCount: 50,
            itemExtent: 50.0,
            controller: _controller),
      ),
      floatingActionButton: !isShow
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0.0, duration: Duration(microseconds: 500), curve: Curves.ease);
              },
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
