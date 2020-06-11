import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/cart_provider.dart';
import 'package:shopping_for_friends/models/product.dart';

class ProductTile extends StatefulWidget {
  final Product product;

  ProductTile({this.product});
  // Crea estado del Widget
  _ProductTileState createState() => _ProductTileState(product);
}

class _ProductTileState extends State<ProductTile> {
  Product product;
  int _n = 0;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  bool check = false;
  _ProductTileState(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 0.0, 0.0),
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
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: add,
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.white,
                          ),
                          Text('$_n', style: TextStyle(fontSize: 60.0)),
                          FloatingActionButton(
                            onPressed: minus,
                            child: Icon(
                                const IconData(0xe15b,
                                    fontFamily: 'MaterialIcons'),
                                color: Colors.black),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
