import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxBool markAllRead = false.obs;
  RxInt readCount = 2.obs;
  RxInt unreadcount = 0.obs;
  RxBool delete = false.obs;
  @override
  void onInit() {
    unreadcount.value = 3;
    markAllRead.value = false;
    delete.value = false;
    super.onInit();
  }
}
