part of 'playing_bloc.dart';

abstract class PlayingState extends Equatable {
  const PlayingState();

  @override
  List<Object> get props => [];
}

class PlayingInitial extends PlayingState {}

class GetPlayingListLoadingState extends PlayingState {}

class GetPlayingListSuccessState extends PlayingState {
  final List<Movie> playing;
  const GetPlayingListSuccessState(this.playing);

  @override
  List<Object> get props => [playing];
}

class GetPlayingListFailureState extends PlayingState {
  final String message;
  const GetPlayingListFailureState(this.message);

  @override
  List<Object> get props => [message];
}
