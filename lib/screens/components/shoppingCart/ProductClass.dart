class Product {
  int id;
  String name;
  double price;
  String img;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "img": img,
      };

  static Future<List<Product>> loadData() async {
    return [
      Product(id: 0, name: 'Carrot', price: 50.0, img: 'assets/images/shopping/carrot.png'),
      Product(id: 1, name: 'Eggplant', price: 155.0, img: 'assets/images/shopping/eggplant.png'),
      Product(id: 2, name: 'Broccoli', price: 85.5, img: 'assets/images/shopping/broccoli.png'),
      Product(id: 3, name: 'Paprika', price: 90.0, img: 'assets/images/shopping/paprika.png'),
      Product(id: 4, name: 'Pumpkin', price: 70.0, img: 'assets/images/shopping/pumpkin.png'),
    ];
  }
}
