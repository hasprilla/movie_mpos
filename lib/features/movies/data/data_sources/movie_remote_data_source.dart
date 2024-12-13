import '../../../../core/api/api_helper.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/movie_model.dart';

abstract interface class MovieRemoteDataSource {
  Future<List<MovieModel>> getTopRated();
  Future<List<MovieModel>> getNoewPlaying();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  MovieRemoteDataSourceImpl({required this.helper});

  final ApiHelper helper;

  @override
  Future<List<MovieModel>> getTopRated() async {
    try {
      final response = await helper.request(
        method: Method.get,
        url: '/movie/top_rated',
      );
      return _jsonToMovie(response);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getNoewPlaying() async {
    try {
      final response = await helper.request(
        method: Method.get,
        url: '/movie/now_playing',
      );
      return _jsonToMovie(response);
    } catch (e) {
      throw ServerException();
    }
  }

  List<MovieModel> _jsonToMovie(Map<String, dynamic> json) {
    final List<MovieModel> movies =
        (json['results'] as List).map((e) => MovieModel.fromJson(e)).toList();
    return movies;
  }
}
