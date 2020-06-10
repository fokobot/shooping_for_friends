import 'package:flutter/cupertino.dart';
import 'package:shopping_for_friends/models/product.dart';

class CartProvider extends ChangeNotifier{
  final List<Product> toShop = [];

  void add(Product item) {
    this.toShop.add(item);
    notifyListeners();
  }

  void pop(Product p){
    this.toShop.removeWhere((element) => element.name == p.name);
    notifyListeners();
  }

  int size(){
    return toShop.length;
  }
}