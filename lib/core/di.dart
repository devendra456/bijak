import 'package:bijak/features/cart/controllers/cart_controller.dart';
import 'package:bijak/features/home/repos/home_repos.dart';
import 'package:bijak/features/product_details/repos/product_details_repo.dart';
import 'package:get/get.dart';

Future<void> setup() async {
  Get.put<HomeRepos>(HomeReposImpl());
  Get.put<ProductDetailsRepo>(ProductDetailsRepoImpl());
  Get.put<CartController>(CartController());
}
