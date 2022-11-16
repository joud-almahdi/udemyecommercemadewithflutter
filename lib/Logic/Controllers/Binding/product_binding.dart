import 'package:get/get.dart';
import 'package:udemyecommerce/Logic/Controllers/cartcontroller.dart';
import 'package:udemyecommerce/Logic/Controllers/categorycontroller.dart';

import '../product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
