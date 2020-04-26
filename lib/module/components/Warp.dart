import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PageBar.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class WarpPage extends StatefulWidget {
  @override
  createState() => WarpPageState();
}

class WarpPageState extends State<WarpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PageBar("Warp"),
        body: Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.start, //沿主轴方向居中
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
              label: Text('Hamilton'),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
              label: Text('Lafayette'),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
              label: Text('Mulligan'),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
              label: Text('Laurens'),
            ),
          ],
        ));
  }
}
