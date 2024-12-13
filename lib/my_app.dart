import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/blocs/theme/theme_bloc.dart';
import 'core/injector/injector_conf.dart';
import 'core/themes/app_theme.dart';
import 'core/routes/app_route_conf.dart';
import 'features/movies/presentation/bloc/playing/playing_bloc.dart';
import 'features/movies/presentation/bloc/rated/rated_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouteConf>().router;
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => GestureDetector(
        onTap: () => primaryFocus?.unfocus(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<ThemeBloc>()),
            BlocProvider(
                create: (_) => getIt<RatedBloc>()
                  ..add(
                    GetTopRatedListEvent(),
                  )),
            BlocProvider(
                create: (_) => getIt<PlayingBloc>()
                  ..add(
                    GetPlayingListEvent(),
                  )),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (_, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.data(state.isDarkMode),
                routerConfig: router,
              );
            },
          ),
        ),
      ),
    );
  }
}
