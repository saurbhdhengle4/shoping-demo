import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_demo/utility/constants.dart';

class HelpView extends StatelessWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
          backgroundColor: UIC.backgroundColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text("Help center")),
      body: SingleChildScrollView(
        padding: UIPADDING.h20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Div.th1,
            SZBOX.h10,
            Container(
              color: Colors.white,
              height: SZBOX.getHeight(context) / 4,
              width: SZBOX.getWidth(context),
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Help Center",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SZBOX.h10,
                        Text(
                          "please get in touch and we will be happy to help you",
                          style: Theme.of(context).textTheme.caption,
                          maxLines: 2,
                        )
                      ],
                    ),
                  )),
                  Expanded(child: Image.asset("assets/icon/helpcenter.png"))
                ],
              ),
            ),
            SZBOX.h10,
            SizedBox(
              height: SZBOX.getHeight(context) / 2,
              width: SZBOX.getWidth(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text(
                      "MORE QUERIES RELATED TO YOUR EXPERIENCE",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SZBOX.h5,
                  const TILESHEET(
                    title: 'Payment/Refund',
                  ),
                  SZBOX.h3,
                  const TILESHEET(
                    title: 'Offers, Descounts, Coupons',
                  ),
                  SZBOX.h3,
                  const TILESHEET(
                    title: 'Manage Your Account',
                  ),
                  SZBOX.h3,
                  const TILESHEET(
                    title: 'Other',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TILESHEET extends StatelessWidget {
  const TILESHEET({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.caption,
            ),
            Icon(FontAwesomeIcons.angleRight, color: UIC.icongry)
          ],
        ),
      ),
    );
  }
}


