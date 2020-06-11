import 'package:flutter/material.dart';
import 'package:shopping_for_friends/models/cart_provider.dart';
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
      child: Scaffold(
        body: ListaProductos(),
      ),
    );
  }

  
}
