import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_challenge/src/domain/entities/data_entity.dart';
import 'package:marvel_challenge/src/domain/repositories/characters_repository.dart';
import 'package:marvel_challenge/src/domain/usecases/get_characters_usecase_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_characters_usecase_test.mocks.dart';

@GenerateMocks([CharactersRepository])
void main() {
  final repository = MockCharactersRepository();
  final usecase = GetCharactersUsecaseImpl(repository: repository);

  test('Deve um objeto do tipo DataEntity', () async {
    // Arrange
    DataEntity dataHero = DataEntity();

    when(repository.getListCharacters(name: "Hulk", numberPage: 0))
        .thenAnswer((_) async => dataHero);
    // Act
    final result = await usecase(name: "Hulk", numberPage: 0);

    // Assert
    expect(result, isInstanceOf<DataEntity>());
  });
}
