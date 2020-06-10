import 'package:flutter/cupertino.dart';
import 'package:shopping_for_friends/models/product.dart';

class CartProvider extends ChangeNotifier{

  final List<Product> cartList = [];

  void add(Product item) {
    this.cartList.add(item);
    notifyListeners();
  }

  void pop(Product item){
    this.cartList.removeWhere((element) => element.name == item.name);
    notifyListeners();
  }

  int size(){
    return cartList.length;
  }
}