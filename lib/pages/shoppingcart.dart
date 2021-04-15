import 'package:flutter/material.dart';
//import 'package:de1/pages/homepage.dart';

class ShoppingCart extends StatefulWidget {
  final cart;
  final sum;

  ShoppingCart(this.cart, this.sum);

  @override
  _ShoppingCartState createState() => _ShoppingCartState(cart, sum);
}

class _ShoppingCartState extends State<ShoppingCart> {

  final cart;
  var sum;

  _ShoppingCartState(this.cart, this.sum);

  @override
  Widget build(BuildContext context) {
    return Column(
//      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        ListView.separated(
            itemBuilder: (context, index){
              return Dismissible(
                key: Key(cart[index].name.toString()),
                direction: DismissDirection.endToStart,
                child: ListTile(
                  title: Text(cart[index].name),
                  trailing: Text("Rs. ${cart[index].price}",
                    style: TextStyle(color: Colors.redAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    sum = sum - cart[index].price;
                    cart.removeAt(index);
                  });
                },
              );
            },
            separatorBuilder: (context, index){
              return Divider();
            },
            itemCount: cart.length,
            shrinkWrap: true,
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Total", style: TextStyle(fontSize: 17),),
            Text("Rs. ${sum}", style: TextStyle(fontSize: 17),),
          ],
        ),
      ],
    );
  }
}

