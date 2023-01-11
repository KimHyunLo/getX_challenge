import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level2/controller/cart_controller.dart';
import 'package:level2/controller/controller.dart';
import 'package:level2/view/product_tile.dart';

class MyPage extends StatelessWidget {
  final controller = Get.put(Controller());
  final cartController = Get.put(CartController());

  MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chef Shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.view_list_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Obx(
                  () => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        controller.productList[index],
                      );
                    },
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              'item: ${controller.count}',
              style: TextStyle(fontSize: 17),
            );
          },
        ),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
