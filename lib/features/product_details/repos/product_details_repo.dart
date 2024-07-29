import 'dart:convert';

import 'package:bijak/core/models/product_model.dart';
import 'package:flutter/services.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo {
  @override
  Future<ProductModel> getProductDetails(int id) async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      String jsonString =
          await rootBundle.loadString("assets/data/product_details.json");
      final List<dynamic> data = jsonDecode(jsonString);
      final details = data.firstWhere((e) => e["id"] == id);
      return ProductModel.fromJson(details);
    } catch (e) {
      rethrow;
    }
  }
}

abstract interface class ProductDetailsRepo {
  Future<ProductModel> getProductDetails(int id);
}
