import 'package:flutter_test/flutter_test.dart';
import 'package:movie_mpos/features/movies/domain/entities/movie.dart';

void main() {
  group('Pruebas de clase de cine', () {
    test('Prueba de constructor', () {
      const movie = Movie(
        id: 1,
        originalTitle: 'Test Movie',
        posterPath: '/path/to/poster',
        voteAverage: 8.5,
        overview: 'This is a test movie',
      );

      expect(movie.id, 1);
      expect(movie.originalTitle, 'Test Movie');
      expect(movie.posterPath, '/path/to/poster');
      expect(movie.voteAverage, 8.5);
      expect(movie.overview, 'This is a test movie');
    });

    test('Prueba de igualdad', () {
      const movie1 = Movie(
        id: 1,
        originalTitle: 'Test Movie',
        posterPath: '/path/to/poster',
        voteAverage: 8.5,
        overview: 'This is a test movie',
      );

      const movie2 = Movie(
        id: 1,
        originalTitle: 'Test Movie',
        posterPath: '/path/to/poster',
        voteAverage: 8.5,
        overview: 'This is a test movie',
      );

      expect(movie1, movie2);
    });

    test('Prueba de desigualdad', () {
      const movie1 = Movie(
        id: 1,
        originalTitle: 'Test Movie',
        posterPath: '/path/to/poster',
        voteAverage: 8.5,
        overview: 'This is a test movie',
      );

      const movie2 = Movie(
        id: 2,
        originalTitle: 'Different Movie',
        posterPath: '/different/path',
        voteAverage: 7.5,
        overview: 'This is a different movie',
      );

      expect(movie1, isNot(movie2));
    });
  });
}
