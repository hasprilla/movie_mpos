import '../../domain/entities/actor.dart';

class ActorModel extends Actor {
  const ActorModel({
    required super.id,
    required super.name,
    super.profilePath,
    super.character,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'],
      character: json['character'],
    );
  }
}
