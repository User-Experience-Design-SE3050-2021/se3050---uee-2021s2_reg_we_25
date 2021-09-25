import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nolimit/components/rounded_icon_btn.dart';
import 'package:nolimit/constants.dart';
import 'package:nolimit/models/Product.dart';
import 'package:nolimit/size_config.dart';

class Body extends StatelessWidget {
  final Product product;

  Body({required this.product});
  @override
  Widget build(BuildContext context) {
    return ProductImages(product: product);
  }
}

class ProductImages extends StatelessWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(250),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              product.images[0],
              height: 200,
              width: 300,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(product.images.length,
                (index) => ProductSmallPreview(image: product.images[index]))
          ],
        )
      ],
    );
  }
}

class ProductSmallPreview extends StatelessWidget {
  const ProductSmallPreview({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      height: getProportionateScreenWidth(60),
      width: getProportionateScreenWidth(60),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kPrimaryColor)),
      child: Image.network(image),
    );
  }
}
