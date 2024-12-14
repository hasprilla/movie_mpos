enum AppRoute {
  movie(path: '/movie'),
  detail(path: '/detail');

  final String path;
  const AppRoute({required this.path});
}


