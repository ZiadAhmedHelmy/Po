

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon_app/view/Screens/homePage.dart';

class PokeSplash extends StatelessWidget {
  const PokeSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:SvgPicture.asset("assets/images/Pokemon.svg"),
      nextScreen:  homePage(),
      animationDuration:const Duration(seconds: 2),
      splashTransition:SplashTransition.fadeTransition,
    );
  }
}
