import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetTopRatedListUseCase implements UseCase<List<Movie>, NoParams> {
  final MovieRepository _repository;
  const GetTopRatedListUseCase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await _repository.getTopRated();
  }
}
