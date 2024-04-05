import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:shopping_demo/app/modules/profile/controller/saved_card_controller.dart';
import 'package:shopping_demo/app/routes/app_pages.dart';
import 'package:shopping_demo/utility/constants.dart';

class CheckoutSelectCard extends StatelessWidget {
  const CheckoutSelectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final savedCardController = Get.put(SavedCardController());
    final checkoutController = Get.put(CheckoutController());
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
        backgroundColor: UIC.backgroundColor,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text("Checkout", style: UITEXTSTYLE.appbarS1),
      ),
      body: SingleChildScrollView(
        padding: UIPADDING.h20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Div.th1,
            SZBOX.h10,
            Text("Select Your card",
                style: Theme.of(context).textTheme.bodyText1),
            SZBOX.h10,
            selectCard(savedCardController, checkoutController),
            SZBOX.h10,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => FloatingActionButton.extended(
          isExtended: true,
          shape: BorderR.floatingShap,
          backgroundColor: checkoutController.cardSelect.isFalse
              ? const Color(0xFF91A6D0)
              : const Color(0xFFFE8628),
          onPressed: checkoutController.cardSelect.isFalse
              ? () {
                  tost("plz select card");
                }
              : () => Get.toNamed(Routes.CHECKOUT),
          label: SizedBox(
            width: SZBOX.getWidth(context) / 1.5,
            child: const Center(
              child: Text(
                'Checkout now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Obx selectCard(SavedCardController savedCardController,
      CheckoutController checkoutController) {
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: savedCardController.cardlist.length,
        itemBuilder: (context, i) {
          CardModel data = savedCardController.cardlist[i];
          checkoutController.cardselect.value =
              List<bool>.filled(savedCardController.cardlist.length, false);
          return Obx(
            () => InkWell(
              onTap: () {
                checkoutController.cardSelect.toggle();

                checkoutController.cardselect[i] =
                    checkoutController.cardSelect.value;
              },
              child: Container(
                padding: UIPADDING.all10,
                decoration: BoxDecoration(
                    border: checkoutController.cardselect[i] == false
                        ? null
                        : Border.all(
                            color: UIC.iconblu,
                          ),
                    borderRadius: BorderR.br10,
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(data.image),
                        SZBOX.h5,
                        Text(
                          data.cardNumber,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SZBOX.h10,
                        Text(
                          data.balance,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => SZBOX.h10,
      ),
    );
  }
}
