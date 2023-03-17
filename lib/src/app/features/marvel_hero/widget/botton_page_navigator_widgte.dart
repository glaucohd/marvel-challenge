import 'package:flutter/material.dart';
import 'package:marvel_challenge/src/core/constants.dart';
import 'package:provider/provider.dart';

import '../controllers/marvel_hero_controller.dart';

class BottonPageNavigatorWidget extends StatefulWidget {
  const BottonPageNavigatorWidget({super.key});

  @override
  State<BottonPageNavigatorWidget> createState() =>
      _BottonPageNavigatorWidgetState();
}

class _BottonPageNavigatorWidgetState extends State<BottonPageNavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MarvelHeroController>(
        builder: (context, controller, child) {
      controller.startBottonNavigator();
      return Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: controller.currentPage == 1
                  ? null
                  : () {
                      controller.decrement();
                      controller.getHeroByOffset(
                        numberPage: controller.currentPage,
                      );
                    },
              child: Icon(
                Icons.arrow_left,
                size: 75,
                color: Constants.kRed,
              ),
            ),
            for (int i = controller.groupStart;
                i <= controller.groupEnd && i <= controller.totalPages;
                i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    controller.currentPage = i;
                    controller.getHeroByOffset(numberPage: i);
                  });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: controller.currentPage == i ? Constants.kRed : null,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Constants.kRed),
                  ),
                  child: Center(
                      child: Text(
                    '$i',
                    style: TextStyle(
                      color: controller.currentPage == i
                          ? Constants.kWhite
                          : Constants.kRed,
                      fontSize: 21,
                      fontFamily: Constants.robotoBlack,
                    ),
                  )),
                ),
              ),
            GestureDetector(
              onTap: controller.currentPage == controller.totalPages
                  ? null
                  : () {
                      controller.increment();
                      controller.getHeroByOffset(
                        numberPage: controller.currentPage,
                      );
                    },
              child: Icon(
                Icons.arrow_right,
                size: 75,
                color: Constants.kRed,
              ),
            ),
          ],
        ),
      );
    });
  }
}
