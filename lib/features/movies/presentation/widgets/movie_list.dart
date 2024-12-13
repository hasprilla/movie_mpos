import 'loading.dart';
import 'movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieList<T extends BlocBase<S>, S> extends StatelessWidget {
  final T bloc;
  final List Function(S state) getMovies;
  final String Function(dynamic movie) getTitle;
  final String Function(dynamic movie) getImagePath;
  final double Function(dynamic movie) getRating;

  const MovieList({
    super.key,
    required this.bloc,
    required this.getMovies,
    required this.getTitle,
    required this.getImagePath,
    required this.getRating,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, S>(
      bloc: bloc,
      builder: (context, state) {
        final movies = getMovies(state);
        if (movies.isNotEmpty) {
          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieItem(
                  title: getTitle(movie),
                  imagePath: getImagePath(movie),
                  rating: getRating(movie),
                );
              },
            ),
          );
        }
        return const Loading();
      },
    );
  }
}
