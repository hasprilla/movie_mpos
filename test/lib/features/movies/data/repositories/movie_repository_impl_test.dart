import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_mpos/core/errors/exceptions.dart';
import 'package:movie_mpos/core/errors/failures.dart';
import 'package:movie_mpos/features/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_mpos/features/movies/data/models/actor_model.dart';
import 'package:movie_mpos/features/movies/data/models/movie_model.dart';
import 'package:movie_mpos/features/movies/data/repositories/movie_repository_impl.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDataSource>()])
void main() {
  late MovieRepositoryImpl repository;
  late MockMovieRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockMovieRemoteDataSource();
    repository =
        MovieRepositoryImpl(movieRemoteDataSource: mockRemoteDataSource);
  });

  group('getTopRated', () {
    test('debería obtener la lista de películas top-rated del repositorio',
        () async {
      final tMovies = <MovieModel>[
        const MovieModel(
            id: 1,
            originalTitle: 'Test Movie',
            posterPath: '/path/to/poster',
            voteAverage: 8.5,
            overview: 'This is a test movie'),
        const MovieModel(
            id: 2,
            originalTitle: 'Test Movie 2',
            posterPath: '/path/to/poster2',
            voteAverage: 8.5,
            overview: 'This is a test movie 2'),
      ];
      when(mockRemoteDataSource.getTopRated()).thenAnswer((_) async => tMovies);

      final result = await repository.getTopRated();

      expect(result, Right(tMovies));
      verify(mockRemoteDataSource.getTopRated());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('debería obtener un error al obtener la lista de películas top-rated',
        () async {
      when(mockRemoteDataSource.getTopRated()).thenThrow(ServerException());

      final result = await repository.getTopRated();

      expect(result, Left(ServerFailure()));
      verify(mockRemoteDataSource.getTopRated());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

  group('getNoewPlaying', () {
    test('debería obtener la lista de películas new playing del repositorio',
        () async {
      final tMovies = <MovieModel>[
        const MovieModel(
            id: 1,
            originalTitle: 'Test Movie',
            posterPath: '/path/to/poster',
            voteAverage: 8.5,
            overview: 'This is a test movie'),
        const MovieModel(
            id: 2,
            originalTitle: 'Test Movie 2',
            posterPath: '/path/to/poster2',
            voteAverage: 8.5,
            overview: 'This is a test movie 2'),
      ];
      when(mockRemoteDataSource.getNoewPlaying())
          .thenAnswer((_) async => tMovies);

      final result = await repository.getNoewPlaying();

      expect(result, Right(tMovies));
      verify(mockRemoteDataSource.getNoewPlaying());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test(
        'debería obtener un error al obtener la lista de películas new playing',
        () async {
      when(mockRemoteDataSource.getNoewPlaying()).thenThrow(ServerException());

      final result = await repository.getNoewPlaying();

      expect(result, Left(ServerFailure()));
      verify(mockRemoteDataSource.getNoewPlaying());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

  group('getActors', () {
    test('debería obtener la lista de actores del repositorio', () async {
      final tActors = <ActorModel>[
        const ActorModel(
            id: 1,
            name: 'Test Actor',
            profilePath: '/path/to/profile',
            character: 'Test Character'),
        const ActorModel(
            id: 2,
            name: 'Test Actor 2',
            profilePath: '/path/to/profile2',
            character: 'Test Character 2'),
      ];
      when(mockRemoteDataSource.getActors(id: 1))
          .thenAnswer((_) async => tActors);

      final result = await repository.getActors(id: 1);

      expect(result, Right(tActors));
      verify(mockRemoteDataSource.getActors(id: 1));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('debería obtener un error al obtener la lista de actores', () async {
      when(mockRemoteDataSource.getActors(id: 1)).thenThrow(ServerException());

      final result = await repository.getActors(id: 1);

      expect(result, Left(ServerFailure()));
      verify(mockRemoteDataSource.getActors(id: 1));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
