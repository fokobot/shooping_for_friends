import 'package:flutter/material.dart';
import 'package:shopping_for_friends/models/friend.dart';

class FriendTile extends StatelessWidget {
  final Friend friend;
  FriendTile({this.friend});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[2],
          ),
          title: Text(friend.name),
          subtitle: Text(friend.address),
        ),
      ),
    );
  }
}
