import 'package:flutter/material.dart';
import 'package:flutter_demo/Routes.dart';
import 'package:flutter_demo/module/provider/providerpub/MsgModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Routes.provides,
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.blue,
        ),
        //路由拦截，在routes查找不到时，会调用该方法
       /* onGenerateRoute: (RouteSettings settings) {
          String routeName = settings.name;
          print(routeName);
          WidgetBuilder builder = routes[routeName];
          if (routeName == "SaveWords") {
            builder = routes["/"];
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        }, */
        //注册路由表
        routes: Routes.routes,
        initialRoute: "/",
      ),
    );
  }
}
