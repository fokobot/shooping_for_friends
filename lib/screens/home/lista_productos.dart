import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/base/base_model.dart';
import 'package:shopping_for_friends/base/base_view.dart';
import 'package:shopping_for_friends/models/cart_provider.dart';
import 'package:shopping_for_friends/models/user.dart';
import 'package:shopping_for_friends/screens/home/shopping.dart';
import 'package:shopping_for_friends/view_models/product_model.dart';

import '../../models/product.dart';
import 'product_tile.dart';

class ListaProductos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProductModel>(
        onModelReady: (model) => _getData(context, model),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text("Lista de Productos"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {
                      print("Log Out");
                      //Provider.of<AuthProvider>(context, listen: false).signOut();
                    },
                  ),
                ],
              ),
              floatingActionButton: _floating(context, model),
              body: model.state == ViewState.Busy
                  ? Center(child: CircularProgressIndicator())
                  : Center(
                      child: model.products == null
                          ? Text('No hay productos disponibles.')
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Expanded(child: _list(context, model.products)),
                              ],
                            )),
              drawer: Drawer(child: _drawer(context)),
            ));
  }

  void _getData(BuildContext context, ProductModel model) async {
    model.getProducts().catchError((error) async {
      await _buildDialog(
          context, 'Alert', 'Error al obtener el listado de productos.');
    });
  }

  Future<void> _buildDialog(BuildContext context, _title, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text(_title),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }

  Widget _list(BuildContext context, List<Product> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, posicion) {
        var element = items[posicion];
        return ProductTile(product: element, context: context);
      },
    );
  }

  Widget _floating(BuildContext context, ProductModel model) {
    return FloatingActionButton(
        onPressed: () => _uploadShoppingCart(context, model),
        tooltip: 'Guardar carrito de compra',
        child: new Icon(Icons.save));
  }

  void _uploadShoppingCart(BuildContext context, ProductModel model) async {
    final User user = Provider.of<User>(context);
    final CartProvider cart = Provider.of<CartProvider>(context);

    try {
      await model.uploadShoppingCart(user, cart.cartList);
    } catch (err) {
      print("Ocurrió un error al subir.");
      //Provider.of<AuthProvider>(context, listen: false).signOut();
    }
  }

  Widget _drawer(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Menú'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Amigos'),
          onTap: () {
            //Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Mi Lista'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ShoppingListForm()),
            );
          },
        ),
      ],
    );
  }
}
