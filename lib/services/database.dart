import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_for_friends/models/friend.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //Collection Reference
  final CollectionReference friendCollection =
      Firestore.instance.collection('friends');

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

  //userData from Snapshot
  // UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserData(
  //       uid: uid,
  //       name: snapshot.data['name'],
  //       address: snapshot.data['address']);
  // }

  //Get Friends Stream
  Stream<List<Friend>> get friends {
    return friendCollection.snapshots().map(_friendListFromSnapshot);
  }

  //Get User Doc Stream
  // Stream<UserData> get userData {
  //   return friendCollection.document(uid).snapshots()
  //   .map(_userDataFromSnapshot);
  // }
}
