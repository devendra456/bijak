import 'dart:convert';

import 'package:bijak/core/models/category_model.dart';
import 'package:bijak/core/models/product_model.dart';
import 'package:flutter/services.dart';

class HomeReposImpl implements HomeRepos {
  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      String jsonString =
          await rootBundle.loadString("assets/data/category_data.json");
      final List<dynamic> data = jsonDecode(jsonString);
      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> getRecentOrderedProduct() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      String jsonString =
          await rootBundle.loadString("assets/data/recently_ordered.json");
      final List<dynamic> data = jsonDecode(jsonString);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> getSeasonalProduct() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      String jsonString =
          await rootBundle.loadString("assets/data/seasonal_products.json");
      final List<dynamic> data = jsonDecode(jsonString);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> getSliderData() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      String jsonString =
          await rootBundle.loadString("assets/data/slider_data.json");
      final List<dynamic> data = jsonDecode(jsonString);
      return data.map<String>((e) => e).toList();
    } catch (e) {
      rethrow;
    }
  }
}

abstract interface class HomeRepos {
  Future<List<String>> getSliderData();

  Future<List<CategoryModel>> getCategories();

  Future<List<ProductModel>> getRecentOrderedProduct();

  Future<List<ProductModel>> getSeasonalProduct();
}
