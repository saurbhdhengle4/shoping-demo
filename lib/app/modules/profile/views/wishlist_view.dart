import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/api_services/model/productsmodel.dart';
import 'package:shopping_demo/app/modules/home/controllers/home_controller.dart';
import 'package:shopping_demo/app/modules/profile/controller/wish_list_controller.dart';
import 'package:shopping_demo/app/routes/app_pages.dart';
import 'package:shopping_demo/utility/constants.dart';

class WithListView extends StatelessWidget {
  const WithListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WishListController());
    final homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
          backgroundColor: UIC.backgroundColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text("Wishlist")),
      body: SingleChildScrollView(
        padding: UIPADDING.h20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Div.th1,
            Obx(
              () => controller.wishList.isNotEmpty
                  ? GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      scrollDirection: Axis.vertical,
                      children: controller.wishList.map((ProductsModeal item) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.DETAILPRODUCTVIEW,
                                arguments: item);
                          },
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 5),
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        height: SZBOX.getHeight(context) / 7.5,
                                        width: SZBOX.getWidth(context) / 2,
                                        color: UIC.backgroundColor,
                                        child: Image.asset(
                                          item.image.toString(),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 2,
                                      right: 2,
                                      child: InkWell(
                                        onTap: () {
                                          controller.wishList.remove(item);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderR.br20,
                                          ),
                                          child: Icon(
                                            Icons.cancel,
                                            color: UIC.icongry,
                                            size: 14,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 0,
                                          bottom: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SZBOX.h5,
                                          Text(item.title.toString()),
                                          SZBOX.h5,
                                          Text(
                                            item.category.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                          const Spacer(),
                                          Text(
                                            "\$${item.price}",
                                            style: TextStyle(color: UIC.p300),
                                          ),
                                          const Spacer(),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(growable: true),
                    )
                  : SizedBox(
                      height: SZBOX.getHeight(context) / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                homeController.changeTabIndex(0);
                                Get.back();
                                Get.back();
                              },
                              icon: Container(
                                padding: const EdgeInsets.all(5),
                                color: UIC.imgBackground,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                              ))
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
