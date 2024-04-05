import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/intro_slider/controllers/intro_slider_controller.dart';

class IntroBindingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroSliderController>(
      () => IntroSliderController(),
    );
  }
}
