import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nolimit/components/rounded_icon_btn.dart';
import 'package:nolimit/components/secondary_button.dart';
import 'package:nolimit/constants.dart';
import 'package:nolimit/models/Product.dart';
import 'package:nolimit/screens/singleProduct/components/product_images.dart';
import 'package:nolimit/size_config.dart';

class Body extends StatelessWidget {
  final Product product;

  Body({required this.product});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      "Rs." + product.price.toString(),
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  child: Text(product.description)),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: getProportionateScreenWidth(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Size",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            SizeContainer(size: 36),
                            SizeContainer(size: 37),
                            SizeContainer(size: 38)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                child: SecondaryButton(
                  text: "Add To Cart",
                  press: () => {},
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class SizeContainer extends StatelessWidget {
  const SizeContainer({Key? key, required this.size}) : super(key: key);
  final int size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, right: 10),
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: kBorderColor),
      ),
      child: Text(size.toString()),
    );
  }
}

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      width: double.infinity,
      height: 390,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: child,
    );
  }
}
