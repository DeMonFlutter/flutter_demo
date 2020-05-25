import 'package:flutter/material.dart';
import 'package:flutter_demo/Routes.dart';
import 'package:flutter_demo/module/theme/ColorModel.dart';
import 'package:provider/provider.dart';

import 'module/provider/providerpub/MsgModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MsgModel()),
        ChangeNotifierProvider(create: (_) => ColorModel()),
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorModel model = Provider.of<ColorModel>(context);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: model.themeColor,
        primaryColorDark: model.themeColorDark,
        accentColor: model.themeColor,
        iconTheme: IconThemeData(color: model.themeColor),
      ),
      routes: Routes.routes,
      initialRoute: "/",
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
    );
  }
}
