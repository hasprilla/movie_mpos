 import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_mpos/features/movies/data/models/actor_model.dart';



void main() {
  group('ActorModel', () {
    const String jsonStr = '''
    {
      "id": 123,
      "name": "John Doe",
      "profile_path": "/path/to/profile.jpg",
      "character": "Main Actor"
    }
    ''';

    final Map<String, dynamic> json = jsonDecode(jsonStr);
    final ActorModel actorModel = ActorModel.fromJson(json);

    test('fromJson() debe crear un objeto ActorModel a partir de JSON', () {
      expect(actorModel.id, equals(123));
      expect(actorModel.name, equals('John Doe'));
      expect(actorModel.profilePath, equals('/path/to/profile.jpg'));
      expect(actorModel.character, equals('Main Actor'));
    });

    test('toJson() debe convertir un objeto ActorModel a JSON', () {
      final Map<String, dynamic> json = actorModel.toJson();
      expect(json['id'], equals(123));
      expect(json['name'], equals('John Doe'));
      expect(json['profile_path'], equals('/path/to/profile.jpg'));
      expect(json['character'], equals('Main Actor'));
    });
  });
}