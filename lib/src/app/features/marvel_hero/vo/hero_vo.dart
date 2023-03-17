import '../../../../domain/entities/thumbnail_entity.dart';

class HeroVO {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<CharactersVO>? listCharacters;

  HeroVO({
    this.count,
    this.limit,
    this.offset,
    this.total,
    this.listCharacters,
  });
}

class CharactersVO {
  int? id;
  String? name;
  String? description;
  ThumbnailEntity? thumbnailEntity;
  String? pathImage;

  CharactersVO({
    this.id,
    this.name,
    this.description,
    this.thumbnailEntity,
    this.pathImage,
  });
}
