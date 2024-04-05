import 'package:get/get.dart';

class SavedCardController extends GetxController {
  RxList<CardModel> cardlist = [
    CardModel(
        balance: '\$2,850.00',
        cardNumber: '****  ****  ****  3799',
        image: 'assets/icon/payment.png',
        name: 'James Alexander',
        expiryMonth: 'Jan)',
        expiryYear: '2022'),
    CardModel(
        balance: '\$3,050.00',
        cardNumber: '****  ****  ****  2070',
        image: 'assets/icon/paymentvisa.png',
        name: 'Alexander James',
        expiryMonth: 'Dec',
        expiryYear: '2027'),
  ].obs;
}

class CardModel {
  CardModel({
    required this.balance,
    required this.cardNumber,
    required this.image,
    required this.name,
    required this.expiryMonth,
    required this.expiryYear,
  });

  String balance;
  String cardNumber;
  String image;
  String name;
  String expiryMonth;
  String expiryYear;
}
