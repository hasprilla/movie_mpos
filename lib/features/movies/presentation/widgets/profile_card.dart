import '../../../../core/themes/app_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  const ProfileCard({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSize.s16, top: AppSize.s10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Imagen Circular
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          // Nombre
          Text(
            name,
            style: const TextStyle(
              fontSize: AppSize.s10,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          // Subtítulo
        ],
      ),
    );
  }
}
