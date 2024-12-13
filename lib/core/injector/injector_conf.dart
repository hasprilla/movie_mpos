import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../features/movies/di/movie_dependency.dart';
import '../api/api_helper.dart';
import '../api/api_interceptor.dart';
import '../routes/app_route_conf.dart';
import '../blocs/theme/theme_bloc.dart';

final getIt = GetIt.I;

void configureDepedencies() {
  MovieDependency.init();

  getIt.registerLazySingleton(
    () => ThemeBloc(),
  );

  getIt.registerLazySingleton(
    () => AppRouteConf(),
  );

  getIt.registerLazySingleton(
    () => ApiHelper(
      getIt<Dio>(),
    ),
  );

  getIt.registerLazySingleton(
    () => Dio()
      ..interceptors.add(
        getIt<ApiInterceptor>(),
      ),
  );

  getIt.registerLazySingleton(
    () => ApiInterceptor(),
  );
}
