import 'package:badges/badges.dart' as b;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/cart/controller/cart_controller.dart';
import 'package:shopping_demo/app/modules/cart/views/cart_view.dart';
import 'package:shopping_demo/app/modules/descover/views/discover.dart';
import 'package:shopping_demo/app/modules/profile/views/profile.dart';
import 'package:shopping_demo/app/modules/store/views/store.dart';
import 'package:shopping_demo/utility/constants.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: UIC.backgroundColor,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex.value,
              children: const [
                DiscoverView(),
                // FeedView(),
                StoreView(),
                CartView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            selectedItemColor: UIC.p300,
            unselectedIconTheme: IconThemeData(color: UIC.gry300),
            showSelectedLabels: false,
            backgroundColor: UIC.p300,
            items: [
              BottomNavigationBarItem(
                  icon:
                      bottomnavigationDecoration(icon: FontAwesomeIcons.house),
                  label: 'Home'),
              // BottomNavigationBarItem(
              //     icon: bottomnavigationDecoration(icon: FontAwesomeIcons.box),
              //     label: 'feed'),
              BottomNavigationBarItem(
                  icon:
                      bottomnavigationDecoration(icon: FontAwesomeIcons.store),
                  label: 'Store'),
              BottomNavigationBarItem(
                  icon: Obx(
                    () => b.Badge(
                      position: b.BadgePosition.topEnd(top: 0, end: 0),
                      badgeContent: Text(
                          cartController.cartlist.length.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10)),
                      child: bottomnavigationDecoration(
                          icon: FontAwesomeIcons.cartShopping),
                    ),
                  ),
                  label: 'Chart'),
              BottomNavigationBarItem(
                  icon: bottomnavigationDecoration(
                      icon: FontAwesomeIcons.solidUser),
                  label: 'Profile'),
            ],
          ),
        );
      },
    );
  }

  Container bottomnavigationDecoration({required IconData icon}) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: UIC.backgroundColor,
        ),
        padding: const EdgeInsets.all(10),
        child: FaIcon(icon));
  }
}
