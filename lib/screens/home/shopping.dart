import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/cart_provider.dart';
import 'package:shopping_for_friends/screens/home/shopping_tile.dart';

class ShoppingListForm extends StatefulWidget {
  ShoppingListForm();

  @override
  _ShoppingListFormState createState() => _ShoppingListFormState();
}

class _ShoppingListFormState extends State<ShoppingListForm> {
  _ShoppingListFormState();
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) => ListView.builder(
        itemCount: cart.cartList.length,
        itemBuilder: (context, index) {
          return ShoppingTile(shopping: cart.cartList[index]);
        },
      ),
    );
  }
}
