import 'package:http/http.dart' as http;
import 'package:level2/model/product_model.dart';

class Services {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var responce = await client.get(
      Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'),
    );

    if (responce.statusCode == 200) {
      var jsonData = responce.body;

      return productFromJson(jsonData);
    } else {
      return null;
    }
  }
}
