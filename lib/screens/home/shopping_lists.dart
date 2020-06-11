import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/cart_provider.dart';
import 'package:shopping_for_friends/screens/home/friend_tile.dart';

class ShoppingLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Listas"),
      ),
      body: Consumer<CartProvider>(builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.carts.length,
          itemBuilder: (context, index) {
            return FriendTile(friend: value.carts[index]);
          },
        );
      }),
    );
  }
}
