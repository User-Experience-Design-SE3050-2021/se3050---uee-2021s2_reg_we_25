import 'package:flutter/material.dart';
import 'package:nolimit/components/bottom_nav_bar.dart';
import 'package:nolimit/components/topbar.dart';
import 'package:nolimit/models/Offer.dart';
import 'package:nolimit/screens/singleOffer/components/body.dart';
import 'package:nolimit/screens/singleProduct/components/CustomAppBar.dart';

import '../../enums.dart';

class SingleOfferScreen extends StatelessWidget {
  static String routeName = "/offers/single";

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as OfferDetailsArguments;
    return Scaffold(
      backgroundColor: Color(int.parse(arguments.offer.bgColor)),
      appBar: Topbar(),
      body: Body(
        offer: arguments.offer,
      ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.products),
    );
  }
}

class OfferDetailsArguments {
  final Offer offer;
  OfferDetailsArguments({required this.offer});
}
