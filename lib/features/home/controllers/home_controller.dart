import 'package:bijak/core/models/category_model.dart';
import 'package:bijak/core/models/product_model.dart';
import 'package:bijak/features/home/repos/home_repos.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepos _homeRepos;

  HomeController(this._homeRepos);

  @override
  void onInit() {
    super.onInit();
    _homeRepos.getSliderData();
  }

  Future<List<String>> getSliderData() {
    return _homeRepos.getSliderData();
  }

  Future<List<CategoryModel>> getCategories() {
    return _homeRepos.getCategories();
  }

  Future<List<ProductModel>> getRecentOrderedProduct() {
    return _homeRepos.getRecentOrderedProduct();
  }

  Future<List<ProductModel>> getSeasonalProduct() {
    return _homeRepos.getSeasonalProduct();
  }
}
