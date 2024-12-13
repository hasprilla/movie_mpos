import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/failure_converter.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/use_cases/get_new_playing_list_usecase.dart';

part 'playing_event.dart';
part 'playing_state.dart';

class PlayingBloc extends Bloc<PlayingEvent, PlayingState> {
  final GetNewPlayingListUsecase getNewPlayingListUsecase;
  PlayingBloc({required this.getNewPlayingListUsecase})
      : super(PlayingInitial()) {
    on<GetPlayingListEvent>(_getPlayingListEvent);
  }

  Future _getPlayingListEvent(GetPlayingListEvent event, Emitter emit) async {
    emit(GetPlayingListLoadingState());

    final result = await getNewPlayingListUsecase(NoParams());

    result.fold(
      (l) => emit(GetPlayingListFailureState(mapFailureToMessage(l))),
      (r) => emit(GetPlayingListSuccessState(r)),
    );
  }
}
