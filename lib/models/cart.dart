import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/models/product_cart.dart';

class Cart {
  final Friend friend;
  final List<ProductCart> products;

  Cart({this.friend, this.products});
}
