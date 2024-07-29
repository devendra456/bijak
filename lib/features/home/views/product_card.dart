import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final List<Product> products;

  const ProductCard({super.key, required this.title, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: products
              .map((product) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          product.image,
                          width: 96,
                          height: 96,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.weight,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.price,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            // Add to cart logic
                          },
                          child: const Text('Add to Cart'),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class Product {
  final String image;
  final String name;
  final String weight;
  final String price;

  Product(
      {required this.image,
      required this.name,
      required this.weight,
      required this.price});
}
