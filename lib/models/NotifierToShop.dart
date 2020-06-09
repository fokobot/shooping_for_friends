import 'package:flutter/cupertino.dart';
import 'package:shopping_for_friends/models/product.dart';

class NofifierToShop extends ChangeNotifier{
  List<Product> toShop = new List<Product>();


  void add(Product p){
    this.toShop.add(p);
    notifyListeners();
  }

  void pop(Product p){
    this.toShop.removeWhere((element) => element.name == p.name);
    notifyListeners();
  }
}