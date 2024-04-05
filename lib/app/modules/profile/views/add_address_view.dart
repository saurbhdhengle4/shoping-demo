import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/profile/controller/address_view_controller.dart';
import 'package:shopping_demo/utility/constants.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
          backgroundColor: UIC.backgroundColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text("New Address")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: UIPADDING.h20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Div.th1,
            SZBOX.h10,
            info1(controller),
            SZBOX.h20,
            info2(controller),
            SZBOX.h10,
            info3(controller, context),
            SZBOX.h10,
            info4(context),
            SZBOX.hm5(context)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        backgroundColor: const Color(0xFF91A6D0),
        onPressed: () {
          FocusScope.of(context);
          if (controller.name.value != '' ||
              controller.mobileno.value != '' ||
              controller.pincode.value != '' ||
              controller.state.value != '' ||
              controller.address.value != '' ||
              controller.city.value != '' ||
              controller.type.value != '' ||
              controller.town.value != '') {
            controller.addressList.add(AddressModel(
                name: controller.name.value,
                mobileno: controller.mobileno.value,
                pincode: controller.pincode.value,
                state: controller.state.value,
                address: controller.address.value,
                town: controller.town.value,
                city: controller.city.value,
                type: controller.type.value));
            Get.back();
          } else {
            Get.snackbar('Error', 'Fill All rqquired Field');
          }
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

  Container info4(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderR.br10),
      child: FormBuilderCheckbox(
          activeColor: UIC.iconblu,
          contentPadding: EdgeInsets.zero,
          name: 'accept_terms3',
          initialValue: false,
          onChanged: (val) {},
          title: Text("Make this as my default address",
              style: Theme.of(context).textTheme.caption)),
    );
  }

  Container info3(AddressController controller, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderR.br10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderRadioGroup<String>(
            activeColor: UIC.iconblu,
            decoration: const InputDecoration(
              labelText: 'Types of Address*',
            ),
            initialValue: null,
            name: 'best_language',
            onChanged: (val) {
              controller.addresstype.value = val!;
              controller.type.value = val;
            },
            options: ['Home', 'Office']
                .map((lang) => FormBuilderFieldOption(
                      value: lang,
                      child: Text(lang,
                          style: Theme.of(context).textTheme.caption),
                    ))
                .toList(growable: false),
          ),
          SZBOX.h10,
          Obx(
            () => Visibility(
                visible: controller.addresstype.value == 'Office',
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("is your offic on weekends?",
                        style: Theme.of(context).textTheme.caption),
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderCheckbox(
                              activeColor: UIC.iconblu,
                              contentPadding: EdgeInsets.zero,
                              name: 'accept_terms1',
                              initialValue: false,
                              onChanged: (val) {},
                              title: Text("Open on Saturday",
                                  style: Theme.of(context).textTheme.caption)),
                        ),
                        Expanded(
                          child: FormBuilderCheckbox(
                              activeColor: UIC.iconblu,
                              contentPadding: EdgeInsets.zero,
                              name: 'accept_terms2',
                              initialValue: false,
                              onChanged: (val) {},
                              title: Text("Open on Sunday",
                                  style: Theme.of(context).textTheme.caption)),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Container info2(AddressController controller) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderR.br10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextField(
                    onChanged: (val) {
                      controller.pincode.value = val;
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      // prefixIcon: Icon(icon),
                      filled: true,
                      fillColor: const Color(0xffffffff),
                      hintText: "Pincode*",
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: UIC.icongry, width: 1.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: UIC.iconblu, width: 1.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffEF4444), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: UIC.icongry, width: 1.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: TextField(
                    onChanged: (val) {
                      controller.state.value = val;
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffffffff),
                      hintText: "State*",
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: UIC.icongry, width: 1.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: UIC.iconblu, width: 1.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffEF4444), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: UIC.icongry, width: 1.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextfieldCustom2(
            hinttext: 'Address* ( House No, Building,street,Area )',
            icon: FontAwesomeIcons.addressBook,
            name: 'Address*',
            onChanged: (String val) {
              controller.address.value = val;
            },
          ),
          TextfieldCustom2(
            hinttext: 'Locality/Town*',
            icon: FontAwesomeIcons.map,
            name: 'LocalityTown*',
            onChanged: (String val) {
              controller.town.value = val;
            },
          ),
          TextfieldCustom2(
            hinttext: 'City/District*',
            icon: FontAwesomeIcons.city,
            name: 'City/District*',
            onChanged: (String val) {
              controller.city.value = val;
            },
          ),
        ],
      ),
    );
  }

  Container info1(AddressController controller) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderR.br10),
      child: Column(
        children: [
          TextfieldCustom2(
            hinttext: 'Name*',
            icon: FontAwesomeIcons.user,
            name: 'Name*',
            onChanged: (String val) {
              controller.name.value = val;
            },
          ),
          TextfieldCustom2(
            hinttext: 'Mobile*',
            icon: FontAwesomeIcons.phone,
            name: 'Mobile Number*',
            onChanged: (String val) {
              controller.mobileno.value = val;
            },
          ),
        ],
      ),
    );
  }
}

class TextfieldCustom2 extends StatelessWidget {
  const TextfieldCustom2(
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
          SizedBox(
            height: 50,
            child: TextField(
              onChanged: onChanged,
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(icon, size: 12),
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
