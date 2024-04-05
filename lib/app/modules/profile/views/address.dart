import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/profile/controller/address_view_controller.dart';
import 'package:shopping_demo/app/routes/app_pages.dart';
import 'package:shopping_demo/utility/constants.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
          backgroundColor: UIC.backgroundColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text("Address")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: UIPADDING.h20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Div.th1,
            Obx(
              () => ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int i) {
                  var data = controller.addressList[i];
                  return Container(
                    height: SZBOX.getHeight(context) / 8,
                    width: SZBOX.getWidth(context),
                    padding: UIPADDING.all10,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SZBOX.h5,
                        Row(
                          children: [
                            Icon(
                              Icons.mobile_friendly,
                              color: UIC.icongry,
                              size: 16,
                            ),
                            Text(
                              " ${data.mobileno}",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                        SZBOX.h5,
                        SZBOX.h5,
                        Text(
                          "${data.address}${data.city}${data.state} -${data.pincode}",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: controller.addressList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    SZBOX.h10,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        backgroundColor: const Color(0xFF91A6D0),
        onPressed: () {
          Get.toNamed(Routes.ADDNEWADDRESS);
        },
        label: SizedBox(
          width: SZBOX.getWidth(context) / 1.5,
          child: const Center(
            child: Text(
              'Add New Address',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
