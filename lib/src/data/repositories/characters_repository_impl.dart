import 'package:marvel_challenge/src/data/models/data_model.dart';

import '../../domain/repositories/characters_repository.dart';
import '../datasources/characters_datasource.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersDatasource datasource;

  CharactersRepositoryImpl({required this.datasource});

  @override
  Future<DataModel> getListCharacters({
    String? name,
    int? numberPage,
  }) async {
    final result = await datasource.getListCharacters(
      name: name,
      numberPage: numberPage,
    );

    return result;
  }
}
