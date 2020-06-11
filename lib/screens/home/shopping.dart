import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/base/base_model.dart';
import 'package:shopping_for_friends/base/base_view.dart';
import 'package:shopping_for_friends/models/cart_provider.dart';
import 'package:shopping_for_friends/models/product_cart.dart';
import 'package:shopping_for_friends/models/user.dart';
import 'package:shopping_for_friends/screens/home/shopping_tile.dart';
import 'package:shopping_for_friends/view_models/product_model.dart';

class ShoppingListForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProductModel>(
        onModelReady: (model) => _getData(context, model),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(title: Text("Mi carrito de compra")),
              floatingActionButton: _floating(context, model),
              body: model.state == ViewState.Busy
                  ? Center(child: CircularProgressIndicator())
                  : Consumer<CartProvider>(builder: (context, value, child) {
                      List<ProductCart> productos = value.cartList.values.toList();
                      return ListView.builder(
                        itemCount: productos.length,
                        itemBuilder: (context, index) {
                          return ShoppingTile(producto: productos[index]);
                        },
                      );
                    }),
            ));
  }

  void _getData(BuildContext context, ProductModel model) {}

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
}
