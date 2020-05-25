import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'MainDrawer.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class ScaffoldPage extends StatefulWidget {
  @override
  createState() => new ScaffoldPageState();
}

class ScaffoldPageState extends State<ScaffoldPage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  List tabs = ["新闻", "历史", "图片"];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        actions: <Widget>[IconButton(icon: Icon(Icons.share), onPressed: () {})],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: MainDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(alignment: Alignment.center, child: Text(e, textScaleFactor: 5));
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text("Business")),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("School")),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
    );
  }

  void _onItemTapped(int index) {
    _tabController.index = index;
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}
