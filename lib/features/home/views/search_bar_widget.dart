import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8),
      child: const Row(
        children: [
          Text(
            "Search Here",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          Spacer(),
          Icon(Icons.search_rounded)
        ],
      ),
    );
  }
}
