import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class ImageViewPage extends StatefulWidget {
  @override
  createState() => new ImageViewPageState();
}

class ImageViewPageState extends State<ImageViewPage> {
  @override
  Widget build(BuildContext context) {
    var imgs = <Image>[
      Image.asset("images/avatar.png", width: 150.0),
      Image.network("http://q8xcfpnt5.bkt.clouddn.com/timg.jpg", width: 150.0),
      Image(image: AssetImage("images/avatar.png"), width: 100.0, color: Colors.blue, colorBlendMode: BlendMode.difference),
      Image(image: AssetImage("images/avatar.png"), width: 100.0, height: 300.0, repeat: ImageRepeat.repeatY)
    ];
    return CenterScaffold(
        "ImageView",
        imgs.map((e) {
          return Row(children: <Widget>[Padding(padding: EdgeInsets.all(16.0), child: SizedBox(child: e))]);
        }).toList());
  }
}
