import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ProductModel {
  final int id;
  final num price;
  final num weight;
  final String title;
  final String image;
  final String? description;
  RxInt quantity = RxInt(1);
  RxBool isAdded = false.obs;

  ProductModel({
    required this.id,
    required this.price,
    required this.weight,
    required this.title,
    required this.image,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        weight: json["weight"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "weight": weight,
        "image": image,
        "description": description,
      };
}
