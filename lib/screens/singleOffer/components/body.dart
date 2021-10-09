import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nolimit/components/rounded_icon_btn.dart';
import 'package:nolimit/constants.dart';
import 'package:nolimit/models/Offer.dart';
import 'package:nolimit/size_config.dart';

class Body extends StatelessWidget {
  final Offer offer;

  Body({required this.offer});
  @override
  Widget build(BuildContext context) {
    return OfferImages(offer: offer);
  }
}

class OfferImages extends StatelessWidget {
  const OfferImages({
    Key? key,
    required this.offer,
  }) : super(key: key);

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(250),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              offer.images[0],
              height: 200,
              width: 300,
            ),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ...List.generate(offer.images.length,
        //             (index) => OfferSmallPreview(image: offer.images[index]))
        //   ],
        // )
      ],
    );
  }
}

// class OfferSmallPreview extends StatelessWidget {
//   const OfferSmallPreview({
//     Key? key,
//     required this.image,
//   }) : super(key: key);
//
//   final String image;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
//       padding: EdgeInsets.all(getProportionateScreenWidth(5)),
//       height: getProportionateScreenWidth(60),
//       width: getProportionateScreenWidth(60),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: kPrimaryColor)),
//       child: Image.network(image),
//     );
//   }
// }
