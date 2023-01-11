import 'package:get/get.dart';
import 'package:level2/model/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;

  void addToItem(Product product) {
    cartItems.add(product);
  }
}