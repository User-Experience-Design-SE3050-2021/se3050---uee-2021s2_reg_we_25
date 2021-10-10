import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nolimit/models/Offer.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class OfferDescription extends StatelessWidget {
  const OfferDescription({
    Key? key,
    required this.offer,
  }) : super(key: key);

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            offer.title,
            style: Theme.of(context).textTheme.headline6, //offer name
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            offer.title,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
