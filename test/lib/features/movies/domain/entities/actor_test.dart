import 'package:flutter_test/flutter_test.dart';
import 'package:movie_mpos/features/movies/domain/entities/actor.dart';

void main() {
  group('Actor', () {
    test('El constructor inicializa las propiedades correctamente', () {
      const actor = Actor(
        id: 1,
        name: 'John Doe',
        profilePath: '/path/to/profile',
        character: 'Main Character',
      );

      expect(actor.id, 1);
      expect(actor.name, 'John Doe');
      expect(actor.profilePath, '/path/to/profile');
      expect(actor.character, 'Main Character');
    });

    test('El getter de propiedades devuelve todas las propiedades', () {
      const actor = Actor(
        id: 1,
        name: 'John Doe',
        profilePath: '/path/to/profile',
        character: 'Main Character',
      );

      expect(
          actor.props, [1, 'John Doe', '/path/to/profile', 'Main Character']);
    });

    test('La comparación de igualdad funciona correctamente', () {
      const actor1 = Actor(
        id: 1,
        name: 'John Doe',
        profilePath: '/path/to/profile',
        character: 'Main Character',
      );

      const actor2 = Actor(
        id: 1,
        name: 'John Doe',
        profilePath: '/path/to/profile',
        character: 'Main Character',
      );

      const actor3 = Actor(
        id: 2,
        name: 'Jane Doe',
        profilePath: '/path/to/profile',
        character: 'Main Character',
      );

      expect(actor1, actor2);
      expect(actor1, isNot(actor3));
    });
  });
}
