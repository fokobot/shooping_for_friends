import 'package:flutter/cupertino.dart';
import 'package:shopping_for_friends/controllers/productsControllers.dart';
import 'package:shopping_for_friends/models/product.dart';
import 'package:shopping_for_friends/screens/home/product_tile.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {

    getProducts();

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index){
        return ProductTile(product: products[index]);
      },
    );
  }
  List<Product> products = new List<Product>();

  getProducts() async {
    List<Product> temp = await ProductsController().getAllProducts();
    if(mounted && temp != null){
      setState(() {
        this.products.addAll(temp);
      });
    }
  }
}