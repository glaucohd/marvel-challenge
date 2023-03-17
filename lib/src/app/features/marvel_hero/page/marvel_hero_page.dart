import 'package:flutter/material.dart';
import 'package:marvel_challenge/src/app/features/marvel_hero/widget/bar_title_widget.dart';
import 'package:provider/provider.dart';

import '../controllers/marvel_hero_controller.dart';
import '../widget/botton_page_navigator_widgte.dart';
import '../widget/footer_widget.dart';
import '../widget/header_widget.dart';
import '../widget/list_hero_widget.dart';
import '../widget/search_character_widget.dart';

class MarvelHeroPage extends StatefulWidget {
  const MarvelHeroPage({super.key});

  @override
  State<MarvelHeroPage> createState() => _MarvelHeroPageState();
}

class _MarvelHeroPageState extends State<MarvelHeroPage> {
  late final MarvelHeroController controller;

  @override
  void initState() {
    controller = context.read<MarvelHeroController>();
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderWidget(),
              SearchCharacterWidget(),
              SizedBox(height: 12),
              BarTitleWidget(),
              ListHeroWidget(),
              BottonPageNavigatorWidget(),
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
