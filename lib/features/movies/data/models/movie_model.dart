import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.originalTitle,
    required super.posterPath,
    required super.voteAverage,
    required super.overview,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      voteAverage: json['vote_average'].toDouble(),
      overview: json['overview'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'original_title': originalTitle,
      'poster_path': posterPath,
      'vote_average': voteAverage,
      'overview': overview,
    };
  }
}
