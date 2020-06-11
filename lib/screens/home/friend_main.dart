import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/screens/home/friend_list.dart';
import 'package:shopping_for_friends/services/database.dart';

class FriendMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Friend>>.value(
      value: DatabaseService().friends,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Shopping For Friends'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
        ),
        body: FriendList(), //ProductList(model),
      ),
    );
  }
}
