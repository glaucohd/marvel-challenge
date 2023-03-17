import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/routes.dart';

class SlashScreenPage extends StatefulWidget {
  const SlashScreenPage({super.key});

  @override
  State<SlashScreenPage> createState() => _SlashScreenPageState();
}

class _SlashScreenPageState extends State<SlashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Lottie.asset('assets/json/iron-man.json'),
        ),
      ),
    );
  }
}
