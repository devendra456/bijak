import 'package:bijak/features/home/repos/home_repos.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<HomeRepos>()),
    );
  }
}
