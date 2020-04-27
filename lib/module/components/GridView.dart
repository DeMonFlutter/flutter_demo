import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PageBar.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class GridViewPage extends StatefulWidget {
  @override
  createState() => new GridViewPageState();
}

class GridViewPageState extends State<GridViewPage> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar("GridView"),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 1.0),
        itemBuilder: (context, index) {
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        },
        itemCount: _icons.length,
      ),
    );
  }

  void _retrieveIcons() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _icons.addAll([Icons.ac_unit, Icons.airport_shuttle, Icons.all_inclusive, Icons.beach_access, Icons.cake, Icons.free_breakfast]);
      });
    });
  }
}
