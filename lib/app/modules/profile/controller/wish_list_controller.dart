import 'package:get/get.dart';
import 'package:shopping_demo/api_services/model/productsmodel.dart';
import 'package:shopping_demo/api_services/repository.dart';
import 'package:shopping_demo/api_services/services.dart';

class WishListController extends GetxController {
  Repository repository = Repository(Services());
  RxBool loading = false.obs;
  RxList<ProductsModeal> wishList = <ProductsModeal>[].obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    loading.value = true;
    wishList.value = await repository.getWishlist();
    loading.value = false;
  }
}
