import 'package:flutter/material.dart';
import 'package:shopping_demo/utility/constants.dart';

class BackgroundImageFb1 extends StatelessWidget {
  final Widget child;
  final String imageUrl;
  const BackgroundImageFb1(
      {required this.child, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SZBOX.getHeight(context) / 2,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: child,
    );
  }
}
