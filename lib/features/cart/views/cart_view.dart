import 'package:bijak/features/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cc = Get.find<CartController>();
    return BottomAppBar(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  return Text("${cc.items.value} Items");
                }),
                const SizedBox(height: 8),
                Obx(() {
                  return Text("\$${cc.total.value}");
                }),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Go To Cart"),
          )
        ],
      ),
    );
  }
}
