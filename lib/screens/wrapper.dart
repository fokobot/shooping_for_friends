import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/user.dart';
import 'package:shopping_for_friends/screens/authenticate/Welcome/welcome_screen.dart';
import 'package:shopping_for_friends/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user == null ? WelcomeScreen() : Home();
  }
}
