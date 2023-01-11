import 'package:get/get.dart';
import 'package:level2/data/services.dart';
import 'package:level2/model/product_model.dart';

class Controller extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var products = await Services.fetchProducts();

      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
