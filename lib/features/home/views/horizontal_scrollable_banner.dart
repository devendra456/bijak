import 'package:bijak/core/widgets/image_loader_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HorizontalScrollableBanner extends StatelessWidget {
  final List<String> imageUrls;

  const HorizontalScrollableBanner({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ImageLoaderWidget(
            imagePath: imageUrls[itemIndex],
            boxFit: BoxFit.cover,
          ),
        ),
      ),
      options: CarouselOptions(
        aspectRatio: 3 / 2,
        autoPlay: true,
        viewportFraction: 1,
      ),
    );
  }
}
