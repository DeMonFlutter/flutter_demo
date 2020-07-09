import 'package:flutter/material.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class CustomScrollViewPage extends StatefulWidget {
  @override
  createState() => new CustomScrollViewPageState();
}

class CustomScrollViewPageState extends State<CustomScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              pinned: true, expandedHeight: 250, flexibleSpace: FlexibleSpaceBar(title: Text("CustomScrollView"), background: Image.asset("res/images/cover.jpg", fit: BoxFit
              .cover))),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(alignment: Alignment.center, color: Colors.cyan[100 * (index % 9)], child: Text("gird item $index"));
                }, childCount: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0, childAspectRatio: 4.0)),
          ),
          SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(alignment: Alignment.center, color: Colors.lightBlue[100 * (index % 9)], child: Text("list item $index"));
              }, childCount: 50))
        ],
      ),
    );
  }
}
