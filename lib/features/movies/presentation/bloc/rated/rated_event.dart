part of 'rated_bloc.dart';

abstract class RatedEvent extends Equatable {
  const RatedEvent();

  @override
  List<Object> get props => [];
}

class GetTopRatedListEvent extends RatedEvent {}
