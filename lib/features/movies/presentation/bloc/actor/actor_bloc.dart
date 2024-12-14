import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/failure_converter.dart';
import '../../../domain/entities/actor.dart';
import '../../../domain/use_cases/get_actor_list_use_case.dart';

part 'actor_event.dart';
part 'actor_state.dart';

class ActorBloc extends Bloc<ActorEvent, ActorState> {
  final GetActorListUseCase getActorListUseCase;
  ActorBloc({required this.getActorListUseCase}) : super(ActorInitial()) {
    on<GetActorListEvent>(_getActorListEvent);
  }

  Future _getActorListEvent(GetActorListEvent event, Emitter emit) async {
    emit(GetActorListLoadingState());

    final result = await getActorListUseCase(Params(id: event.id));

    result.fold(
      (l) => emit(GetActorListFailureState(mapFailureToMessage(l))),
      (r) => emit(GetActorListSuccessState(r)),
    );
  }
}
