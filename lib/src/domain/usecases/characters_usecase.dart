import 'package:marvel_challenge/src/domain/entities/data_entity.dart';

import '../repositories/characters_repository.dart';

class CharactersUsecase {
  final CharactersRepository repository;
  CharactersUsecase({required this.repository});

  Future<DataEntity> call({
    String? name,
    int? numberPage,
  }) async {
    return repository.getListCharacters(
      name: name,
      numberPage: numberPage,
    );
  }
}
