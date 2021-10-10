import 'package:flutter/material.dart';
import 'package:nolimit/components/custom_suffix_icon.dart';
import 'package:nolimit/components/form_error.dart';
import 'package:nolimit/components/secondary_button.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();

  static final formKey = GlobalKey<FormState>();

  static TextEditingController cnum = new TextEditingController();
  static TextEditingController name = new TextEditingController();
  static TextEditingController cvc = new TextEditingController();
  static TextEditingController expiry = new TextEditingController();
}

class _PaymentFormState extends State<PaymentForm> {
  final List<String> errors = [];

  void addError({String error = ''}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error = ''}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: PaymentForm.formKey,
        child: Column(children: [
          buildTextFormField(
              label: "Card Number",
              hint: "xxxx xxxx xxxx xxxx",
              error: "Please enter the card number",
              controller: PaymentForm.cnum,
              type: "number"),
          buildTextFormField(
              label: "Name on Card",
              hint: "John",
              error: "Please enter the name on the card",
              controller: PaymentForm.name,
              type: "text"),
          buildTextFormField(
              label: "CVC",
              hint: "xxx",
              error: "Please enter the cvc number",
              controller: PaymentForm.cvc,
              type: "number"),
          buildTextFormField(
              label: "Expiry Date",
              hint: "mm/yy",
              error: "Please enter the expiry date",
              controller: PaymentForm.expiry,
              type: "text"),
        ]));
  }

  Column buildTextFormField(
      {label: String,
      hint: String,
      error: String,
      controller: TextEditingController,
      type: String}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: getProportionateScreenWidth(16),
              color: Colors.black),
        ),
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        TextFormField(
            keyboardType:
                type == "number" ? TextInputType.number : TextInputType.text,
            controller: controller,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: error);
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: error);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: hint,
            )),
        FormError(error: errors.contains(error) ? error : ''),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }
}
