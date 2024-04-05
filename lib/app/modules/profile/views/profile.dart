import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/profile/controller/profile_controller.dart';
import 'package:shopping_demo/app/routes/app_pages.dart';
import 'package:shopping_demo/utility/constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileListtile(),
            SZBOX.hm10(context),
            CustomCard(
                child: ListTileTab(
              iColor: Colors.blueAccent,
              icon: FontAwesomeIcons.circleQuestion,
              onTap: () {
                Get.toNamed(Routes.HELPCENTER);
              },
              subtitle: ' Help regarding your rescent purchases',
              title: 'Help Center',
            )),
            SZBOX.h10,
            CustomCard(
                child: ListTileTab(
              iColor: Colors.red.shade300,
              icon: Icons.favorite,
              onTap: () {
                Get.toNamed(Routes.WISHLIST);
              },
              subtitle: 'Your most loved styles',
              title: 'Wishlist',
            )),
            SZBOX.h10,
            CustomCard(
                child: ListTileTab(
              iColor: Colors.brown.shade300,
              icon: FontAwesomeIcons.idCard,
              onTap: () {
                Get.toNamed(Routes.SAVEDCARD);
              },
              subtitle: 'Save your cards for faster checkout',
              title: 'Saved Cards',
            )),
            SZBOX.h10,
            CustomCard(
                child: ListTileTab(
              iColor: Colors.greenAccent.shade400,
              icon: FontAwesomeIcons.addressCard,
              onTap: () {
                Get.toNamed(Routes.ADDRESS);
              },
              subtitle: 'Save addresses for a hassle-free checkout',
              title: 'Address',
            )),
            SZBOX.h10,
            CustomCard(
                child: ListTileTab(
              iColor: Colors.blueAccent,
              icon: FontAwesomeIcons.gears,
              onTap: () {
                Get.toNamed(Routes.SETTINGS);
              },
              subtitle: 'Manage notification & app settings',
              title: 'Settings',
            )),
            SZBOX.h10,
            Padding(
              padding: UIPADDING.h30,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: SZBOX.getHeight(context) / 20,
                  width: SZBOX.getWidth(context),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(
                      child: Text(
                    "Logout",
                    style: Theme.of(context).textTheme.button!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListTileTab extends StatelessWidget {
  const ListTileTab({
    Key? key,
    required this.icon,
    required this.iColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final Color iColor;
  final String title;
  final String subtitle;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center, child: FaIcon(icon, color: iColor)),
          SZBOX.w15,
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: Theme.of(context).textTheme.bodyText1),
                Text(subtitle, style: Theme.of(context).textTheme.caption!),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(Icons.arrow_forward, size: 20, color: UIC.s400),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIPADDING.h20,
      child: Container(
        padding: UIPADDING.all10,
        height: SZBOX.getHeight(context) / 10,
        width: SZBOX.getWidth(context),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: child,
      ),
    );
  }
}

class ProfileListtile extends StatelessWidget {
  const ProfileListtile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: SZBOX.getWidth(context),
          height: SZBOX.getHeight(context) / 5,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/profileback.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SZBOX.hm2(context),
              Text(
                "My profile",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black87),
              ),
              Padding(
                padding: UIPADDING.h20,
                child: Div.th0_5,
              )
            ],
          ),
        ),
        Positioned(
            top: 120,
            left: 20,
            right: 20,
            child: Container(
              padding: UIPADDING.all10,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: SZBOX.getHeight(context) / 9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: SZBOX.getHeight(context) / 22,
                      foregroundImage: const AssetImage('assets/icon/man.png'),
                      child: const Icon(Icons.account_circle)),
                  SZBOX.w15,
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(controller.name.value,
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                        Text("Premium Member",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: UIC.iconblu)),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        color: UIC.iconblu,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      padding: UIPADDING.all05,
                      child:
                          const Icon(Icons.edit, size: 14, color: Colors.white),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.PROFILEEDIT);
                    },
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
