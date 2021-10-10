import 'package:flutter/cupertino.dart';
import 'package:nolimit/screens/my_account/components/my_account_form.dart';
import 'package:nolimit/size_config.dart';

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
              SizedBox(height: SizeConfig.screenHeight * 0.06),
              MyAccountForm()
            ],
          )
        ),
      )
    );
  }
}