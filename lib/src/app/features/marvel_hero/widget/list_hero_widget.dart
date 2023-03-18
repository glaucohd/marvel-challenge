import 'package:flutter/material.dart';
import 'package:marvel_challenge/src/app/features/marvel_hero/widget/character_widget.dart';
import 'package:marvel_challenge/src/core/constants.dart';
import 'package:provider/provider.dart';

import '../controllers/marvel_hero_controller.dart';

class ListHeroWidget extends StatefulWidget {
  const ListHeroWidget({super.key});

  @override
  State<ListHeroWidget> createState() => _ListHeroWidgetState();
}

class _ListHeroWidgetState extends State<ListHeroWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MarvelHeroController>(
        builder: (context, controller, child) {
      final hero = controller.heroVO;

      return controller.isLoading != false
          ? Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Constants.kRed,
                    ),
                  ],
                ),
              ),
            )
          : Expanded(
              child: hero.listCharacters!.isEmpty
                  ? Center(
                      child: Text(
                        Constants.notFound,
                        style: TextStyle(
                          color: Constants.kRed,
                          fontSize: 16,
                          fontFamily: Constants.robotoRegular,
                        ),
                      ),
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: hero.listCharacters?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.navigateGotoDetailPage(
                                context: context,
                                hero: hero.listCharacters![index]);
                          },
                          child: CharacterWidget(
                            index: index,
                            listHero: hero.listCharacters ?? [],
                          ),
                        );
                      },
                    ),
            );
    });
  }
}
