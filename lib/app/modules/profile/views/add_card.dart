// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/profile/controller/saved_card_controller.dart';
import 'package:shopping_demo/utility/constants.dart';

class AddCard extends StatelessWidget {
  AddCard({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SavedCardController());
    return Scaffold(
      backgroundColor: UIC.backgroundColor,
      appBar: AppBar(
          backgroundColor: UIC.backgroundColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text("New Card")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: UIPADDING.h20,
        child: FormBuilder(
          key: _formKey,
          onChanged: () {
            _formKey.currentState!.save();
            debugPrint(_formKey.currentState!.value.toString());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Div.th1,
              SZBOX.h10,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BOXDEC.custom(),
                child: Column(
                  children: [
                    SZBOX.h10,
                    FormBuilderTextField(
                      name: 'cardno',
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CardNumberFormatter(),
                      ],
                      decoration: INDECORATION.decoration('Card Number*'),
                      onChanged: (val) {},
                      // validator: FormBuilderValidators.compose([
                      //   FormBuilderValidators.required(context),
                      // ]),
                      keyboardType: kTnumber,
                      textInputAction: kAnext,
                      maxLength: 19,
                    ),
                    SZBOX.h10,
                    FormBuilderTextField(
                      name: 'Name',
                      decoration: INDECORATION.decoration('Card Name*'),
                      onChanged: (val) {},
                      // validator: FormBuilderValidators.compose([
                      //   FormBuilderValidators.required(context),
                      // ]),
                      keyboardType: kTtext,
                      textInputAction: kAnext,
                    ),
                    SZBOX.h15,
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: FormBuilderTextField(
                              name: 'expmm',
                              decoration:
                                  INDECORATION.decoration('Expiry Month'),
                              onChanged: (val) {},
                              keyboardType: kTtext,
                              textInputAction: kAnext,
                            )),
                        const Spacer(flex: 1),
                        Expanded(
                            flex: 3,
                            child: FormBuilderTextField(
                              name: 'expyyyy',
                              decoration: INDECORATION.decoration('Expri Year'),
                              onChanged: (val) {},
                              keyboardType: kTtext,
                              textInputAction: kAnext,
                            ))
                      ],
                    ),
                    SZBOX.h30,
                    Text(
                        "expiry Month and Year not required if not mentioned on your card",
                        style: Theme.of(context).textTheme.caption,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    SZBOX.h10,
                  ],
                ),
              )
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
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            debugPrint(_formKey.currentState?.value.toString());
            controller.cardlist.add(CardModel(
                balance: '\$2,850.00',
                cardNumber: '****  ****  **** ${_formKey.currentState!.value['cardno']
                        .toString()
                        .split(" ")[3]}',
                image: 'assets/icon/payment.png',
                name: _formKey.currentState!.value['Name'],
                expiryMonth: _formKey.currentState!.value['expmm'] ?? "",
                expiryYear: _formKey.currentState!.value['expyyyy'] ?? ""));
            Get.back();
          } else {
            debugPrint(_formKey.currentState?.value.toString());
            debugPrint('validation failed');
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
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
