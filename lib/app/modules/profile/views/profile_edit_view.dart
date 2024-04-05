import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/profile/controller/profile_controller.dart';
import 'package:shopping_demo/utility/constants.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
          backgroundColor: UIC.backgroundColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text("Edit")),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          padding: UIPADDING.h20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Div.th1,
              SZBOX.h20,
              Container(
                color: Colors.white,
                child: TextfieldCustom(
                    hinttext: 'Enter Your Full Name',
                    onChanged: (val) {
                      controller.name.value = val;
                    },
                    name: 'Name',
                    icon: Icons.person),
              ),
              SZBOX.h10,
              Container(
                color: Colors.white,
                child: TextfieldCustom(
                    hinttext: '+ 91 **********',
                    onChanged: (val) {
                      controller.name.value = val;
                    },
                    name: 'Mobile Number',
                    icon: Icons.mobile_friendly),
              ),
              SZBOX.h10,
              Container(
                color: Colors.white,
                child: TextfieldCustom(
                    hinttext: 'eg- ****@gmail.com',
                    onChanged: (val) {
                      controller.name.value = val;
                    },
                    name: 'Email',
                    icon: Icons.email),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        backgroundColor: const Color(0xFF91A6D0),
        onPressed: () {
          FocusScope.of(context);
          Get.back();
        },
        label: SizedBox(
          width: SZBOX.getWidth(context) / 1.5,
          child: const Center(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class TextfieldCustom extends StatelessWidget {
  const TextfieldCustom(
      {Key? key,
      required this.hinttext,
      required this.onChanged,
      required this.name,
      required this.icon})
      : super(key: key);
  final String hinttext;
  final String name;
  final Function(String) onChanged;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(name, style: Theme.of(context).textTheme.button),
          ),
          const SizedBox(height: 8),
          Container(
            height: 50,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
            child: TextField(
              onChanged: onChanged,
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(icon),
                filled: true,
                fillColor: accentColor,
                hintText: hinttext,
                hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: UIC.icongry, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: UIC.iconblu, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: errorColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: UIC.icongry, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
