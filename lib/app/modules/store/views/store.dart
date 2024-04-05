import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/api_services/model/store_model.dart';
import 'package:shopping_demo/app/modules/descover/views/discover.dart';
import 'package:shopping_demo/app/modules/store/controller/storecontroller.dart';
import 'package:shopping_demo/utility/constants.dart';

class StoreView extends StatelessWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoreViewControlller());
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
        backgroundColor: UIC.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text("Official Store", style: UITEXTSTYLE.appbarS1),
      ),
      body: RefreshIndicator(
        displacement: 80,
        backgroundColor: Colors.white,
        color: UIC.iconblu,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 1500));
        },
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: UIPADDING.h20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Div.th1,
                SZBOX.h20,
                Text("Super hot promo",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.bold)),
                SZBOX.h10,
                catagory(controller),
                SZBOX.h20,
                Obx(
                  () => ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        StoreModel item = controller.storeList[index];
                        return Container(
                          height: SZBOX.getHeight(context) / 1.8,
                          width: SZBOX.getWidth(context),
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderR.br10),
                          child: Padding(
                            padding: UIPADDING.all10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      item.logo.toString(),
                                      height: SZBOX.getHeight(context) / 15,
                                    ),
                                    SPACE.sp,
                                    Text(
                                      item.title.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    SZBOX.w05,
                                    FaIcon(
                                      FontAwesomeIcons.store,
                                      size: 15,
                                      color: UIC.iconblu,
                                    )
                                  ],
                                ),
                                Container(
                                  height: SZBOX.getHeight(context) / 3,
                                  width: SZBOX.getWidth(context),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderR.br15,
                                      image: DecorationImage(
                                          image:
                                              AssetImage(item.image.toString()),
                                          fit: BoxFit.fill)),
                                ),
                                SPACE.sp,
                                Row(
                                  children: [
                                    Obx(
                                      () => Row(
                                        children: [
                                          InkWell(
                                            onTap: () =>
                                                controller.wishList.toggle(),
                                            child: Icon(Icons.favorite,
                                                size: 22,
                                                color:
                                                    controller.wishList.isTrue
                                                        ? UIC.icongry
                                                        : UIC.iconblu),
                                          ),
                                          SZBOX.w05,
                                          Text(
                                            item.like.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          )
                                        ],
                                      ),
                                    ),
                                    SZBOX.w15,
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            FontAwesomeIcons.comments,
                                            color: UIC.icongry,
                                            size: 22,
                                          ),
                                        ),
                                        SZBOX.w10,
                                        Text(
                                          item.communts.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        )
                                      ],
                                    ),
                                    SZBOX.w15,
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(Icons.share,
                                          size: 22, color: UIC.icongry),
                                    ),
                                  ],
                                ),
                                SPACE.sp,
                                Text(
                                  item.description.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        if (index == 0) {
                          return const Offer2();
                        } else {
                          return SZBOX.h10;
                        }
                      },
                      itemCount: controller.storeList.length),
                )
              ],
            )),
      ),
    );
  }

  Obx catagory(StoreViewControlller controller) {
    return Obx(
      () => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.catagoryList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context, int i) {
          return Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: TileSheets(
                icon: controller.catagoryList[i].icon,
                name: controller.catagoryList[i].name,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Offer2 extends StatelessWidget {
  const Offer2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: SizedBox(
        height: SZBOX.getHeight(context) / 8,
        width: SZBOX.getWidth(context),
        child: Container(
          height: SZBOX.getHeight(context) / 6.5,
          width: SZBOX.getWidth(context),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF36B5F8), Color(0xFF2EADF0)]),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: UIPADDING.h20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CLAIM NOW!",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.white),
                ),
                SZBOX.h10,
                Text(
                  "SPECIAL OFFERS",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
