import 'package:flutter/material.dart';

import 'PageBar.dart';

/// @author DeMon
/// Created on 2020/4/24.
/// E-mail 757454343@qq.com
/// Desc:
class CenterScaffold extends Scaffold {
  CenterScaffold(String title, List<Widget> childrens)
      : super(
          appBar: PageBar(title),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: childrens,
                ),
              ),
            ),
          ),
        );
}
