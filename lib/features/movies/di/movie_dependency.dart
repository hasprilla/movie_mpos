import '../../../core/api/api_helper.dart';
import '../../../core/injector/injector_conf.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/entities/actor.dart';
import '../domain/use_cases/get_actor_list_use_case.dart';
import '../domain/use_cases/get_new_playing_list_usecase.dart';
import '../domain/use_cases/get_top_rated_list_usecase.dart';
import '../presentation/bloc/actor/actor_bloc.dart';
import '../presentation/bloc/playing/playing_bloc.dart';
import '../presentation/bloc/rated/rated_bloc.dart';

class MovieDependency {
  MovieDependency._();
  static void init() {
    getIt.registerFactory(
      () => RatedBloc(
        getMovieListUseCase: getIt<GetTopRatedListUseCase>(),
      ),
    );

    getIt.registerFactory(
      () => PlayingBloc(
        getNewPlayingListUsecase: getIt<GetNewPlayingListUsecase>(),
      ),
    );
    getIt.registerFactory(
      () => ActorBloc(
        getActorListUseCase: getIt<GetActorListUseCase>(),
      ),
    );

    getIt.registerLazySingleton(
      () => GetTopRatedListUseCase(
        getIt<MovieRepositoryImpl>(),
      ),
    );

    getIt.registerLazySingleton(
      () => GetNewPlayingListUsecase(
        getIt<MovieRepositoryImpl>(),
      ),
    );
    getIt.registerLazySingleton(
      () => GetActorListUseCase(
        getIt<MovieRepositoryImpl>(),
      ),
    );

    getIt.registerLazySingleton(
      () => MovieRepositoryImpl(
        movieRemoteDataSource: getIt<MovieRemoteDataSourceImpl>(),
      ),
    );

    getIt.registerLazySingleton(
      () => MovieRemoteDataSourceImpl(
        helper: getIt<ApiHelper>(),
      ),
    );
  }
}
