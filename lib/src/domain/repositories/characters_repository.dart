import 'package:marvel_challenge/src/domain/entities/data_entity.dart';

abstract class CharactersRepository {
  Future<DataEntity> getListCharacters({
    String? name,
    int? numberPage,
  });
}
