import 'package:flutter/material.dart';
import 'package:nolimit/components/social_card.dart';
import 'package:nolimit/constants.dart';
import 'package:nolimit/size_config.dart';
import '../sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 32),
              Text(
                'Register Account',
                style: headingStyle,
              ),
              Text(
                'Fill in your details or continue with a social media account',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 64),
              SignUpForm(),
              SizedBox(height: 48),
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
              SizedBox(height: 20),
              Text(
                "By continuing you confirm that you agree \nwith our Terms and Conditions",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      )
    );
  }
}
