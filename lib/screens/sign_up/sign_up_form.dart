import 'package:flutter/material.dart';

import 'package:nolimit/constants.dart';
import 'package:nolimit/components/custom_suffix_icon.dart';
import 'package:nolimit/components/default_button.dart';
import 'package:nolimit/components/form_error.dart';
import 'package:nolimit/screens/complete_profile/complete_profile_screen.dart';
import 'package:nolimit/size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirmPassword = '';
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
      child: Column(
        children: [
          buildEmailFormField(),
          FormError(error: errors.contains(kEmailNullError) ? kEmailNullError : ''),
          FormError(error: errors.contains(kInvalidEmailError) ? kInvalidEmailError : ''),
          SizedBox(height: getProportionateScreenHeight(32)),
          buildPasswordFormField(),
          FormError(error: errors.contains(kPassNullError) ? kPassNullError : ''),
          FormError(error: errors.contains(kShortPassError) ? kShortPassError : ''),
          SizedBox(height: getProportionateScreenHeight(32)),
          buildConfirmPasswordFormField(),
          FormError(error: errors.contains(kMatchPassError) ? kMatchPassError : ''),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompleteProfileScreen(email: email, password: password)
                  )
                );
              }
            }
          )
        ],
      )
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue ?? '',
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg')
      )
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue ?? '',
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 8 || value.length == 0) {
          removeError(error: kShortPassError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,  
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg',)
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue ?? '',
      onChanged: (value) {
        if (value == password || password.length == 0) {
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value != password && password.length != 0) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Re-enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,  
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg',)
      ),
    );
  }
}