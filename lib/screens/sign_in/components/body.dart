import 'package:flutter/material.dart';
import 'package:nolimit/components/no_account_text.dart';
import 'package:nolimit/components/social_card.dart';
import 'package:nolimit/constants.dart';
import 'package:nolimit/size_config.dart';
import '../sign_in_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                'Welcome Back',
                style: headingStyle,
              ),
              Text(
                'Sign in with your email and password\nor continue with a social media account',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              SignInForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: 'assets/icons/google-icon.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/facebook-2.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/twitter.svg',
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              NoAccountText()
            ],
          ),
        ),
      )
    );
  }
}
