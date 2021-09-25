import 'package:flutter/material.dart';
import 'package:nolimit/components/bottom_nav_bar.dart';
import 'package:nolimit/components/rounded_icon_btn.dart';
import 'package:nolimit/components/topbar.dart';
import 'package:nolimit/models/Product.dart';
import 'package:nolimit/screens/singleProduct/components/body.dart';

import '../../enums.dart';
import 'components/CustomAppBar.dart';

class SingleProductScreen extends StatelessWidget {
  static String routeName = "/products/single";

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF1),
      body: Body(
        product: arguments.product,
      ),
      appBar: CustomAppBar(),
    );
  }
}

class ProductDetailsArguments {
  final Product product;
  ProductDetailsArguments({required this.product});
}
