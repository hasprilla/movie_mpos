import 'loading.dart';
import 'movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieList<T extends BlocBase<S>, S> extends StatelessWidget {
  final T bloc;
  final List Function(S state) getMovies;

  const MovieList({
    super.key,
    required this.bloc,
    required this.getMovies,
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
              padding: const EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieItem(movie: movie);
              },
            ),
          );
        }
        return const Loading();
      },
    );
  }
}
