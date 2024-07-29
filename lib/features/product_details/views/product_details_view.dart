import 'package:bijak/core/widgets/add_to_cart_button.dart';
import 'package:bijak/core/widgets/image_loader_widget.dart';
import 'package:bijak/features/cart/controllers/cart_controller.dart';
import 'package:bijak/features/cart/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cc = Get.find<CartController>();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(() {
        return cc.cart.isNotEmpty ? const CartView() : const SizedBox();
      }),
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      body: FutureBuilder(
          future: controller.getProductDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                if (data != null) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: ImageLoaderWidget(imagePath: data.image),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.title,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data.weight}g",
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    "\$${data.price}",
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child:
                                  AddToCartButton(product: controller.product),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.description ?? "",
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }
              return const SizedBox();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
