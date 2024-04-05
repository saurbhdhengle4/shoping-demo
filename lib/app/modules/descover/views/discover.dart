import 'package:badges/badges.dart' as b;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/api_services/model/productsmodel.dart';
import 'package:shopping_demo/app/modules/descover/controller/discover_controller.dart';
import 'package:shopping_demo/app/routes/app_pages.dart';
import 'package:shopping_demo/utility/constants.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Discovercontroller());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: UIC.backgroundColor,
          elevation: 0,
          leading: Image.asset('assets/icon/basket.png'),
          title: Text("Shopeasy", style: TextStyle(color: UIC.p)),
          actions: [
            b.Badge(
                position: b.BadgePosition.topEnd(top: 10, end: 10),
                badgeContent: const Text('3',
                    style: TextStyle(color: Colors.white, fontSize: 10)),
                child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.NOTIFICATIONVIEW);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.solidBell,
                      size: 23,
                      color: UIC.p300,
                    )))
          ]),
      body: SingleChildScrollView(
        padding: UIPADDING.h20,
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SZBOX.h25,
            Text(
              "Discover",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            Text(
              "Find anything what you want",
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 16),
            ),
            SZBOX.h25,
            Row(
              children: [
                SizedBox(
                    width: SZBOX.getHeight(context) / 3.1,
                    child: const SearchInput(hintText: "Search here")),
                const Spacer(),
                Container(
                  height: 45,
                  width: SZBOX.getHeight(context) / 16,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.sliders,
                        size: 20,
                        color: UIC.gry300,
                      )),
                ),
              ],
            ),
            SZBOX.h25,
            Obx(
              () => GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.catagoryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
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
            ),
            SZBOX.h20,
            Row(
              children: [
                Text("Super hot promo",
                    style: Theme.of(context).textTheme.headline6!.copyWith()),
                SZBOX.w05,
                Image.asset("assets/icon/list.png", height: 16)
              ],
            ),
            SZBOX.h10,
            Obx(
              () => controller.loading.isFalse
                  ? GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      scrollDirection: Axis.vertical,
                      children:
                          controller.gategoryList.map((ProductsModeal item) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.DETAILPRODUCTVIEW,
                                arguments: item);
                          },
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 5),
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
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: UIC.s100,
                                                  padding: UIPADDING.all05,
                                                  child: Text(
                                                    'Promo',
                                                    style: TextStyle(
                                                        color: UIC.s400),
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Expanded(
                                                child: Text(
                                                  "\$${item.price}",
                                                  style: TextStyle(
                                                      color: UIC.p300),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: UIC.s400,
                      ),
                    ),
            ),
            SZBOX.h10,
          ],
        ),
      ),
    );
  }
}

class TileSheets extends StatelessWidget {
  const TileSheets({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);
  final IconData icon;
  final String name;
  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Center(child: Text(name)),
      child: Center(child: FaIcon(icon, color: UIC.s500)),
    );
  }
}

class SearchInput extends StatelessWidget {
  final String hintText;
  const SearchInput({required this.hintText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        //  controller: textController,
        onChanged: (value) {
          //Do something wi
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xff4338CA),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ),
    );
  }
}
