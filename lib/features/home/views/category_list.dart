import 'package:flutter/material.dart';

import '../../../core/models/category_model.dart';
import '../../../core/widgets/image_loader_widget.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.data,
  });

  final List<CategoryModel> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            "Categories",
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
                (index) => Container(
                      constraints: const BoxConstraints(
                        maxWidth: 80,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          ClipOval(
                            child: ImageLoaderWidget(
                              height: 48,
                              width: 48,
                              imagePath: data[index].image,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            data[index].name,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    )),
          ),
        ),
      ],
    );
  }
}
