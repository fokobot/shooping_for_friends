import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/product.dart';

class ShoppingTile extends StatelessWidget {
  final Product shopping;
  ShoppingTile({this.shopping});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(shopping.name),
          subtitle: Text(shopping.price.toString()),
        ),
      ),
    );
  }
}