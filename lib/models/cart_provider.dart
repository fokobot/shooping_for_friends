import 'package:flutter/cupertino.dart';
import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/models/product.dart';
import 'package:shopping_for_friends/models/product_cart.dart';

class CartProvider extends ChangeNotifier {
  Map<String, Friend> carts = {};
  Map<String, ProductCart> cartList = {};

  void addCart(Friend friend) {
    this.carts.putIfAbsent(friend.uid, () => friend);
    //
    notifyListeners();
  }

  void add(Product item, int quantity) {
    this.cartList.putIfAbsent(item.name, () => ProductCart(
        name: item.name,
        category: item.category,
        price: item.price,
        quantity: quantity));
    notifyListeners();
  }

  void pop(Product item) {
    this.cartList.removeWhere((key, element) => key == item.name);
    notifyListeners();
  }

  void closeAll(){
    this.cartList.clear();
    this.carts.clear();
    notifyListeners();
  }

  int size() {
    return cartList.length;
  }
}
