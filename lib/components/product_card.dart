import 'package:flutter/material.dart';
import 'package:nolimit/models/Product.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 130,
    this.aspectRatio = 1 / 1.3,
    required this.product,
    required this.press,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(5),
                      getProportionateScreenWidth(2),
                      getProportionateScreenWidth(2),
                      0),
                  decoration: BoxDecoration(
                      color: kProductBgColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.network(
                    product.images[0],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w500),
                    maxLines: 2,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rs " + product.price.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
