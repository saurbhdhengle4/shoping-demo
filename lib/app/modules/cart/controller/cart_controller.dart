import 'package:get/get.dart';
import 'package:shopping_demo/api_services/model/productsmodel.dart';

class CartController extends GetxController {
  RxList<bool> isChecked = <bool>[].obs;
  RxList<int> quantityList = <int>[].obs;
  RxList<double> priceList = <double>[].obs;
  RxInt index = 0.obs;
  RxBool checkbox = false.obs;
  RxInt quantity = 1.obs;
  RxDouble price = 0.0.obs;
  RxList<ProductsModeal> cartlist = <ProductsModeal>[].obs;

  RxDouble totalCount = 0.0.obs;
}
