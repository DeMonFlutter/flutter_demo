import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/Button.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';
import 'package:web_socket_channel/io.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class SocketPage extends StatefulWidget {
  @override
  createState() => new SocketPageState();
}

class SocketPageState extends State<SocketPage> {
  IOWebSocketChannel channel;
  String _text = "";
  String sendText = "";

  @override
  void initState() {
    super.initState();
    channel = new IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  Widget build(BuildContext context) {
    return CenterScaffold("WebSocket", <Widget>[
      TextField(onChanged: (value) {
        sendText = value;
      }),
      Button(context, "Send", onPressed: () {
        _sendMessage();
      }),
      StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          //网络不通会走到这
          if (snapshot.hasError) {
            _text = "网络不通...";
          } else if (snapshot.hasData) {
            _text = "echo: " + snapshot.data;
          }
          return Text(_text);
        },
      )
    ]);
  }

  void _sendMessage() {
    if (sendText.isNotEmpty) {
      channel.sink.add(sendText);
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
