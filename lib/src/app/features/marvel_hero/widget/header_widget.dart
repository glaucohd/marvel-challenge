import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 40,
                    child: RichText(
                      text: TextSpan(
                          text: Constants.marvelSearch,
                          style: TextStyle(
                            color: Constants.kRed,
                            fontSize: 16,
                            fontFamily: Constants.robotoBlack,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: Constants.testFronEnd,
                              style: TextStyle(
                                color: Constants.kRed,
                                fontSize: 16,
                                fontFamily: Constants.robotoLight,
                              ),
                            )
                          ]),
                    ),
                  ),
                  Positioned(
                    top: 23,
                    child: Container(
                      height: 2,
                      width: 54,
                      color: Constants.kRed,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
