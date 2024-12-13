import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/failure_converter.dart';
import '../../../domain/entities/movie.dart';

import '../../../domain/use_cases/get_top_rated_list_usecase.dart';

part 'rated_event.dart';
part 'rated_state.dart';

class RatedBloc extends Bloc<RatedEvent, RatedState> {
  final GetTopRatedListUseCase getMovieListUseCase;

  RatedBloc({required this.getMovieListUseCase}) : super(RatedInitial()) {
    on<GetTopRatedListEvent>(_getTopRatedListEvent);
  }

  Future _getTopRatedListEvent(GetTopRatedListEvent event, Emitter emit) async {
    emit(GetRatedListLoadingState());

    final result = await getMovieListUseCase(NoParams());

    result.fold(
      (l) => emit(GetRatedListFailureState(mapFailureToMessage(l))),
      (r) => emit(GetTopRatedListSuccessState(r)),
    );
  }
}
