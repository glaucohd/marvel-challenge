import '../entities/data_entity.dart';

abstract class GetCharactersUseCase {
  Future<DataEntity> call({
    String? name,
    int? numberPage,
  });
}
