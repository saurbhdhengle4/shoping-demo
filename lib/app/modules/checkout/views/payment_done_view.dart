import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/routes/app_pages.dart';
import 'package:shopping_demo/utility/constants.dart';

class PaymentDoneView extends StatelessWidget {
  const PaymentDoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      body: SizedBox(
        height: SZBOX.getHeight(context),
        width: SZBOX.getWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assets/images/done.gif'),
            const Spacer(),
            MaterialButton(
              shape: BorderR.floatingShap,
              color: UIC.s400,
              onPressed: () {
                Get.offAllNamed(Routes.HOME);
              },
              child: Text(
                "Next Shopping",
                style: Theme.of(context).textTheme.button,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
