import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';

import 'ChangeNotifierProvider.dart';
import 'Consumer.dart';
import 'CartModel.dart';
import 'Item.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class CartPage extends StatefulWidget {
  @override
  createState() => new CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: CenterScaffold("Cart", <Widget>[
          Builder(builder: (context) {
            return Consumer<CartModel>(builder: (context, cart) => Text("总价: ${cart.totalPrice}"));
          }),
          Builder(builder: (context) {
            print("RaisedButton build"); //在后面优化部分会用到
            return RaisedButton(
              child: Text("添加商品"),
              onPressed: () {
                //给购物车中添加商品，添加后总价会更新
                ChangeNotifierProvider.of<CartModel>(context).add(Item(20.0, 1));
              },
            );
          }),
        ]));
  }
}
