import 'package:flutter/material.dart';

import 'src/app/app.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'src/app/features/marvel_hero/controllers/marvel_hero_controller.dart';
import 'src/data/datasources/characters_datasource_impl.dart';
import 'src/data/repositories/characters_repository_impl.dart';
import 'src/domain/usecases/get_characters_usecase_impl.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MarvelHeroController(
            getListCharacters: GetCharactersUsecaseImpl(
              repository: CharactersRepositoryImpl(
                datasource: CharactersDatasourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
