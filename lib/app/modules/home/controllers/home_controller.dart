import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt tabIndex = 0.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}
}
