import 'package:flutter/material.dart';
import 'package:flutter_demo/module/components/dio/DioDownload.dart';
import 'package:flutter_demo/module/components/dio/DioGet.dart';
import 'package:flutter_demo/module/components/dio/DioPost.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class DioPage extends StatefulWidget {
  @override
  createState() => new DioPageState();
}

class DioPageState extends State<DioPage> with SingleTickerProviderStateMixin {
  String title = "Dio网络请求";

  List tabs = ["get", "post", "download"];
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
        title: Text(title),
        bottom: TabBar(controller: _tabController, tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[DioGetPage(), DioPostPage(), DioDownloadPage()],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            title += ".";
          });
        },
      ),
    );
  }
}
