import 'package:flutter/material.dart';
import 'package:shopping_for_friends/models/cart_provider.dart';
import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/screens/home/friend_list.dart';
import 'package:shopping_for_friends/screens/home/shopping.dart';
import 'package:shopping_for_friends/services/auth.dart';
import 'package:shopping_for_friends/services/database.dart';
import 'package:provider/provider.dart';

import 'lista_productos.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartProvider(),
        child: StreamProvider<List<Friend>>.value(
          value: DatabaseService().friends,
          child: Scaffold(
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              title: Text('Shopping For Friends'),
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 60.0),
                            child: ShoppingListForm(),
                          );
                        }),
                    icon: Icon(Icons.shopping_basket),
                    label: Text('Add Shopping List')),
                FlatButton.icon(
                    onPressed: () async {
                      await _auth.signOut();
                    },
                    icon: Icon(Icons.exit_to_app),
                    label: Text('Logout')),
              ],
            ),
            body: ListaProductos(),
          ),
        ));
  }
}
