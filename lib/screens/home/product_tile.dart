import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/cart_provider.dart';
import 'package:shopping_for_friends/models/product.dart';

class ProductTile extends StatefulWidget {
  final Product product;
  final BuildContext context;

  ProductTile({this.product, this.context});
  // Crea estado del Widget
  _ProductTileState createState() => _ProductTileState(product, context);
}

class _ProductTileState extends State<ProductTile> {
  Product product;
  BuildContext context;

  bool check = false;
  _ProductTileState(this.product, this.context);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Center(
          child: Container(
            child: new Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: ListTile(
                    title: Text(product.name),
                    subtitle: Text("\$" + product.price.toDouble().toString()),
                  ),
                ),
                Expanded(
                    child: NumberPicker.integer(
                        initialValue: 1,
                        minValue: 1,
                        maxValue: 10,
                        onChanged: (newValue) => print(newValue))),
                Expanded(
                    flex: 1,
                    child: Checkbox(
                      value: check,
                      onChanged: (bool value) {
                        setState(() {
                          check = value;
                        });
                        if (value) {
                          Provider.of<CartProvider>(context, listen: false)
                              .add(product, 1);
                        } else {
                          Provider.of<CartProvider>(context, listen: false)
                              .pop(product);
                        }
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
