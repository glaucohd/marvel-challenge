import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../controllers/marvel_hero_controller.dart';

class DetailHeroPage extends StatelessWidget {
  const DetailHeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MarvelHeroController>(
        builder: (context, controller, child) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Constants.kRed,
          title: Text(
            controller.detailHero.name ?? "-",
            style: TextStyle(
              color: Constants.kWhite,
              fontSize: 18,
              fontFamily: Constants.robotoBlack,
            ),
          ),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  fit: BoxFit.cover,
                  imageUrl: controller.detailHero.pathImage ?? "-",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: Constants.robotoRegular,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      controller.detailHero.description ?? "-",
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      );
    });
  }
}
