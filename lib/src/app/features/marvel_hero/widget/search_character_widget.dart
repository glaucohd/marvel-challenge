import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../controllers/marvel_hero_controller.dart';

class SearchCharacterWidget extends StatelessWidget {
  const SearchCharacterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Constants.heroName,
            style: TextStyle(
              color: Constants.kRed,
              fontSize: 16,
              fontFamily: Constants.robotoRegular,
            ),
          ),
          SizedBox(
            width: 400,
            height: 31,
            child: Consumer<MarvelHeroController>(
              builder: (context, controller, child) {
                return TextField(
                  controller: controller.textController,
                  onChanged: (_) {
                    controller.getHeroByLetter();
                  },
                  decoration: InputDecoration(
                    fillColor: Constants.kGrayLight,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Constants.kGrayLight,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
