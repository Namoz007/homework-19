import 'dart:ffi';

class Product {
  String name;
  String condition;
  double price;
  String location;
  String img;

  Product(
      {required this.name,
        required this.condition,
        required this.price,
        required this.location,
        required this.img});
}

List<Product> products = [
  Product(
      name: 'MacBook M3',
      condition: 'Yangi',
      price: 24999000,
      location: 'Toshkent, Chilonzor',
      img: "assets/imgs/macbook_m3.png"),
  Product(
      name: 'Iphone 15 Pro Max',
      condition: 'Yangi',
      price: 14999000,
      location: 'Toshkent, Uchtepa',
      img: "assets/imgs/iphone_15.png"),
  Product(
      name: 'Iphone 14 Pro Max',
      condition: 'Orta',
      price: 10999000,
      location: 'Toshkent, Yunusobod',
      img: "assets/imgs/iphone_14.png"),
  Product(
      name: 'MacBook M2',
      condition: 'Orta',
      price: 15999000,
      location: 'Toshkent, Sergeli',
      img: "assets/imgs/macbook_m2.png"),
  Product(
      name: 'BMW',
      condition: 'Yangi',
      price: 180999000,
      location: 'Toshkent, Choshtepa',
      img: "assets/imgs/bmw.png"),
  Product(
      name: 'Televizor',
      condition: 'Orta',
      price: 2999000,
      location: 'Toshkent, Oqtepa',
      img: "assets/imgs/tv.png"),
  Product(
      name: 'MacBook M1',
      condition: 'Past',
      price: 5000000,
      location: 'Toshkent',
      img: 'assets/imgs/mackbook_m1.png'),
  Product(
      name: 'BMW M8',
      condition: 'Yangi',
      price: 350000000,
      location: 'Toskent Uchtepa',
      img: 'assets/imgs/bmw_m8.png'),
  Product(
      name: 'MacBook Chexol',
      condition: 'Yangi',
      price: 55000,
      location: 'Toshkent Yunusobod',
      img: 'assets/imgs/mackbook_m3_chexol.png')
];

class ProductsController {
  List lists(String type) {
    List<String> sortedProducts = [];
    if (type != null && type != '') {
      for (int i = 0; i < products.length; i++) {
        if (type.toLowerCase() == products[i].name.toLowerCase()) {
          sortedProducts.add(products[i].name);
        }
      }

      for (int i = 0; i < products.length; i++) {
        if (products[i].name.toLowerCase().contains(type.toLowerCase())) {
          sortedProducts.add(products[i].name);
        }
      }

      List lst = [...sortedProducts];
      print(lst);
      Set st = {...lst};
      print(st);
      sortedProducts = [...st];
      return sortedProducts;
    } else {
      return products;
    }
  }
}