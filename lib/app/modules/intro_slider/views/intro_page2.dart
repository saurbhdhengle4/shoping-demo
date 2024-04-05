import 'package:flutter/material.dart';
import 'package:shopping_demo/app/modules/intro_slider/views/background_image.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BackgroundImageFb1(
        imageUrl: 'assets/images/order_confirmed.png',
        child: Container(),
      ),
    );
  }
}
