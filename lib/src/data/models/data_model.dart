import 'package:marvel_challenge/src/domain/entities/data_entity.dart';

import '../../core/util.dart';
import 'characters_model.dart';

class DataModel extends DataEntity {
  DataModel({
    int? offset,
    int? limit,
    int? total,
    int? count,
    List<CharactersModel>? listCharacters,
  }) : super(
          offset: offset,
          count: count,
          limit: limit,
          listCharacters: listCharacters,
          total: total,
        );
  factory DataModel.fromJson(dynamic json) {
    return DataModel(
      count: Util.intJson(json['count']),
      limit: Util.intJson(json['limit']),
      offset: Util.intJson(json['offset']),
      total: Util.intJson(json['total']),
      listCharacters: Util.listJson(json['results'])
          .map((element) => CharactersModel.fromJson(Util.getMapJson(element)))
          .toList(),
    );
  }
}
