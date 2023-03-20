import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../controllers/marvel_hero_controller.dart';
import '../vo/hero_vo.dart';

class CharacterWidget extends StatelessWidget {
  final List<CharactersVO> listHero;
  final int index;
  const CharacterWidget({
    required this.listHero,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MarvelHeroController>(
        builder: (context, controller, child) {
      final hero = controller.heroVO;
      return InkWell(
        onTap: () {
          controller.navigateGotoDetailPage(
              context: context, hero: hero.listCharacters![index]);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: 58,
                    height: 58,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            color: Constants.kRed,
                            value: progress.progress,
                          ),
                        ),
                        fit: BoxFit.cover,
                        imageUrl: listHero[index].pathImage ?? "-",
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  Flexible(
                    flex: 1,
                    child: Text(
                      listHero[index].name ?? "-",
                      style: TextStyle(
                        color: Constants.kGray,
                        fontSize: 21,
                        fontFamily: Constants.robotoRegular,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Constants.kRed,
              height: 2,
            )
          ],
        ),
      );
    });
  }
}
