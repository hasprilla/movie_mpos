import '../../../../core/themes/app_size.dart';

import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final String title;

  const CategorySection({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.s20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: AppSize.s18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
