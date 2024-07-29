import 'package:bijak/features/product_details/repos/product_details_repo.dart';
import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(Get.find<ProductDetailsRepo>()),
    );
  }
}
