import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_mpos/core/errors/failures.dart';
import 'package:movie_mpos/core/usecases/usecase.dart';
import 'package:movie_mpos/features/movies/domain/entities/movie.dart';
import 'package:movie_mpos/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_mpos/features/movies/domain/use_cases/get_new_playing_list_usecase.dart';

import 'get_new_playing_list_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late GetNewPlayingListUsecase usecase;
  late MockMovieRepository mockMovieRepository;
  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetNewPlayingListUsecase(mockMovieRepository);
  });

  final tActors = <Movie>[
    const Movie(
      id: 1,
      originalTitle: 'test',
      posterPath: 'test',
      voteAverage: 1,
      overview: 'test',
    ),
    const Movie(
      id: 2,
      originalTitle: 'test',
      posterPath: 'test',
      voteAverage: 1,
      overview: 'test',
    ),
    const Movie(
      id: 3,
      originalTitle: 'test',
      posterPath: 'test',
      voteAverage: 1,
      overview: 'test',
    ),
    const Movie(
      id: 4,
      originalTitle: 'test',
      posterPath: 'test',
      voteAverage: 1,
      overview: 'test',
    ),
  ];

  group('GetNewPlayingListUsecase', () {
    test('Debería obtener la lista de actores del repositorio', () async {
      when(mockMovieRepository.getNoewPlaying())
          .thenAnswer((_) async => Right(tActors));
      final result = await usecase(NoParams());
      expect(result, Right(tActors));
      verify(mockMovieRepository.getNoewPlaying());
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('Debería obtener un error al obtener la lista de playing', () async {
      when(mockMovieRepository.getNoewPlaying())
          .thenAnswer((_) async => Left(ServerFailure()));
      final result = await usecase(NoParams());
      expect(result, Left(ServerFailure()));
      verify(mockMovieRepository.getNoewPlaying());
      verifyNoMoreInteractions(mockMovieRepository);
    });
  });
}


