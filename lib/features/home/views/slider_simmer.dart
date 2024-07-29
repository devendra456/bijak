import 'package:flutter/material.dart';

import '../../../core/widgets/app_shimmer.dart';

class SliderShimmerWidget extends StatelessWidget {
  const SliderShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: AppShimmer(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
