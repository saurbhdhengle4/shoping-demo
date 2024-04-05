import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shopping_demo/api_services/model/productsmodel.dart';
import 'package:shopping_demo/app/modules/cart/controller/cart_controller.dart';
import 'package:shopping_demo/app/modules/detailproduct/controller/detail_product_controller.dart';
import 'package:shopping_demo/app/modules/home/controllers/home_controller.dart';
import 'package:shopping_demo/app/modules/profile/controller/wish_list_controller.dart';
import 'package:shopping_demo/utility/constants.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailProductController());
    final cartController = Get.put(CartController());
    final homeController = Get.put(HomeController());
    final wishlistController = Get.put(WishListController());
    ProductsModeal item = Get.arguments;
    return Scaffold(
        backgroundColor: UIC.backgroundColor,
        appBar: AppBar(
          backgroundColor: UIC.backgroundColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text("Detail Product"),
        ),
        body: Obx(
          () => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: UIPADDING.h20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: SZBOX.getWidth(context),
                  height: SZBOX.getHeight(context) / 2.5,
                  decoration: BoxDecoration(
                      color: UIC.imgBackground, borderRadius: BorderR.br40),
                  child: Column(
                    children: [
                      SizedBox(
                          height: SZBOX.getHeight(context) / 2.5 / 2,
                          child: controller.selectedImg.value == ""
                              ? Image.asset(item.image.toString())
                              : Image.asset(controller.selectedImg.value)),
                      const Spacer(),
                      Container(
                        padding: UIPADDING.h25,
                        height: SZBOX.getHeight(context) / 2.5 / 3.5,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: item.subImg!.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                controller.index.value = i;
                                controller.selectedImg.value =
                                    item.subImg![i].toString();
                              },
                              child: Container(
                                width: SZBOX.getWidth(context) / 3,
                                decoration: BoxDecoration(
                                  color: i == controller.index.value
                                      ? UIC.imgBackground
                                      : UIC.imgForground,
                                  border: i == controller.index.value
                                      ? Border.all(color: UIC.gry200)
                                      : Border.all(color: Colors.transparent),
                                ),
                                child: Image.asset(
                                  item.subImg![i].toString(),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              SZBOX.w15,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                SZBOX.h20,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title.toString(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          '\$${item.price}',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      color: Colors.white,
                      padding: UIPADDING.all10,
                      child: InkWell(
                          onTap: () async {
                            final box =
                                context.findRenderObject() as RenderBox?;

                            await Share.share(
                              item.description.toString(),
                              subject: item.title.toString(),
                              sharePositionOrigin:
                                  box!.localToGlobal(Offset.zero) & box.size,
                            );
                          },
                          child: Icon(Icons.share, color: UIC.icongry)),
                    ),
                    SZBOX.wm05(context),
                    Container(
                      color: Colors.white,
                      padding: UIPADDING.all10,
                      child: InkWell(
                          onTap: () {
                            controller.wishList.toggle();
                            wishlistController.wishList.add(item);
                          },
                          child: Icon(Icons.favorite,
                              color: controller.wishList.isFalse
                                  ? UIC.icongry
                                  : UIC.iconblu)),
                    ),
                  ],
                ),
                SZBOX.h20,
                const Text(
                  "Product discount",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SZBOX.h10,
                SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.discountList.length,
                    itemBuilder: (context, i) {
                      var staticItem = controller.discountList[i];
                      return Obx(
                        () => MaterialButton(
                          elevation: 0,
                          color: controller.discountListIndex.value != i
                              ? UIC.imgBackground
                              : UIC.iconblu,
                          onPressed: () {
                            controller.discountListIndex.value = i;
                          },
                          child: Text(
                            staticItem,
                            style: TextStyle(
                                color: controller.discountListIndex.value != i
                                    ? UIC.gry300
                                    : Colors.white),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SZBOX.w15,
                  ),
                ),
                SZBOX.h20,
                const Text(
                  "Product discription",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SZBOX.h10,
                Text(
                  item.description.toString(),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xFFFE8628),
          foregroundColor: Colors.black,
          onPressed: () {
            cartController.cartlist.add(item);
            homeController.changeTabIndex(2);
            Get.back();
          },
          label: Row(
            children: [
              const Text(
                'Add to cart',
                style: TextStyle(color: Colors.white),
              ),
              SZBOX.wm20(context),
              SZBOX.wm20(context),
              const Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.white,
                size: 16,
              )
            ],
          ),
        ));
  }
}
