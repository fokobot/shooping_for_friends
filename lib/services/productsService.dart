import 'dart:convert';
import 'package:http/http.dart' as http; 
import 'package:shopping_for_friends/models/product.dart';

class ProductsService{

  Future<List<Product>> allProducts() async {
    final response = await http.get('https://frutiland.herokuapp.com/search',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
    
    if (response.statusCode == 200) {
      print('${response.body}');
      Iterable json = jsonDecode(response.body);
      return json.map((product)=> Product.fromJson(product)).toList(); 
    
    } else {
      print('${response.body}');
      return null;
    }
  }

  Future<List<Product>> productsCategroy(String category) async {
    final response = await http.get('https://frutiland.herokuapp.com/search?category=$category',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
    
    if (response.statusCode == 200) {
      print('${response.body}');
      Iterable json = jsonDecode(response.body);
      return json.map((product)=> Product.fromJson(product)).toList(); 
    
    } else {
      print('${response.body}');
      return null;
    }
  }

  Future<List<Product>> searchProducts(String q) async {
    final response = await http.get('https://frutiland.herokuapp.com/search?q=$q',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
    
    if (response.statusCode == 200) {
      print('${response.body}');
      Iterable json = jsonDecode(response.body);
      return json.map((product)=> Product.fromJson(product)).toList(); 
    
    } else {
      print('${response.body}');
      return null;
    }
  }

  Future<List<Product>> searchProductsByCategory(String category, String q) async {
    final response = await http.get('https://frutiland.herokuapp.com/search?category=$category&q=$q',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
    
    if (response.statusCode == 200) {
      print('${response.body}');
      Iterable json = jsonDecode(response.body);
      return json.map((product)=> Product.fromJson(product)).toList(); 
    
    } else {
      print('${response.body}');
      return null;
    }
  }  

}