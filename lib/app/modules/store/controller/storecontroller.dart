import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/api_services/model/store_model.dart';
import 'package:shopping_demo/api_services/repository.dart';
import 'package:shopping_demo/api_services/services.dart';
import 'package:shopping_demo/app/modules/descover/views/discover.dart';

class StoreViewControlller extends GetxController {
  Repository repository = Repository(Services());
  RxList<StoreModel> storeList = <StoreModel>[].obs;
  RxBool loading = false.obs;
  RxBool wishList = false.obs;
  RxList<TileSheets> catagoryList = [
    const TileSheets(icon: FontAwesomeIcons.couch, name: 'Furniture'),
    const TileSheets(icon: FontAwesomeIcons.car, name: 'Automotive'),
    const TileSheets(icon: FontAwesomeIcons.bolt, name: 'Electricity'),
    const TileSheets(icon: FontAwesomeIcons.mobile, name: 'Gadget'),
  ].obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    loading.value = true;
    storeList.value = await repository.getStore();
    loading.value = false;
  }
}
