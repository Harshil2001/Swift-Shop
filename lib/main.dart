import 'package:de1/ResultModel.dart';
import 'package:flutter/material.dart';
import 'package:de1/pages/homepage.dart';
import 'package:de1/pages/shoppingcart.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SwiftShop(),
  /* routes: {
    '/hp': (context) => HomePage(),
    '/addprod': (context) => AddProd(),
    '/cart': (context) => ,
  } */
));

class SwiftShop extends StatefulWidget {
  @override
  _SwiftShopState createState() => _SwiftShopState();
}

class _SwiftShopState extends State<SwiftShop> {

  List<ResultModel> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Swift Shop"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Scan Product"),
              Tab(text: "Shopping Cart"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HomePage((selectedproduct) {
              setState(() {
                cart.add(selectedproduct);
                sum = 0;
                cart.forEach((item) {
                  sum = sum + item.price;
                });
              });
            }),
            ShoppingCart(cart, sum),
          ],
        ),
      ),
    );
  }
}


