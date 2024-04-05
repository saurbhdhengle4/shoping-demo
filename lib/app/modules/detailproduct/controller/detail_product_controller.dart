import 'package:get/get.dart';

class DetailProductController extends GetxController {
  RxBool fs = false.obs;
  RxBool ss = true.obs;
  RxBool ts = true.obs;
  RxBool wishList = false.obs;
  RxString selectedImg = "".obs;
  RxInt index = 0.obs;
  RxList discountList = ["60% Discount", "70% Discount", "75% Discount"].obs;
  RxInt discountListIndex = 0.obs;
  @override
  void onInit() {
    fs.value = false;
    ss.value = true;
    ts.value = true;
    super.onInit();
  }
}
