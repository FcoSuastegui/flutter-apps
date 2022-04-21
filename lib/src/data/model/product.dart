class ProductModel {
  ProductModel({
    required this.name,
    required this.brand,
    required this.imageURL,
    required this.price,
  });

  String name;
  String brand;
  String imageURL;
  int price;

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        name: json["name"] ?? "",
        brand: json["brand"] ?? "",
        imageURL: json["imageURL"] ?? "",
        price: json["price"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "brand": brand,
        "imageURL": imageURL,
        "price": price,
      };
}
