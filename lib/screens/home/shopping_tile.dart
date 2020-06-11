import 'package:flutter/material.dart';
import 'package:shopping_for_friends/models/product_cart.dart';

class ShoppingTile extends StatelessWidget {
  final ProductCart producto;
  ShoppingTile({this.producto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(producto.name),
          subtitle: Text("Precio: ${producto.price}. Cantidad: ${producto.quantity}"),
        ),
      ),
    );
  }
}