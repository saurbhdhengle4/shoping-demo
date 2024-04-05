import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/api_services/model/productsmodel.dart';
import 'package:shopping_demo/api_services/repository.dart';
import 'package:shopping_demo/api_services/services.dart';
import 'package:shopping_demo/app/modules/descover/views/discover.dart';

class Discovercontroller extends GetxController {
  Repository repository = Repository(Services());
  RxList<ProductsModeal> gategoryList = <ProductsModeal>[].obs;
  RxBool loading = false.obs;

  RxList<TileSheets> catagoryList = [
    const TileSheets(icon: FontAwesomeIcons.box, name: 'See all'),
    const TileSheets(icon: FontAwesomeIcons.couch, name: 'Furniture'),
    const TileSheets(icon: FontAwesomeIcons.bolt, name: 'Electricity'),
    const TileSheets(icon: FontAwesomeIcons.ticket, name: 'Promo'),
    const TileSheets(icon: FontAwesomeIcons.car, name: 'Automotive'),
    const TileSheets(icon: FontAwesomeIcons.wallet, name: 'My Wallet'),
    const TileSheets(icon: FontAwesomeIcons.mobile, name: 'Gadget'),
    const TileSheets(icon: FontAwesomeIcons.mountain, name: 'Travel'),
  ].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    loading.value = true;
    gategoryList.value = await repository.getProducts();
    loading.value = false;
  }
}
