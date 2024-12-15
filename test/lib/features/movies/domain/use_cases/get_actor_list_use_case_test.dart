import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_mpos/core/errors/failures.dart';
import 'package:movie_mpos/features/movies/domain/entities/actor.dart';
import 'package:movie_mpos/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_mpos/features/movies/domain/use_cases/get_actor_list_use_case.dart';

import 'get_actor_list_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late GetActorListUseCase usecase;
  late MockMovieRepository mockMovieRepository;
  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetActorListUseCase(mockMovieRepository);
  });

  const tId = Params(id: 1);
  final tActors = <Actor>[
    const Actor(id: 1, name: ' test', profilePath: 'test', character: 'test'),
    const Actor(id: 2, name: ' test', profilePath: 'test', character: 'test'),
    const Actor(id: 3, name: ' test', profilePath: 'test', character: 'test'),
    const Actor(id: 4, name: ' test', profilePath: 'test', character: 'test'),
  ];

  group('GetActorListUseCase', () {
    test('Debería obtener la lista de actores del repositorio', () async {
      when(mockMovieRepository.getActors(id: tId.id))
          .thenAnswer((_) async => Right(tActors));
      final result = await usecase(Params(id: tId.id));
      expect(result, Right(tActors));
      verify(mockMovieRepository.getActors(id: tId.id));
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('Debería obtener un error al obtener la lista de actores', () async {
      when(mockMovieRepository.getActors(id: tId.id))
          .thenAnswer((_) async => Left(ServerFailure()));
      final result = await usecase(Params(id: tId.id));
      expect(result, Left(ServerFailure()));
      verify(mockMovieRepository.getActors(id: tId.id));
      verifyNoMoreInteractions(mockMovieRepository);
    });
  });
}
