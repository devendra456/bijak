import 'package:flutter/material.dart';

import '../../../core/widgets/app_shimmer.dart';

class CategoryShimmerWidget extends StatelessWidget {
  const CategoryShimmerWidget({
    super.key,
  });

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
              (index) => Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 48,
                    width: 48,
                    child: AppShimmer(
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    height: 12,
                    width: 56,
                    child: AppShimmer(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 12,
                    width: 24,
                    child: AppShimmer(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
