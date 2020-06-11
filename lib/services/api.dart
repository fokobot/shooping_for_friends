import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class Api {
  static const String base_url = 'https://frutiland.herokuapp.com/search';

  var client = new http.Client();

  // Devuelve el listado de TODOS los productos
  Future<List<Product>> getProducts() async {
    // Request
    final http.Response response = await http.get(
      base_url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Product> productsList = [];
      for (Map i in data) {
        productsList.add(Product.fromJson(i));
      }
      return productsList;
    } else {
      return Future.error(response.statusCode.toString());
    }
  }
}
