import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/notification/controller/notification_controller.dart';
import 'package:shopping_demo/utility/constants.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
          backgroundColor: UIC.backgroundColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text("Notification")),
      body: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: UIPADDING.h20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Div.th1,
                SZBOX.h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Unread notification",
                        style:
                            Theme.of(context).textTheme.headline6!.copyWith()),
                    TextButton(
                      onPressed: controller.markAllRead.isFalse
                          ? () {
                              controller.markAllRead.value = true;
                              controller.readCount.value = 5;
                            }
                          : null,
                      child: Text(
                        "Mark all as read",
                        style: TextStyle(
                            color: controller.markAllRead.isFalse
                                ? UIC.s500
                                : UIC.gry100),
                      ),
                    )
                  ],
                ),
                SZBOX.h15,
                Visibility(
                  visible: controller.markAllRead.isFalse,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.unreadcount.value,
                    itemBuilder: (context, index) => Container(
                      padding: UIPADDING.all10,
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {
                          controller.unreadcount.value--;
                          controller.readCount.value++;
                        },
                        leading: FaIcon(
                          FontAwesomeIcons.ticket,
                          color: UIC.p600,
                          size: 18,
                        ),
                        title: const Text("Product promo"),
                        subtitle: Text(
                          "today only,We're offering Thousand product at a 50% discount for you.",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14, color: UIC.gry300),
                        ),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        SZBOX.h10,
                  ),
                  replacement: Center(
                    child: Text(
                      "Not available new notification",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 14, color: UIC.gry300),
                    ),
                  ),
                ),
                SZBOX.h15,
                Text("Older notification",
                    style: Theme.of(context).textTheme.headline6!.copyWith()),
                SZBOX.h15,
                Obx(
                  () => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.readCount.value,
                    itemBuilder: (context, index) => Container(
                      padding: UIPADDING.all10,
                      color: Colors.white,
                      child: ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.ticket,
                          color: UIC.gry400,
                          size: 18,
                        ),
                        title: Text(
                          "Product promo",
                          style: TextStyle(color: UIC.gry400),
                        ),
                        subtitle: Text(
                          "today only,We're offering Thousand product at a 50% discount for you.",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14, color: UIC.gry300),
                        ),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        SZBOX.h10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
