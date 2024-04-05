// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/cart/views/cart_view.dart';
import 'package:shopping_demo/app/modules/checkout/views/checkout_view.dart';
import 'package:shopping_demo/app/modules/checkout/views/payment_done_view.dart';
import 'package:shopping_demo/app/modules/checkout/views/select_address.dart';
import 'package:shopping_demo/app/modules/checkout/views/select_card.dart';
import 'package:shopping_demo/app/modules/detailproduct/view/detail_view.dart';
import 'package:shopping_demo/app/modules/home/bindings/home_binding.dart';
import 'package:shopping_demo/app/modules/home/views/home_view.dart';
import 'package:shopping_demo/app/modules/intro_slider/views/intro_slider.dart';
import 'package:shopping_demo/app/modules/notification/bindings/notification_binding.dart';
import 'package:shopping_demo/app/modules/notification/view/notification.dart';
import 'package:shopping_demo/app/modules/profile/views/add_address_view.dart';
import 'package:shopping_demo/app/modules/profile/views/add_card.dart';
import 'package:shopping_demo/app/modules/profile/views/address.dart';
import 'package:shopping_demo/app/modules/profile/views/help_view.dart';
import 'package:shopping_demo/app/modules/profile/views/profile_edit_view.dart';
import 'package:shopping_demo/app/modules/profile/views/saved_card.dart';
import 'package:shopping_demo/app/modules/profile/views/settings.dart';
import 'package:shopping_demo/app/modules/profile/views/wishlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INTROSLIDER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONVIEW,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(name: _Paths.DETAILPRODUCTVIEW, page: () => const DetailProduct()),
    GetPage(name: _Paths.CART, page: () => const CartView()),
    GetPage(name: _Paths.ADDRESS, page: () => const Address()),
    GetPage(name: _Paths.HELPCENTER, page: () => const HelpView()),
    GetPage(name: _Paths.PROFILEEDIT, page: () => const EditProfile()),
    GetPage(name: _Paths.SAVEDCARD, page: () => const SavedCards()),
    GetPage(name: _Paths.SETTINGS, page: () => const SettingView()),
    GetPage(name: _Paths.WISHLIST, page: () => const WithListView()),
    GetPage(name: _Paths.ADDADDRESS, page: () => const AddAddress()),
    GetPage(name: _Paths.CHECKOUT, page: () => const PaymentsView()),
    GetPage(name: _Paths.DONE, page: () => const PaymentDoneView()),
    GetPage(name: _Paths.ADDNEWADDRESS, page: () => const AddAddress()),
    GetPage(name: _Paths.ADDNEWCARD, page: () => AddCard()),
    GetPage(name: _Paths.INTROSLIDER, page: () => const IntroSliderView()),
    GetPage(
        name: _Paths.CHOUTSELECTADDRESS,
        page: () => const ChekoutSelectAddress()),
    GetPage(
        name: _Paths.CHOUTSELECTcard, page: () => const CheckoutSelectCard()),
  ];
}
