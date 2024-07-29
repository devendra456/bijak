import 'package:bijak/core/models/product_model.dart';
import 'package:bijak/features/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return product?.isAdded.value == true
          ? Container(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(4),
              constraints: const BoxConstraints(
                maxWidth: 80,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      final cc = Get.find<CartController>();
                      cc.decreaseQuantity(product!);
                    },
                    child: const Text(
                      "-",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Obx(() {
                    return Text(
                      "${product!.quantity.value}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    );
                  }),
                  InkWell(
                    onTap: () {
                      final cc = Get.find<CartController>();
                      cc.increaseQuantity(product!);
                    },
                    child: const Text(
                      "+",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : InkWell(
              onTap: () {
                final cc = Get.find<CartController>();
                cc.addToCart(product!);
              },
              child: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  maxWidth: 80,
                ),
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
              ),
            );
    });
  }
}
