import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:shopping_demo/app/modules/profile/controller/address_view_controller.dart';
import 'package:shopping_demo/app/routes/app_pages.dart';
import 'package:shopping_demo/utility/constants.dart';

class ChekoutSelectAddress extends StatelessWidget {
  const ChekoutSelectAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());
    final checkoutcontroller = Get.put(CheckoutController());
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
        backgroundColor: UIC.backgroundColor,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text("Address", style: UITEXTSTYLE.appbarS1),
      ),
      body: SingleChildScrollView(
        padding: UIPADDING.h20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Div.th1,
            SZBOX.h10,
            Text("Select Your delivery address",
                style: Theme.of(context).textTheme.bodyText1),
            SZBOX.h10,
            selectAddress(addressController, checkoutcontroller),
            SZBOX.h10,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => FloatingActionButton.extended(
          isExtended: true,
          shape: BorderR.floatingShap,
          backgroundColor: checkoutcontroller.addressSelect.isFalse
              ? const Color(0xFF91A6D0)
              : const Color(0xFFFE8628),
          onPressed: checkoutcontroller.addressSelect.isFalse
              ? () {
                  tost("Plese select address");
                }
              : () => Get.toNamed(Routes.CHOUTSELECTcard),
          label: SizedBox(
            width: SZBOX.getWidth(context) / 1.5,
            child: const Center(
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
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
