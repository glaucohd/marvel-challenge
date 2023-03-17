import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      color: Constants.kRed,
    );
  }
}
