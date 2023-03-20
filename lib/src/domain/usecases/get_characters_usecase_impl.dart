import 'package:marvel_challenge/src/domain/entities/data_entity.dart';

import '../repositories/characters_repository.dart';
import 'get_characters_usecase.dart';

class GetCharactersUsecaseImpl implements GetCharactersUseCase {
  final CharactersRepository repository;
  GetCharactersUsecaseImpl({required this.repository});

  @override
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
