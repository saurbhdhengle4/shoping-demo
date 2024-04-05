import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/api_services/model/productsmodel.dart';
import 'package:shopping_demo/app/modules/cart/controller/cart_controller.dart';
import 'package:shopping_demo/app/modules/home/controllers/home_controller.dart';
import 'package:shopping_demo/app/routes/app_pages.dart';
import 'package:shopping_demo/utility/constants.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
        backgroundColor: UIC.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text("My Cart", style: UITEXTSTYLE.appbarS1),
      ),
      body: ListView(
        padding: UIPADDING.h20,
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Div.th1,
              SZBOX.h10,
              const Offer(),
              SZBOX.h10,
              Row(
                children: [
                  Text('My Cart', style: Theme.of(context).textTheme.headline6),
                  const Spacer(),
                  Obx(
                    () => Visibility(
                      visible: controller.cartlist.isNotEmpty,
                      child: Checkbox(
                          value: controller.checkbox.value,
                          onChanged: (value) {
                            controller.checkbox.toggle();
                            controller.isChecked.value = List<bool>.filled(
                                controller.cartlist.length,
                                controller.checkbox.value);
                          }),
                    ),
                  ),
                  Obx(() => Text("${controller.cartlist.length} Products",
                      style: Theme.of(context).textTheme.caption))
                ],
              ),
              Obx(
                () => controller.cartlist.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.cartlist.length,
                        itemBuilder: (BuildContext context, int i) {
                          ProductsModeal item = controller.cartlist[i];
                          controller.isChecked.value = List<bool>.filled(
                              controller.cartlist.length, false);
                          controller.quantityList.value =
                              List<int>.filled(controller.cartlist.length, 1);
                          controller.priceList.value = List<double>.filled(
                              controller.cartlist.length, item.price!);
                          return Container(
                            color: Colors.white,
                            height: SZBOX.getHeight(context) / 7,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 0,
                                  child: Obx(
                                    () => Checkbox(
                                        value: controller.isChecked[i],
                                        onChanged: (value) {
                                          controller.isChecked[i] = value!;
                                          if (controller.isChecked[i] = true) {
                                            controller.totalCount.value =
                                                controller.totalCount.value +
                                                    item.price!;
                                            controller.isChecked[i] = value;
                                          } else {
                                            controller.totalCount.value =
                                                controller.totalCount.value -
                                                    item.price!;
                                            controller.isChecked[i] = value;
                                          }
                                          controller.checkbox.value = true;
                                        }),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.DETAILPRODUCTVIEW,
                                          arguments: item);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: UIC.imgBackground,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: SZBOX.getHeight(context) / 9,
                                      width: SZBOX.getWidth(context) / 3,
                                      child: Image.asset(item.image.toString()),
                                    ),
                                  ),
                                ),
                                SZBOX.w10,
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: UIPADDING.all15,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.title.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.cartlist.removeAt(i);
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: UIC.icongry,
                                                size: 18,
                                              ),
                                            )
                                          ],
                                        ),
                                        SZBOX.h10,
                                        Text(
                                          "Size 21",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$ ${item.price}",
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: UIC.iconblu),
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    if (controller
                                                            .quantityList[i] !=
                                                        0) {
                                                      controller
                                                          .quantityList[i]--;
                                                      controller.priceList[
                                                          i] = controller
                                                              .priceList[i] /
                                                          controller
                                                              .quantityList[i];
                                                    } else {
                                                      controller.cartlist
                                                          .removeAt(i);
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    padding: UIPADDING.all02,
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                SZBOX.w05,
                                                Obx(
                                                  () => Text(
                                                      controller.quantityList[i]
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 16)),
                                                ),
                                                SZBOX.w05,
                                                InkWell(
                                                  onTap: () {
                                                    controller
                                                        .quantityList[i]++;
                                                    controller.priceList[
                                                        i] = controller
                                                            .priceList[i] *
                                                        controller
                                                            .quantityList[i];
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFEFA520),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    padding: UIPADDING.all02,
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SZBOX.h10,
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => FloatingActionButton.extended(
          isExtended: true,
          shape: BorderR.floatingShap,
          backgroundColor: controller.checkbox.isFalse
              ? const Color(0xFF91A6D0)
              : const Color(0xFFFE8628),
          onPressed: controller.checkbox.isFalse
              ? () {
                  tost("Plese Select cart item");
                }
              : () => Get.toNamed(Routes.CHOUTSELECTADDRESS),
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
}

class Offer extends StatelessWidget {
  const Offer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SZBOX.getHeight(context) / 6.5,
      width: SZBOX.getWidth(context),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFEFA520), Color(0xFFEE9B06)]),
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
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
