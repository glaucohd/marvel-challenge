import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class BarTitleWidget extends StatelessWidget {
  const BarTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      color: Constants.kRed,
      alignment: Alignment.center,
      child: Text(
        Constants.name,
        style: TextStyle(
          color: Constants.kWhite,
          fontSize: 16,
          fontFamily: Constants.robotoRegular,
        ),
      ),
    );
  }
}
