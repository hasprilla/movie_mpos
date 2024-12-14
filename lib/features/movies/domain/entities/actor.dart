import 'package:equatable/equatable.dart';

class Actor extends Equatable {
  final int id;
  final String name;
  final String? profilePath;
  final String? character;

  const Actor({
    required this.id,
    required this.name,
    this.profilePath,
    this.character,
  });

  @override
  List<Object?> get props => [id, name, profilePath, character];
}
