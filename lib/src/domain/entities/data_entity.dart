import 'characters_entity.dart';

class DataEntity {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<CharactersEntity>? listCharacters;

  DataEntity({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.listCharacters,
  });
}
