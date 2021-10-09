import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.asset("assets/images/hero.png"),
          ),
          SizedBox(
            height: 15,
          ),
          HotIconsRow(),
          SizedBox(
            height: 5,
          ),
          // TopCollections(),
          // SizedBox(
          //   height: 5,
          // ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Brands",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Text(
                      "See More",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: SizedBox(
                        width: getProportionateScreenWidth(100),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              getProportionateScreenWidth(5),
                              getProportionateScreenWidth(2),
                              getProportionateScreenWidth(2),
                              0),
                          child: Image.asset(
                            "assets/images/deedat.png",
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TopCollections extends StatelessWidget {
  const TopCollections({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Collections",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18),
              ),
              Text(
                "See More",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleCollection(
                  name: "Women",
                  image: "",
                ),
                SingleCollection(
                  name: "Men",
                  image: "",
                ),
                SingleCollection(
                  name: "Kids",
                  image: "",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SingleCollection extends StatelessWidget {
  const SingleCollection({Key? key, required this.name, required this.image})
      : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: getProportionateScreenWidth(95),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(5),
                    getProportionateScreenWidth(2),
                    getProportionateScreenWidth(2),
                    0),
                decoration: BoxDecoration(
                    color: kProductBgColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15)),
                // child: Image.network(
                //   product.images[0],
                // ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

class ProductGroup extends StatelessWidget {
  const ProductGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Trending Products",
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),
        ),
        Text(
          "See More",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ],
    );
  }
}

class HotIconsRow extends StatelessWidget {
  const HotIconsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HotIcon(
            name: "Offers",
            icon: "assets/icons/discount.svg",
            color1: 0xFF1488CC,
            color2: 0xFF2B32B2,
            padding: 12,
          ),
          HotIcon(
            name: "Categories",
            icon: "assets/icons/categories.svg",
            color1: 0xFF02AAB0,
            color2: 0xFF00CDAC,
            padding: 14,
          ),
          HotIcon(
            name: "Brands",
            icon: "assets/icons/brands.svg",
            color1: 0xFF11ADD4,
            color2: 0xFF92EAFF,
            padding: 10,
          ),
          HotIcon(
            name: "Vouchers",
            icon: "assets/icons/vouchers.svg",
            color1: 0xFF46B3DB,
            color2: 0xFF22BCAF,
            padding: 10,
          ),
          HotIcon(
            name: "Clothes",
            icon: "assets/icons/clothers.svg",
            color1: 0xFF4CB7FC,
            color2: 0xFF1046D1,
            padding: 12,
          )
        ],
      ),
    );
  }
}

class HotIcon extends StatelessWidget {
  const HotIcon(
      {Key? key,
      required this.name,
      required this.icon,
      required this.color1,
      required this.color2,
      required this.padding})
      : super(key: key);
  final String name;
  final String icon;
  final int color1;
  final int color2;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(padding),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(color1), Color(color2)],
            ),
          ),
          child: SvgPicture.asset(icon),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
