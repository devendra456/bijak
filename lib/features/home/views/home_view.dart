import 'package:bijak/core/models/category_model.dart';
import 'package:bijak/core/models/product_model.dart';
import 'package:bijak/features/cart/controllers/cart_controller.dart';
import 'package:bijak/features/cart/views/cart_view.dart';
import 'package:bijak/features/home/views/slider_simmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_shimmer.dart';
import '../controllers/home_controller.dart';
import 'category_list.dart';
import 'category_shimmer.dart';
import 'horizontal_scrollable_banner.dart';
import 'recently_ordered_product.dart';
import 'search_bar_widget.dart';
import 'seasonal_products.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cc = Get.find<CartController>();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(() {
        return cc.cart.isNotEmpty ? const CartView() : const SizedBox();
      }),
      appBar: AppBar(
        title: const Text('Bijak'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarWidget(),
            FutureBuilder<List<String>>(
              future: controller.getSliderData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    if (data != null) {
                      return HorizontalScrollableBanner(
                        imageUrls: data,
                      );
                    }
                  }
                  return const SizedBox();
                }
                return const SliderShimmerWidget();
              },
            ),
            const SizedBox(height: 8),
            FutureBuilder<List<CategoryModel>>(
              future: controller.getCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    if (data != null) {
                      return CategoryList(data: data);
                    }
                  }
                  return const SizedBox();
                }
                return const CategoryShimmerWidget();
              },
            ),
            const SizedBox(height: 8),
            FutureBuilder<List<ProductModel>>(
              future: controller.getRecentOrderedProduct(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    if (data != null) {
                      return RecentlyOrderedProducts(data: data);
                    }
                  }
                  return const SizedBox();
                }
                return const RecentlyOrderedShimmer();
              },
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<ProductModel>>(
              future: controller.getSeasonalProduct(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    if (data != null) {
                      return SeasonalProducts(data: data);
                    }
                  }
                  return const SizedBox();
                }
                return const SeasonalProductShimmer();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RecentlyOrderedShimmer extends StatelessWidget {
  const RecentlyOrderedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 32,
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AppShimmer(
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: List.generate(
              6,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 180,
                width: 108,
                child: AppShimmer(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
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

class SeasonalProductShimmer extends StatelessWidget {
  const SeasonalProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 32,
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AppShimmer(
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: List.generate(
              6,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                height: 120,
                width: double.infinity,
                child: AppShimmer(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
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
