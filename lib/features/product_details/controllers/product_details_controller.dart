import 'package:bijak/core/models/product_model.dart';
import 'package:bijak/features/product_details/repos/product_details_repo.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final ProductDetailsRepo _productDetailsRepo;

  ProductModel? product;

  ProductDetailsController(this._productDetailsRepo);

  @override
  void onInit() {
    product = Get.arguments as ProductModel;
    super.onInit();
  }

  Future<ProductModel> getProductDetails() {
    return _productDetailsRepo.getProductDetails(product!.id);
  }
}
