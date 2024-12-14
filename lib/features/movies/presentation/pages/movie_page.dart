import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/playing/playing_bloc.dart';
import '../bloc/rated/rated_bloc.dart';
import '../widgets/category_section.dart';
import '../widgets/custom_header.dart';

import '../widgets/movie_list.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            const CustomHeader(),
            Positioned(
              top: size.height * 0.36,
              left: 0,
              right: 0,
              child: Container(
                height: size.height,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Theme.of(context).canvasColor,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          SizedBox(height: size.height * 0.012),
                          const CategorySection(title: 'RECOMMENDED FOR YOU'),
                          MovieList<PlayingBloc, PlayingState>(
                            bloc: BlocProvider.of<PlayingBloc>(context),
                            getMovies: (state) =>
                                state is GetPlayingListSuccessState
                                    ? state.playing
                                    : [],
                          ),
                          const CategorySection(title: 'TOP RATED'),
                          MovieList<RatedBloc, RatedState>(
                            bloc: BlocProvider.of<RatedBloc>(context),
                            getMovies: (state) =>
                                state is GetTopRatedListSuccessState
                                    ? state.rated
                                    : [],
                          ),
                          SizedBox(height: size.height * 0.5),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
