import 'package:shopping_for_friends/models/product.dart';
import 'package:shopping_for_friends/services/productsService.dart';

class ProductsController{
  
  Future<List<Product>> getAllProducts() async {
    List<Product> products = await ProductsService().allProducts();
    return products;
  }

  Future<List<Product>> getProductsCategory(String category) async {
    List<Product> products = await ProductsService().productsCategroy(category);
    return products;
  }

  Future<List<Product>> searchProducts(String q) async {
    List<Product> products = await ProductsService().searchProducts(q);
    return products;
  }
  
  Future<List<Product>> searchProductsByCategory(String category, String q) async {
    List<Product> products = await ProductsService().searchProductsByCategory(category, q);
    return products;
  }    

}