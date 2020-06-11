import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/models/product_cart.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //Friends
  final CollectionReference friendCollection =
      Firestore.instance.collection('friends');

  //Shopping Carts
  final CollectionReference shoppingCartCollection =
      Firestore.instance.collection('shopping_carts');

  Future updateUserData(String name, String address) async {
    return await friendCollection
        .document(uid)
        .setData({'name': name, 'address': address});
  }

  //Friend List from Snapshot
  List<Friend> _friendListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Friend(
          name: doc.data['name'] ?? '',
          address: doc.data['address'] ?? '',
          uid: doc.documentID);
    }).toList();
  }

  //Get Friends Stream
  Stream<List<Friend>> get friends {
    return friendCollection.snapshots().map(_friendListFromSnapshot);
  }

  Future uploadShoppingCart(Map<String, ProductCart> productos) async {
    List<Map<String, dynamic>> lista = [];
    productos.forEach((key, item) {
      lista.add({
        'name': item.name,
        'quantity': item.quantity,
        'price': item.price,
        'category': item.category
      });
    });
    // Actualiza los productos
    return await shoppingCartCollection
        .document(uid)
        .setData({'user': uid, 'products': lista});
  }

  Stream<List<ProductCart>> getShoppingCart(Friend friend) {
    return shoppingCartCollection
        .where("user", isEqualTo: friend.uid)
        .snapshots()
        .map(_shoppingListFromSnapshot);
  }

  // Shopping Cart
  List<ProductCart> _shoppingListFromSnapshot(QuerySnapshot snapshot) {
    if (snapshot.documents.length == 0) return null;

    return snapshot.documents.map((doc) {
      List a = doc.data['products'];

      return a
          .map((item) => ProductCart(
              name: item['name'],
              price: item['price'],
              quantity: item['quantity'],
              category: item['category']))
          .toList();
    }).first;
  }

  // Clear lists
  Future clearLists(Map<String, Friend> carts) async {
    // Elimina todas las listas de compra que el usuario añadió
    WriteBatch wb = Firestore.instance.batch();
    carts.forEach((key, value) {
      wb.delete(shoppingCartCollection.document(key));
    });
    // Elimina la lista de compra propia
    wb.delete(shoppingCartCollection.document(uid));
    // Commit changes
    wb.commit();
  }
}
