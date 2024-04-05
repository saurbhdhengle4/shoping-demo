import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/api_services/repository.dart';
import 'package:shopping_demo/api_services/services.dart';

class IntroSliderController extends GetxController {
  PageController pageController = PageController();
  RxBool onLastPage = false.obs;
  Repository repository = Repository(Services());
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {

  //   super.onClose();
  // }
}
