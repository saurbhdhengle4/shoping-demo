import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/profile/controller/saved_card_controller.dart';
import 'package:shopping_demo/app/routes/app_pages.dart';
import 'package:shopping_demo/utility/constants.dart';

class SavedCards extends StatelessWidget {
  const SavedCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SavedCardController());
    return Scaffold(
        backgroundColor: UIC.backgroundColor,
        appBar: AppBar(
            backgroundColor: UIC.backgroundColor,
            centerTitle: true,
            elevation: 0,
            foregroundColor: Colors.black,
            title: const Text("Saved cards")),
        body: SingleChildScrollView(
          padding: UIPADDING.h20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Div.th1,
              Obx(
                () => ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int i) {
                    var data = controller.cardlist;
                    return InkWell(
                      onTap: () {},
                      child: CreditCard(
                        cardIcon: data[i].image,
                        onTopRightButtonClicked: () {},
                        backgroundGradient: const LinearGradient(
                            colors: [Colors.black87, Colors.black54]),
                        balance: data[i].name,
                        cardNumber: data[i].cardNumber,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SZBOX.h15,
                  itemCount: controller.cardlist.length,
                ),
              ),
              SZBOX.hm15(context),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          isExtended: true,
          shape: BorderR.floatingShap,
          backgroundColor: const Color(0xFFFE8628),
          onPressed: () => Get.toNamed(Routes.ADDNEWCARD),
          label: SizedBox(
            width: SZBOX.getWidth(context) / 1.5,
            child: const Center(
              child:
                  Text('Add new card', style: TextStyle(color: Colors.white)),
            ),
          ),
        ));
  }
}

class CreditCard extends StatelessWidget {
  final String balance;
  final String cardNumber;
  final Function onTopRightButtonClicked;
  final Gradient backgroundGradient;
  final String cardIcon;

  const CreditCard({
    Key? key,
    required this.onTopRightButtonClicked,
    required this.cardIcon,
    required this.balance,
    required this.cardNumber,
    this.backgroundGradient =
        const LinearGradient(colors: [Colors.black87, Colors.black54]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: backgroundGradient,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(.50),
        //     offset: const Offset(0, 0),
        //     blurRadius: 45,
        //   )
        // ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  onTopRightButtonClicked();
                },
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cardNumber,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    Image.asset(cardIcon, width: 50),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    balance,
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Column(
                    children: [
                      Text(
                        "VALIDITY",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[400]),
                      ),
                      SZBOX.h5,
                      Text(
                        "XX/XX",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
