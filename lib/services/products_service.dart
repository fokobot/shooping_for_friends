import 'package:shopping_for_friends/locator.dart';
import 'package:shopping_for_friends/models/user.dart';
import 'package:shopping_for_friends/services/api.dart';
import 'package:shopping_for_friends/services/auth.dart';
import 'package:shopping_for_friends/services/database.dart';

import '../models/product.dart';

class ProductService {
  Api _api = locator<Api>();

  List<Product> _products = [];
  List<Product> get products => _products;

  Future getProducts() async {
    try {
      _products = await _api.getProducts();
    } catch (err) {
      return Future.error(err.toString());
    }
  }

  Future uploadShoppingCart(User user, List<Product> cartList) async {
    print("Subir carrito de compra.");
    await DatabaseService(uid: user.uid).uploadShoppingCart(cartList);
  }
}
