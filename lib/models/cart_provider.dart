import 'package:flutter/cupertino.dart';
import 'package:shopping_for_friends/models/product.dart';
import 'package:shopping_for_friends/models/product_cart.dart';

class CartProvider extends ChangeNotifier {
  
  List<ProductCart> cartList = [];

  void add(Product item, int quantity) {
    this.cartList.add(ProductCart(
        name: item.name,
        category: item.category,
        price: item.price,
        quantity: quantity));
    notifyListeners();
  }

  void pop(Product item) {
    this.cartList.removeWhere((element) => element.name == item.name);
    notifyListeners();
  }

  int size() {
    return cartList.length;
  }
}
