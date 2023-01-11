import 'package:flutter/material.dart';
import 'package:flutter_getx_challenge/controller/cart_controller.dart';
import 'package:flutter_getx_challenge/controller/shopping_controller.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              thickness: 10,
              radius: Radius.circular(10),
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(12),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text('${controller.products[index].productDescription}'),
                                    ],
                                  ),
                                  Text(
                                    '\$${controller.products[index].price}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cartController.addToItem(controller.products[index]);
                                },
                                child: Text('App to cart'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 30),
          GetX<CartController>(builder: (controller) {
            return Text(
              'Total amount: \$${controller.totalPrice}',
              style: TextStyle(fontSize: 25, color: Colors.white),
            );
          }),
          const SizedBox(height: 100),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(fontSize: 20),
          );
        }),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
