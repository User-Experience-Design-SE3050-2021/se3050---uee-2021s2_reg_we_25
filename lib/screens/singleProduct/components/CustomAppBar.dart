import 'package:flutter/material.dart';
import 'package:nolimit/components/rounded_icon_btn.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height + 10);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
              iconData: Icons.arrow_back_ios,
              press: () => Navigator.pop(context),
              color: Colors.black,
            ),
            RoundedIconBtn(
              iconData: Icons.favorite,
              press: () => Navigator.pop(context),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
