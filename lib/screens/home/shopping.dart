import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/NotifierToShop.dart';
import 'package:shopping_for_friends/screens/home/shopping_tile.dart';

class ShoppingListForm extends StatefulWidget {
  NofifierToShop model;
  ShoppingListForm(this.model);

  @override
  _ShoppingListFormState createState() => _ShoppingListFormState(model);
}

class _ShoppingListFormState extends State<ShoppingListForm> {
  final _formKey = GlobalKey<FormState>();
  NofifierToShop model;
  _ShoppingListFormState(this.model);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: model.toShop.length,
      itemBuilder: (context, index){
        return ShoppingTile(shopping: model.toShop[index]);
      },
    );
  }
}
