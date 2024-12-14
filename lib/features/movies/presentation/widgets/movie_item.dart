import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_route_path.dart';
import '../../../../core/themes/app_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/get_poster_image.dart';
import '../../domain/entities/movie.dart';
import 'vote_averange.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          AppRoute.detail.name,
          extra: movie,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: getPosterImage(movie.posterPath),
                width: 120,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.originalTitle,
              style: const TextStyle(
                  fontSize: AppSize.s14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
            VoteAverage(voteAverage: movie.voteAverage),
          ],
        ),
      ),
    );
  }
}
