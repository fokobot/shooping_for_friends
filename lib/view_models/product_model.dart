import 'package:shopping_for_friends/base/base_model.dart';
import 'package:shopping_for_friends/locator.dart';
import 'package:shopping_for_friends/models/product_cart.dart';
import 'package:shopping_for_friends/models/user.dart';
import 'package:shopping_for_friends/services/products_service.dart';

import '../models/product.dart';

class ProductModel extends BaseModel {
  ProductService _productService = locator<ProductService>();

  List<Product> get products => _productService.products;

  Stream<List<ProductCart>> shopping_cart;

  bool dataAvailable = true;

  Future getProducts() async {
    setState(ViewState.Busy);
    try {
      await _productService.getProducts();
      setState(ViewState.Idle);
      return Future.value(true);
    } catch (err) {
      setState(ViewState.Idle);
      return Future.error(err.toString());
    }
  }

  Future uploadShoppingCart(User user, List<ProductCart> cartList) async {
    setState(ViewState.Busy);
    try {
      await _productService.uploadShoppingCart(user, cartList);
      setState(ViewState.Idle);
      return Future.value(true);
    } catch (err) {
      setState(ViewState.Idle);
      return Future.error(err.toString());
    }
  }
}
