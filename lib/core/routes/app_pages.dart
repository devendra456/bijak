import 'package:get/get.dart';

import '../../features/home/bindings/home_binding.dart';
import '../../features/home/views/home_view.dart';
import '../../features/product_details/bindings/product_details_binding.dart';
import '../../features/product_details/views/product_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
  ];
}
