part of 'actor_bloc.dart';

abstract class ActorState extends Equatable {
  const ActorState();
  
  @override
  List<Object> get props => [];
}

 class ActorInitial extends ActorState {}

class GetActorListLoadingState extends ActorState {}

class GetActorListSuccessState extends ActorState {
  final List<Actor> actor;
  const GetActorListSuccessState(this.actor);

  @override
  List<Object> get props => [actor];
}

class GetActorListFailureState extends ActorState {
  final String message;
  const GetActorListFailureState(this.message);

  @override
  List<Object> get props => [message];
}