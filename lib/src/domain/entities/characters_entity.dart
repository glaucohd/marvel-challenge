import 'package:marvel_challenge/src/domain/entities/thumbnail_entity.dart';

class CharactersEntity {
  int? id;
  String? name;
  String? description;
  String? modified;
  ThumbnailEntity? thumbnailEntity;
  String? resourceURI;

  CharactersEntity({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnailEntity,
    this.resourceURI,
  });
}
