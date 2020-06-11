import 'package:flutter/material.dart';

import 'lista_productos.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListaProductos(),
    );
  }
}
