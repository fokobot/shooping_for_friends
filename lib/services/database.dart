import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/models/product.dart';

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
          name: doc.data['name'] ?? '', address: doc.data['address'] ?? '');
    }).toList();
  }

  //Get Friends Stream
  Stream<List<Friend>> get friends {
    return friendCollection.snapshots().map(_friendListFromSnapshot);
  }

  Future uploadShoppingCart(List<Product> productos) async {
    List<Map<String, dynamic>> lista = productos.map((Product item) => {'nombre': item.name, 'cantidad': 1, 'precio': item.price}).toList();
    return await shoppingCartCollection
        .document(uid)
        .setData({'user': uid, 'productos': lista});
  }

}
