import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/actor.dart';
import '../repositories/movie_repository.dart';

class GetActorListUseCase implements UseCase<List<Actor>, Params>{
  final MovieRepository _repository;
  GetActorListUseCase(this._repository);
  @override
  Future<Either<Failure, List<Actor>>> call(Params params)async {
    return await _repository.getActors(id: params.id);
  }
}

class Params extends Equatable{
  final int id;

  const Params({required this.id});
  @override

  List<Object?> get props =>[id];
}