import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String originalTitle;
  final String posterPath;
  final double voteAverage;

  const Movie({
    required this.originalTitle,
    required this.posterPath,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [originalTitle, posterPath, voteAverage];
}
