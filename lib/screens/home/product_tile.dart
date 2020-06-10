import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shopping_for_friends/models/NotifierToShop.dart';
import 'package:shopping_for_friends/models/product.dart';

class ProductTile extends StatefulWidget {
  @override
  final Product product;
  final NofifierToShop model;
  ProductTile({Key key, @required this.product, @required this.model})
      : super(key: key);
  _ProductTileState createState() => _ProductTileState(product, model);
}

class _ProductTileState extends State<ProductTile> {
  Product product;
  NofifierToShop model;
  bool check = false;
  _ProductTileState(this.product, this.model);

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
                    subtitle: Text("\$" + product.price.toInt().toString()),
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
                          model.add(product);
                        } else {
                          model.pop(product);
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
