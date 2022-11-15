import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udemyecommerce/Model/productmodel.dart';
import 'package:udemyecommerce/Services/product_services.dart';

class ProductController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  var productlist = <ProductModel>[].obs;
  var isLoading = true.obs;
  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productlist.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
