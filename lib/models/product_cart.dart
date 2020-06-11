class ProductCart{
  final String name;
  final double price;
  final category;
  final int quantity;

  ProductCart({this.name, this.price, this.category, this.quantity});

  factory ProductCart.fromJson(Map<String, dynamic> json) {
    return ProductCart(
      name: json['name'],
      price: json['price'],
      category: json['category'],
      quantity: json['quantity']
    );
  }
}