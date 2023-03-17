import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants.dart';
import '../../core/util.dart';
import '../models/data_model.dart';
import 'characters_datasource.dart';

class CharactersDatasourceImpl implements CharactersDatasource {
  final http.Client client;

  CharactersDatasourceImpl({required this.client});

  @override
  Future<DataModel> getListCharacters({
    String? name,
    int? numberPage = 0,
  }) async {
    String endpoint = 'characters?nameStartsWith=$name&';
    String offset = 'offset=$numberPage&';
    String limit = 'limit=4&';

    DataModel dataHero = DataModel();

    late Uri url;
    if (name != null) {
      //url com pesquisa e offset default
      url =
          Uri.parse("${Constants.urlLink}$endpoint$limit$offset${Util.auth()}");
    } else if (name != null && numberPage! >= 0) {
      // url com pesquisa e offset personalizado
      url =
          Uri.parse("${Constants.urlLink}$endpoint$limit$offset${Util.auth()}");
    } else if (numberPage! >= 0) {
      //url só com offset
      url = Uri.parse(
          "${Constants.urlLink}characters?$limit$offset${Util.auth()}");
    }

    try {
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] == "Ok") {
        dataHero = DataModel.fromJson(jsonData["data"]);
      }
      return dataHero;
    } catch (e) {
      rethrow;
    }
  }
}
