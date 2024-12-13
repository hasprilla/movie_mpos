part of 'playing_bloc.dart';

abstract class PlayingEvent extends Equatable {
  const PlayingEvent();

  @override
  List<Object> get props => [];
}

  class GetPlayingListEvent extends PlayingEvent {}