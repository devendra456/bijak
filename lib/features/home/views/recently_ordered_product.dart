import 'package:bijak/core/models/product_model.dart';
import 'package:bijak/core/routes/app_pages.dart';
import 'package:bijak/core/widgets/add_to_cart_button.dart';
import 'package:bijak/core/widgets/image_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentlyOrderedProducts extends StatelessWidget {
  final List<ProductModel> data;

  const RecentlyOrderedProducts({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Recently Ordered",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              data.length,
              (index) {
                return Container(
                  constraints: const BoxConstraints(
                    maxWidth: 108,
                  ),
                  child: Card(
                    elevation: 3,
                    color: Colors.white,
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PRODUCT_DETAILS,
                            arguments: data[index]);
                      },
                      child: Column(
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
                          const SizedBox(height: 4),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              "\$${data[index].price}",
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          AddToCartButton(product: data[index]),
                          const SizedBox(height: 2),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
