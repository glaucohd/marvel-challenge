import 'package:marvel_challenge/src/domain/entities/thumbnail_entity.dart';

import '../../core/util.dart';

class ThumbnailModel extends ThumbnailEntity {
  ThumbnailModel({
    String? path,
    String? extension,
  }) : super(
          extension: extension,
          path: path,
        );

  factory ThumbnailModel.fromJson(dynamic json) {
    return ThumbnailModel(
      path: Util.stringJson(json['path']),
      extension: Util.stringJson(json['extension']),
    );
  }
}
