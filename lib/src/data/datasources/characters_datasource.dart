import '../models/data_model.dart';

abstract class CharactersDatasource {
  Future<DataModel> getListCharacters({
    String? name,
    int? numberPage,
  });
}
