import 'package:flutter/material.dart';
import 'package:nolimit/components/custom_suffix_icon.dart';
import 'package:nolimit/components/default_button.dart';
import 'package:nolimit/components/form_error.dart';

import '../../../constants.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  void addError({ String? error }) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({ String? error }) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          FormError(error: errors.contains(kNameNullError) ? kNameNullError : ''),
          SizedBox(height: 32),
          buildLastNameFormField(),
          FormError(error: errors.contains(kNameNullError) ? kNameNullError : ''),
          SizedBox(height: 32),
          buildPhoneNumberFormField(),
          FormError(error: errors.contains(kPhoneNumberNullError) ? kPhoneNumberNullError : ''),
          SizedBox(height: 32),
          buildAddressFormField(),
          FormError(error: errors.contains(kAddressNullError) ? kAddressNullError : ''),
          SizedBox(height: 40),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState!.validate()) {
                // Go to Registration Success Screen
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
          keyboardType: TextInputType.streetAddress,
          onSaved: (newValue) => address = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kAddressNullError);
            }
            return null;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kAddressNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Address',
            hintText: 'Enter your address',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Location point.svg')
          )
        );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
          keyboardType: TextInputType.phone,
          onSaved: (newValue) => phoneNumber = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPhoneNumberNullError);
            }
            return null;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kPhoneNumberNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Phone Number',
            hintText: 'Enter your phone number',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg')
          )
        );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
          keyboardType: TextInputType.name,
          onSaved: (newValue) => lastName = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kNameNullError);
            }
            return null;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kNameNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Last Name',
            hintText: 'Enter your last name',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg')
          )
        );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
          keyboardType: TextInputType.name,
          onSaved: (newValue) => firstName = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kNameNullError);
            }
            return null;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kNameNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'First Name',
            hintText: 'Enter your first name',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg')
          )
        );
  }
}