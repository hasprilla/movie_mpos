part of 'rated_bloc.dart';

abstract class RatedState extends Equatable {
  const RatedState();

  @override
  List<Object> get props => [];
}

class RatedInitial extends RatedState {}

class GetRatedListLoadingState extends RatedState {}

class GetTopRatedListSuccessState extends RatedState {
  final List<Movie> rated;
  const GetTopRatedListSuccessState(this.rated);

  @override
  List<Object> get props => [rated];
}

class GetRatedListFailureState extends RatedState {
  final String message;
  const GetRatedListFailureState(this.message);

  @override
  List<Object> get props => [message];
}
