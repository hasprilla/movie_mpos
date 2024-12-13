import 'package:go_router/go_router.dart';


import '../../features/movies/presentation/pages/movie_page.dart';
import 'app_route_path.dart';

class AppRouteConf {
  GoRouter get router => _router;

  late final _router = GoRouter(
    initialLocation: AppRoute.movie.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoute.movie.path,
        name: AppRoute.movie.name,
        builder: (_, __) => const MoviePage(),
      ),
    ],
  );
}
