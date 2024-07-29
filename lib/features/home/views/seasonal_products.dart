import 'package:bijak/core/models/product_model.dart';
import 'package:bijak/core/routes/app_pages.dart';
import 'package:bijak/core/widgets/add_to_cart_button.dart';
import 'package:bijak/core/widgets/image_loader_widget.dart';
import 'package:bijak/features/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeasonalProducts extends StatelessWidget {
  final List<ProductModel> data;

  const SeasonalProducts({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Seasonal Products",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              data.length,
              (index) => Container(
                constraints: const BoxConstraints(
                  maxHeight: 116,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Card(
                  elevation: 3,
                  color: Colors.white,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PRODUCT_DETAILS,
                          arguments: data[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: ImageLoaderWidget(
                              imagePath: data[index].image,
                              height: 96,
                              width: 96,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Text(
                                    data[index].title,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "${data[index].weight}g",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Text(
                                    "\$${data[index].price}",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: AddToCartButton(product: data[index],),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
