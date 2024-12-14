import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTopRated();
  Future<Either<Failure, List<Movie>>> getNoewPlaying();
  
}
