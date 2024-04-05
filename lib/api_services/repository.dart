import 'package:shopping_demo/api_services/model/productsmodel.dart';
import 'package:shopping_demo/api_services/model/store_model.dart';
import 'package:shopping_demo/api_services/services.dart';

class Repository {
  Services services = Services();
  Repository(this.services);

  //* GET API CALL
  Future<List<ProductsModeal>> getProducts() => services.getProducts();
  Future<List<StoreModel>> getStore() => services.getStore();
  Future<List<ProductsModeal>> getWishlist() => services.getWishlist();

  //* POST API CALL

  //* Mulipart

}
