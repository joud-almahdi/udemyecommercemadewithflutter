import 'package:http/http.dart' as http;
import 'package:udemyecommerce/Model/productmodel.dart';
import 'package:udemyecommerce/Utils/my_string.dart';

class ProductServices {
  static Future<List<ProductModel>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
