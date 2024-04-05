import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIC {
  static Color backgroundColor = const Color(0xFFF9FAFC);
  static Color imgForground = const Color(0xFFDEE8F7);
  static Color imgBackground = const Color(0xFFECF3FD);
  static Color icongry = const Color(0xFF6477A1);
  static Color iconblu = const Color(0xFF30B3F8);
  static Color gry050 = const Color(0xFFECF3FD);
  static Color gry100 = const Color(0xFFDEE8F7);
  static Color gry200 = const Color(0xFFBFD0EF);
  static Color gry300 = const Color(0xFF91A6D0);
  static Color gry400 = const Color(0xFF6477A1);
  static Color gry500 = const Color(0xFF313F63);
  static Color gry600 = const Color(0xFF233055);
  static Color gry700 = const Color(0xFF1F2D54);
  static Color gry800 = const Color(0xFF182347);
  static Color gry900 = const Color(0xFF0F1739);

//& primary color

  static Color p = const Color(0xFF30B3F8);
  static Color p050 = const Color(0xFFECF9FE);
  static Color p100 = const Color(0xFFACF1FE);
  static Color p200 = const Color(0xFF72FFFF);
  static Color p300 = const Color(0xFF00D7FF);
  static Color p400 = const Color(0xFF0096FF);
  static Color p500 = const Color(0xFF30B3F8);
  static Color p600 = const Color(0xFF238CD5);
  static Color p700 = const Color(0xFF1869B2);
  static Color p800 = const Color(0xFF0F4BBF);
  static Color p900 = const Color(0xFF093577);

//& secondary color
  static Color s050 = const Color(0xFFFFF9ED);
  static Color s100 = const Color(0xFFFEF0D3);
  static Color s200 = const Color(0xFFFEDDA8);
  static Color s300 = const Color(0xFFFEC47D);
  static Color s400 = const Color(0xFFFEAD5D);
  static Color s500 = const Color(0xFFFE8628);
  static Color s600 = const Color(0xFFE16F0c);
  static Color s700 = const Color(0xFFE0680A);
  static Color s800 = const Color(0xFFCC5400);
  static Color s900 = const Color(0xFFB84C00);

//* random color selecter
  static final Color randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
}

class UITEXTSTYLE {
  //* textStyle
  static const appbarS1 = TextStyle(color: Colors.black);
  static textThem(BuildContext context) {
    Theme.of(context).textTheme.bodyText2;
  }
}

class UIPADDING {
  static const all20 = EdgeInsets.all(20);
  static const all15 = EdgeInsets.all(15);
  static const all10 = EdgeInsets.all(10);
  static const all08 = EdgeInsets.all(08);
  static const all05 = EdgeInsets.all(05);
  static const all02 = EdgeInsets.all(02);

  //* padding horizontal
  static const h30 = EdgeInsets.symmetric(horizontal: 30);
  static const h25 = EdgeInsets.symmetric(horizontal: 25);
  static const h20 = EdgeInsets.symmetric(horizontal: 20);
  static const h15 = EdgeInsets.symmetric(horizontal: 15);
  static const h10 = EdgeInsets.symmetric(horizontal: 10);
  static const h05 = EdgeInsets.symmetric(horizontal: 05);

  //* padding vertical
  static const v30 = EdgeInsets.symmetric(vertical: 30);
  static const v25 = EdgeInsets.symmetric(vertical: 25);
  static const v20 = EdgeInsets.symmetric(vertical: 20);
  static const v15 = EdgeInsets.symmetric(vertical: 15);
  static const v10 = EdgeInsets.symmetric(vertical: 10);
  static const v05 = EdgeInsets.symmetric(vertical: 05);
}

class Div {
  //* Divider
  static Divider th0_5 = Divider(color: UIC.gry200, thickness: 0.5);
  static Divider th0_7 = Divider(color: UIC.gry200, thickness: 0.7);
  static Divider th1 = Divider(color: UIC.gry200, thickness: 1);
  static Divider th1_2 = Divider(color: UIC.gry200, thickness: 1.2);
  static Divider th1_5 = Divider(color: UIC.gry200, thickness: 1.5);
  static Divider th2 = Divider(color: UIC.gry200, thickness: 2);
  static Divider th2_5 = Divider(color: UIC.gry200, thickness: 2.5);
}

