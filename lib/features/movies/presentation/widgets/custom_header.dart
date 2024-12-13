import '../../../../core/blocs/theme/theme_bloc.dart';
import 'movie_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 340,
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: context.select(
              (ThemeBloc bloc) => IconButton(
                icon: Icon(
                  bloc.state.isDarkMode
                      ? Icons.wb_sunny_outlined
                      : Icons.nightlight_round,
                ),
                onPressed: () => bloc.add(bloc.state.isDarkMode
                    ? LightThemeEvent()
                    : DarkThemeEvent()),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
              'Hello, what do you want to watch?',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: GestureDetector(
              onTap: () => showSearch(
                context: context,
                delegate: MovieSearchDelegate(),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(22),
                ),
                height: 30,
                width: double.infinity,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 12),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      // size: 20,
                    ),
                    SizedBox(width: 7),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
