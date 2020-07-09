import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PageBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class WebViewPage extends StatefulWidget {
  @override
  createState() => new WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar("WebView"),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          WebView(
            initialUrl: "https://www.baidu.com/",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageStarted: (url) {
              print('Page started loading: $url');
            },
            onPageFinished: (url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                child: NavigationControls(_controller.future),
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture) : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
        future: _webViewControllerFuture,
        builder: (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
          //final bool webViewReady = snapshot.connectionState == ConnectionState.done;
          final WebViewController controller = snapshot.data;
          return Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () async {
                      if (await controller.canGoBack()) {
                        await controller.goBack();
                      }
                    }),
                IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () async {
                      if (await controller.canGoForward()) {
                        await controller.goForward();
                      }
                    }),
                IconButton(
                    icon: const Icon(Icons.replay),
                    onPressed: () async {
                      await controller.reload();
                    })
              ],
            ),
          );
        });
  }
}
