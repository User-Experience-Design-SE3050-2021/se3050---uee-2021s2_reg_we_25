import 'package:flutter/material.dart';
import 'package:nolimit/models/Offer.dart';
import 'package:nolimit/screens/singleOffer/components/body.dart';
import 'package:nolimit/screens/singleProduct/components/CustomAppBar.dart';

class SingleOfferScreen extends StatelessWidget {
  static String routeName = "/offers/single";

  @override
  Widget build(BuildContext context) {
    final arguments =
    ModalRoute.of(context)!.settings.arguments as OfferDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF1),
      body: Body(
        offer: arguments.offer,
      ),
      appBar: CustomAppBar(),
    );
  }
}

class OfferDetailsArguments {
  final Offer offer;
  OfferDetailsArguments({required this.offer});
}
