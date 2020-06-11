import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/cart_provider.dart';
import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/models/user.dart';
import 'package:shopping_for_friends/screens/home/friend_tile.dart';
import 'package:shopping_for_friends/services/database.dart';

class ShoppingLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Listas"),
      ),
      floatingActionButton: _floating(context),
      body: Consumer<CartProvider>(builder: (context, value, child) {
        List<Friend> lists = value.carts.values.toList();
        return ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, index) {
            return FriendTile(friend: lists[index]);
          },
        );
      }),
    );
  }

  Widget _floating(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.done_all),
      tooltip: "Cerrar compra",
      onPressed: () {
        _cerrarCompra(context);
      },
    );
  }

  void _cerrarCompra(BuildContext context) {
    User user= Provider.of<User>(context);
    // Mis listas
    Map<String, Friend> carts =  Provider.of<CartProvider>(context).carts;
    // Eliminar listas de compra
    DatabaseService(uid: user.uid).clearLists(carts);
    // Limpiar
    Provider.of<CartProvider>(context, listen: false).closeAll();
  }
}
