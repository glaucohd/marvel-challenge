import 'package:marvel_challenge/src/data/models/thumbnail_model.dart';
import 'package:marvel_challenge/src/domain/entities/characters_entity.dart';
import 'package:marvel_challenge/src/domain/entities/thumbnail_entity.dart';

import '../../core/util.dart';

class CharactersModel extends CharactersEntity {
  CharactersModel({
    int? id,
    String? name,
    String? description,
    String? modified,
    ThumbnailEntity? thumbnailEntity,
    String? resourceURI,
  }) : super(
          description: description,
          id: id,
          modified: modified,
          name: name,
          resourceURI: resourceURI,
          thumbnailEntity: thumbnailEntity,
        );

  factory CharactersModel.fromJson(dynamic json) {
    return CharactersModel(
      description: Util.stringJson(json['description']),
      id: Util.intJson(json['id']),
      modified: Util.stringJson('modified'),
      name: Util.stringJson(json['name']),
      resourceURI: Util.stringJson(json['resourceURI']),
      thumbnailEntity: ThumbnailModel.fromJson(json['thumbnail']),
    );
  }
}
