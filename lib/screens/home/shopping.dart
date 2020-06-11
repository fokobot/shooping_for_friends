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
              body: model.state == ViewState.Busy
                  ? Center(child: CircularProgressIndicator())
                  : StreamProvider<List<ProductCart>>.value(
                      value: model.shopping_cart,
                      child: Consumer<CartProvider>(
                          builder: (context, value, child) {
                        return ListView.builder(
                          itemCount: value.cartList.length,
                          itemBuilder: (context, index) {
                            //  List<ProductCart> l =
                            // Provider.of<List<ProductCart>>(context);
                            return ShoppingTile(
                                producto: value.cartList[index]);
                          },
                        );
                      })),
            ));
  }

  void _getData(BuildContext context, ProductModel model) {
    final User user = Provider.of<User>(context);

    model.getShoppingCart(user).catchError((error) async {
      await print("Error al obtener el carrito de compras.");
    });
  }
}
