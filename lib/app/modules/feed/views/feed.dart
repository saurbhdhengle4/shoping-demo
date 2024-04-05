import 'package:flutter/material.dart';
import 'package:shopping_demo/utility/constants.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
        backgroundColor: UIC.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text("unknown", style: UITEXTSTYLE.appbarS1),
      ),
      body: Padding(
        padding: UIPADDING.h20,
        child: Column(
          children: [
            Div.th1,
            const Align(
                alignment: Alignment.center, child: Text("Commimg soon....")),
          ],
        ),
      ),
    );
  }
}
