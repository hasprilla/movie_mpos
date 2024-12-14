import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.originalTitle,
    required super.posterPath,
    required super.voteAverage,
    required super.overview,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      voteAverage: json['vote_average'].toDouble(),
      overview: json['overview'],
    );
  }
}
