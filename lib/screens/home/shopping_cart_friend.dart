import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/cart_provider.dart';
import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/models/product_cart.dart';
import 'package:shopping_for_friends/screens/home/shopping_cart_list.dart';
import 'package:shopping_for_friends/services/database.dart';

class ShoppingCartFriend extends StatelessWidget {
  final Friend friend;
  ShoppingCartFriend({this.friend});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ProductCart>>.value(
      value: DatabaseService().getShoppingCart(friend),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lista de compra de ${friend.name}'),
        ),
        body: ShoppingCartList(), //ProductList(model),
        floatingActionButton: _floating(context),
      ),
    );
  }

  Widget _floating(BuildContext context){
     return FloatingActionButton(
        onPressed: () => Provider.of<CartProvider>(context, listen: false)
                          .addCart(friend),
        tooltip: 'Seleccionar compra',
        child: new Icon(Icons.check));
  }
}