class SZBOX {
  //* MediaQuery hight/ width
  static getHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  //* Responsive space hight
  static hm5(BuildContext context) => SizedBox(height: getHeight(context) / 20);
  static hm2(BuildContext context) => SizedBox(height: getHeight(context) / 25);
  static hm10(BuildContext context) =>
      SizedBox(height: getHeight(context) / 15);
  static hm15(BuildContext context) =>
      SizedBox(height: getHeight(context) / 10);
  static hm20(BuildContext context) => SizedBox(height: getHeight(context) / 5);

  //* static space hight
  static const h3 = SizedBox(height: 3);
  static const h5 = SizedBox(height: 5);
  static const h10 = SizedBox(height: 10);
  static const h15 = SizedBox(height: 15);
  static const h20 = SizedBox(height: 20);
  static const h25 = SizedBox(height: 25);
  static const h30 = SizedBox(height: 30);
  static const h35 = SizedBox(height: 35);
  static const h40 = SizedBox(height: 40);
  static const h45 = SizedBox(height: 45);
  static const h50 = SizedBox(height: 50);

  //* Responsive space width
  static wm05(BuildContext context) => SizedBox(width: getWidth(context) / 20);
  static wm10(BuildContext context) => SizedBox(width: getWidth(context) / 15);
  static wm15(BuildContext context) => SizedBox(width: getWidth(context) / 10);
  static wm20(BuildContext context) => SizedBox(width: getWidth(context) / 05);

  //* static space width
  static const w05 = SizedBox(width: 05);
  static const w10 = SizedBox(width: 10);
  static const w15 = SizedBox(width: 15);
  static const w20 = SizedBox(width: 20);
  static const w25 = SizedBox(width: 25);
  static const w30 = SizedBox(width: 30);
  static const w35 = SizedBox(width: 35);
  static const w40 = SizedBox(width: 40);
  static const w45 = SizedBox(width: 45);
  static const w50 = SizedBox(width: 50);
}

class BorderR {
  static const bRedius40 = BorderRadius.only(
      bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0));

  static BorderRadius br05 = BorderRadius.circular(05);
  static BorderRadius br10 = BorderRadius.circular(10);
  static BorderRadius br15 = BorderRadius.circular(15);
  static BorderRadius br20 = BorderRadius.circular(20);
  static BorderRadius br25 = BorderRadius.circular(25);
  static BorderRadius br30 = BorderRadius.circular(30);
  static BorderRadius br35 = BorderRadius.circular(35);
  static BorderRadius br40 = BorderRadius.circular(40);
  static BorderRadius br(double sz) => BorderRadius.circular(sz);
  static BorderRadius brOnly(double tl, double tr, double bl, double br) =>
      BorderRadius.only(
          topLeft: Radius.circular(tl),
          topRight: Radius.circular(tr),
          bottomLeft: Radius.circular(bl),
          bottomRight: Radius.circular(br));
  static RoundedRectangleBorder floatingShap =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
}

class SPACE {
  static Spacer sp = const Spacer();
  static Spacer sp1 = const Spacer(flex: 1);
  static Spacer sp2 = const Spacer(flex: 2);
  static Spacer sp3 = const Spacer(flex: 3);
  static Spacer sp4 = const Spacer(flex: 4);
}

class INDECORATION {
  static decoration(String lable) => InputDecoration(
        labelText: lable,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: UIC.icongry, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: UIC.iconblu, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffEF4444), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: UIC.icongry, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      );
}

//^ KeybordType
const kTtext = TextInputType.text;
const ktemail = TextInputType.emailAddress;
const kTnumber = TextInputType.number;
const ktphone = TextInputType.phone;
const ktaddress = TextInputType.streetAddress;
const kturl = TextInputType.url;
const ktmultiline = TextInputType.multiline;
const ktdatetime = TextInputType.datetime;

//^ TextInputAction
const kAnext = TextInputAction.next;
const kAcontinue = TextInputAction.continueAction;
const kAdonet = TextInputAction.done;

//& BoxDecoration
class BOXDEC {
  static custom() => BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(10));
}

tost(String msg) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0);
