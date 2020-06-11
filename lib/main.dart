import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/cart_provider.dart';
import 'package:shopping_for_friends/screens/wrapper.dart';
import 'package:shopping_for_friends/services/auth.dart';

import 'locator.dart';
import 'models/user.dart';
import 'shared/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    setupLocator();
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: kPrimaryColor,
          ),
          home: Wrapper(),
        ),
      ),
    );
  }
}
