import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String originalTitle;
  final String posterPath;
  final double voteAverage;
  final String overview;

  const Movie({
    required this.id,
    required this.originalTitle,
    required this.posterPath,
    required this.voteAverage,
    required this.overview,
  });

  @override
  List<Object?> get props => [ id, originalTitle, posterPath, voteAverage, overview];
}
