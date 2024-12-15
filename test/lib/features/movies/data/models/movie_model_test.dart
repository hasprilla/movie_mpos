import 'package:flutter_test/flutter_test.dart';
import 'package:movie_mpos/features/movies/data/models/movie_model.dart';

void main() {
  group('MovieModel', () {
    test('Constructor', () {
      const movie = MovieModel(
        id: 1,
        originalTitle: 'Título de prueba',
        posterPath: '/ruta/de/prueba',
        voteAverage: 8.5,
        overview: 'Descripción de prueba',
      );

      expect(movie.id, 1);
      expect(movie.originalTitle, 'Título de prueba');
      expect(movie.posterPath, '/ruta/de/prueba');
      expect(movie.voteAverage, 8.5);
      expect(movie.overview, 'Descripción de prueba');
    });

    test('fromJson', () {
      final json = {
        'id': 1,
        'original_title': 'Título de prueba',
        'poster_path': '/ruta/de/prueba',
        'vote_average': 8.5,
        'overview': 'Descripción de prueba',
      };

      final movie = MovieModel.fromJson(json);

      expect(movie.id, 1);
      expect(movie.originalTitle, 'Título de prueba');
      expect(movie.posterPath, '/ruta/de/prueba');
      expect(movie.voteAverage, 8.5);
      expect(movie.overview, 'Descripción de prueba');
    });

    test('toJson', () {
      const movie = MovieModel(
        id: 1,
        originalTitle: 'Título de prueba',
        posterPath: '/ruta/de/prueba',
        voteAverage: 8.5,
        overview: 'Descripción de prueba',
      );

      final json = movie.toJson();

      expect(json['id'], 1);
      expect(json['original_title'], 'Título de prueba');
      expect(json['poster_path'], '/ruta/de/prueba');
      expect(json['vote_average'], 8.5);
      expect(json['overview'], 'Descripción de prueba');
    });
  });
}
