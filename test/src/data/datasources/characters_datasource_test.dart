import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_challenge/src/data/datasources/characters_datasource_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'characters_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final client = MockClient();
  final datasource = CharactersDatasourceImpl(client: client);
  test('deve retornar uma lista de result model', () async {
    when(client.get(Uri.parse('http://gateway.marvel.com/v1/public')))
        .thenAnswer((_) => Future.value(http.Response(body, 200)));

    final future = datasource.getListCharacters(name: "Hulk", numberPage: 0);
    expect(future, completes);
  });
}

const body = '''{
"name": "hulk"
}''';
