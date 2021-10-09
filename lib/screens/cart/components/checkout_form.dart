import 'package:flutter/material.dart';
import 'package:nolimit/components/custom_suffix_icon.dart';
import 'package:nolimit/components/form_error.dart';
import 'package:nolimit/components/secondary_button.dart';
import 'package:nolimit/models/Order.dart';
import 'package:nolimit/screens/delivery/delivery_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ShippingForm extends StatefulWidget {
  @override
  _ShippingFormState createState() => _ShippingFormState();
}

class _ShippingFormState extends State<ShippingForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController fname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController district = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController address = new TextEditingController();

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
        key: _formKey,
        child: Column(children: [
          buildTextFormField(
              label: "First Name",
              hint: "Enter your first name",
              error: "Please enter a first name",
              controller: fname,
              type: "text"),
          buildTextFormField(
              label: "Last Name",
              hint: "Enter your last name",
              error: "Please enter a last name",
              controller: lname,
              type: "text"),
          buildTextFormField(
              label: "Mobile Number",
              hint: "Enter your mobile number",
              error: "Please enter a mobile number",
              controller: mobile,
              type: "number"),
          buildTextFormField(
              label: "District",
              hint: "Enter your district",
              error: "Please enter a district",
              controller: district,
              type: "text"),
          buildTextFormField(
              label: "City",
              hint: "Enter your city",
              error: "Please enter a city",
              controller: city,
              type: "text"),
          buildTextFormField(
              label: "Address",
              hint: "Enter your address",
              error: "Please enter an address",
              controller: address,
              type: "text"),
          SecondaryButton(
            text: "Continue to Delivery",
            press: () {
              if (_formKey.currentState!.validate()) {
                Order order = Order.getOrder();
                order.fname = fname.text;
                order.lname = lname.text;
                order.address = address.text;
                order.mobile = mobile.text;
                order.city = city.text;
                order.district = district.text;
                Order.setOrder(order);

                Navigator.pushNamed(context, DeliveryScreen.routeName);
              }
            },
          )
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
