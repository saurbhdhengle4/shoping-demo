import 'package:flutter/services.dart';
import 'package:shopping_demo/api_services/app_apis.dart';
import 'package:shopping_demo/api_services/model/productsmodel.dart';
import 'package:shopping_demo/api_services/model/store_model.dart';
import 'package:shopping_demo/api_services/response_model.dart';

class Services {
  AppAPI appAPI = AppAPI();
  ResponseModel res = ResponseModel();
  //* GET API CALL
  Future<List<ProductsModeal>> getProducts() async {
    List<ProductsModeal> catagoryOneList = [];
    var res = await rootBundle.loadString('assets/json/shoppinglist.json');
    catagoryOneList = productsModealFromJson(res);
    return catagoryOneList;
  }

  Future<List<StoreModel>> getStore() async {
    List<StoreModel> storeList = [];
    var res = await rootBundle.loadString('assets/json/banner.json');
    storeList = storeModelFromJson(res);
    return storeList;
  }

  Future<List<ProductsModeal>> getWishlist() async {
    List<ProductsModeal> catagoryOneList = [];
    var res = await rootBundle.loadString('assets/json/wishlist.json');
    catagoryOneList = productsModealFromJson(res);
    return catagoryOneList;
  }
}
