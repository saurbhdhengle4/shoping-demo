import 'package:get/get.dart';

class CheckoutController extends GetxController {
  RxBool addressSelect = false.obs;
  RxList<bool> isChecked = <bool>[].obs;
  RxBool cardSelect = false.obs;
  RxList<bool> cardselect = <bool>[].obs;
}
