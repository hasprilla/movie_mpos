part of 'actor_bloc.dart';

sealed class ActorEvent extends Equatable {
  const ActorEvent();

  @override
  List<Object> get props => [];
}

class GetActorListEvent extends ActorEvent {
  final int id;

  const GetActorListEvent({required this.id});

  @override
  List<Object> get props => [id];
}
