import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetNewPlayingListUsecase implements UseCase<List<Movie>, NoParams> {
  final MovieRepository _repository;
  const GetNewPlayingListUsecase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await _repository.getNoewPlaying();
  }
}
