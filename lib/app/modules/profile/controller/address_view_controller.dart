import 'package:get/get.dart';

class AddressController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  RxString name = "".obs;
  RxString mobileno = "".obs;
  RxString pincode = "".obs;
  RxString state = "".obs;
  RxString address = ''.obs;
  RxString town = ''.obs;
  RxString city = ''.obs;
  RxString type = ''.obs;

  RxString addresstype = "".obs;
  RxList<AddressModel> addressList = [
    AddressModel(
        address: '6th Floor, Smartworks, Pan Card Club Rd, Baner',
        city: 'Pune',
        mobileno: '9999999999',
        name: 'James Alexander',
        pincode: '413512',
        state: 'Maharastra',
        town: 'Nahere',
        type: "Office"),
    AddressModel(
        address: ' 3rd Floor, Survey no 3,, Balewadi Rd',
        city: 'Mumbai ',
        mobileno: '9898989989',
        name: 'James Alexander',
        pincode: '134643',
        state: 'Maharastra',
        town: 'Nahere',
        type: "Home"),
  ].obs;
}

class AddressModel {
  AddressModel({
    required this.name,
    required this.mobileno,
    required this.pincode,
    required this.state,
    required this.address,
    required this.town,
    required this.city,
    required this.type,
  });

  String name;
  String mobileno;
  String pincode;
  String state;
  String address;
  String town;
  String city;
  String type;
}
