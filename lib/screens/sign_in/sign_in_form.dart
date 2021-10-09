import 'package:flutter/material.dart';

import 'package:nolimit/constants.dart';
import 'package:nolimit/components/custom_suffix_icon.dart';
import 'package:nolimit/components/default_button.dart';
import 'package:nolimit/components/form_error.dart';
import 'package:nolimit/screens/home/home_screen.dart';
import 'package:nolimit/screens/profile/profile_screen.dart';
import 'package:nolimit/size_config.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
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
          SizedBox(height: getProportionateScreenHeight(24)),
          FormError(error: errors.contains(kEmailOrPasswordError) ? kEmailOrPasswordError : ''),
          FormError(error: errors.contains(kSomethingWrongError) ? kSomethingWrongError : ''),
          SizedBox(height: getProportionateScreenHeight(24)),
          DefaultButton(
            text: "Sign In",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, ProfileScreen.routeName);
              }
            }
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, ProfileScreen.routeName),
              child: Text(
                'Skip',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18
                ),
              ),
            ),
          )
        ],
      )
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        removeError(error: kEmailOrPasswordError);
        removeError(error: kSomethingWrongError);
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
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 8 || value.length == 0) {
          removeError(error: kShortPassError);
        }
        removeError(error: kEmailOrPasswordError);
        removeError(error: kSomethingWrongError);
        password = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
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
}