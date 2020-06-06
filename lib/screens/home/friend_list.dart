import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/screens/home/friend_tile.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    final friends = Provider.of<List<Friend>>(context) ?? [];
    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index){
        return FriendTile(friend: friends[index]);
      },
      );
  }
}
