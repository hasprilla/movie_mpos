import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/actor.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../data_sources/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({required this.movieRemoteDataSource});

  final MovieRemoteDataSource movieRemoteDataSource;

  @override
  Future<Either<Failure, List<Movie>>> getTopRated() async {
    try {
      final result = await movieRemoteDataSource.getTopRated();
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNoewPlaying() async {
    try {
      final result = await movieRemoteDataSource.getNoewPlaying();
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Actor>>> getActors({required int id}) async {
    try {
      final result = await movieRemoteDataSource.getActors(id: id);
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }
}
