import 'package:flutter/material.dart';
import 'package:nolimit/components/category_tab.dart';
import 'package:nolimit/components/product_card.dart';
import 'package:nolimit/models/Offer.dart';
import 'package:nolimit/provider/OfferProvider.dart';
import 'package:nolimit/provider/app_provider.dart';
import 'package:nolimit/screens/singleOffer/singleOffer_screen.dart';
import 'package:nolimit/screens/singleProduct/singleProduct_screen.dart';
import 'package:nolimit/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var offerProvider = Provider.of<OffersProvider>(context);

    return SafeArea(
      child: ListView(children: [
        Container(
          // margin: EdgeInsets.only(left: 130.0, right: 130.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20.0,
                width: double.infinity,
              ),
              Text(
                'OFFERS',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),
              ...List.generate(
                  offerProvider.allOffers.length,
                  (index) => SingleOffer(
                        image: offerProvider.allOffers[index].image,
                        offer: offerProvider.allOffers[index],
                      ))
            ],
          ),
        ),
      ]),
    );
  }
}

class SingleOffer extends StatelessWidget {
  const SingleOffer({Key? key, required this.image, required this.offer})
      : super(key: key);
  final String image;
  final Offer offer;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SingleOfferScreen.routeName,
            arguments: OfferDetailsArguments(offer: offer));
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Image.network(image),
      ),
    );
  }
}
