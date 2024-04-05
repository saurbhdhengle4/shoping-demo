import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/profile/controller/setting_controller.dart';
import 'package:shopping_demo/utility/constants.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
          backgroundColor: UIC.backgroundColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text("Settings")),
      body: SingleChildScrollView(
        padding: UIPADDING.h20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Div.th1,
            SZBOX.h20,
            Container(
              color: Colors.white,
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.solidBell,
                  color: UIC.p,
                ),
                title: const Text("Notifications"),
                subtitle: const Text("This will not affect order updates"),
                trailing: Obx(
                  () => Switch(
                    activeColor: UIC.p,
                    inactiveThumbColor: UIC.icongry,
                    value: controller.btn1.value,
                    onChanged: (val) {
                      controller.btn1.value = val;
                    },
                  ),
                ),
              ),
            ),
            SZBOX.h10,
            Container(
              color: Colors.white,
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.gear,
                  color: UIC.p,
                ),
                title: const Text("Optimized Experience"),
                subtitle: Text(
                  "For internet connection quality",
                  style: Theme.of(context).textTheme.caption,
                ),
                trailing: Obx(
                  () => Switch(
                    activeColor: UIC.p,
                    inactiveThumbColor: UIC.icongry,
                    value: controller.btn2.value,
                    onChanged: (val) {
                      controller.btn2.value = val;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
