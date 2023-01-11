import 'package:flutter_getx_challenge/model/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  double get totalPrice => cartItems.fold(0, (prev, e) => prev + e.price);
  int get count => cartItems.length;

  void addToItem(Product product) {
    cartItems.add(product);
  }
}
