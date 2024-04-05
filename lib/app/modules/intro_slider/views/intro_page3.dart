import 'package:flutter/material.dart';
import 'package:shopping_demo/app/modules/intro_slider/views/background_image.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BackgroundImageFb1(
        imageUrl: 'assets/images/deliveries.png',
        child: Container(),
      ),
    );
  }
}
