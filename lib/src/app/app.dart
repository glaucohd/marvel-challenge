import 'package:flutter/material.dart';
import 'package:marvel_challenge/src/core/routes.dart';

import 'features/marvel_hero/page/detail_hero_page.dart';
import 'features/marvel_hero/page/marvel_hero_page.dart';
import 'features/marvel_hero/page/splash_screen_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SlashScreenPage(),
      routes: {
        Routes.home: (context) => const MarvelHeroPage(),
        Routes.detail: (context) => const DetailHeroPage(),
      },
    );
  }
}
