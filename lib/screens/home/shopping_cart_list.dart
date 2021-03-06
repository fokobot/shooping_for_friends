import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/product_cart.dart';
import 'package:shopping_for_friends/screens/home/shopping_tile.dart';

class ShoppingCartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<ProductCart>>(context);
    return products == null
        ? Text("No tiene items en su lista de compra")
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ShoppingTile(producto: products[index]);
            },
          );
  }
}
