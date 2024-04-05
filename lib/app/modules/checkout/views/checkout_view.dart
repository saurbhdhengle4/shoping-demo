import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/cart/controller/cart_controller.dart';
import 'package:shopping_demo/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:shopping_demo/app/modules/profile/controller/address_view_controller.dart';
import 'package:shopping_demo/app/modules/profile/controller/saved_card_controller.dart';
import 'package:shopping_demo/app/routes/app_pages.dart';
import 'package:shopping_demo/utility/constants.dart';

class PaymentsView extends StatelessWidget {
  const PaymentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());
    final savedCardController = Get.put(SavedCardController());
    final checkoutController = Get.put(CheckoutController());
    final cartConroller = Get.put(CartController());
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
            // SZBOX.h10,
            // // Text("Select Your delivery address",
            // //     style: Theme.of(context).textTheme.bodyText1),
            // SZBOX.h10,
            // // selectAddress(addressController, checkoutController),
            // SZBOX.h10,
            // Div.th1,
            // SZBOX.h10,
            // // Text("Select Your card",
            // //     style: Theme.of(context).textTheme.bodyText1),
            // SZBOX.h10,
            // // selectCard(savedCardController, checkoutController),
            // Div.th1,
            // SZBOX.h10,
            Obx(
              () => Container(
                height: SZBOX.getHeight(context) / 5,
                width: SZBOX.getWidth(context),
                padding: UIPADDING.all20,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderR.br20),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment total",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w900),
                        ),
                        SZBOX.h15,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text("\$",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: UIC.iconblu)),
                            ),
                            Text(
                              cartConroller.totalCount.value.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: UIC.iconblu),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Obx(
                      () => Visibility(
                        visible: checkoutController.addressSelect.isTrue,
                        child: Positioned(
                          bottom: 30,
                          right: 10,
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.squareCheck,
                                color: Colors.green.shade600,
                                size: 14,
                              ),
                              SZBOX.w05,
                              Text(
                                "Address",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: checkoutController.cardSelect.isTrue,
                        child: Positioned(
                          bottom: 10,
                          right: 27,
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.squareCheck,
                                color: Colors.green.shade600,
                                size: 14,
                              ),
                              SZBOX.w05,
                              Text(
                                "Card",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        shape: BorderR.floatingShap,
        backgroundColor: const Color(0xFFFE8628),
        onPressed: () => Get.toNamed(Routes.DONE),
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

  Obx selectAddress(AddressController addressController,
      CheckoutController checkoutController) {
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: addressController.addressList.length,
        itemBuilder: (context, i) {
          AddressModel data = addressController.addressList[i];
          checkoutController.isChecked.value =
              List<bool>.filled(addressController.addressList.length, false);
          return Obx(
            () => InkWell(
              onTap: () {
                checkoutController.addressSelect.toggle();

                checkoutController.isChecked[i] =
                    checkoutController.addressSelect.value;
              },
              child: Container(
                  padding: UIPADDING.all10,
                  decoration: BoxDecoration(
                      border: checkoutController.isChecked[i] == false
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.type,
                            style: Theme.of(context).textTheme.button,
                          ),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.mobile,
                                  size: 16, color: UIC.icongry),
                              SZBOX.w05,
                              Text(
                                data.mobileno,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SZBOX.h5,
                      Text(
                        data.name,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SZBOX.h10,
                      Text(
                        data.address,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  )),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => SZBOX.h10,
      ),
    );
  }
}
