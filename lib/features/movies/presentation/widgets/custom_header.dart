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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0)
                .copyWith(top: 7, bottom: 10),
            child: GestureDetector(
              onTap: () => showSearch(
                context: context,
                delegate: MovieSearchDelegate(),
              ),
              child: Container(
                height:
                    45, // Aumenta la altura para que el botón sea más grande
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 16), // Aumenta el espacio inicial
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(
                        width:
                            10), // Aumenta el espacio entre el ícono y el texto
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16, // Incrementa el tamaño de la fuente
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
