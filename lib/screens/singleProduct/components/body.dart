import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nolimit/components/rounded_icon_btn.dart';
import 'package:nolimit/components/secondary_button.dart';
import 'package:nolimit/constants.dart';
import 'package:nolimit/models/Cart.dart';
import 'package:nolimit/models/Product.dart';
import 'package:nolimit/screens/singleProduct/components/product_images.dart';
import 'package:nolimit/size_config.dart';

class Body extends StatelessWidget {
  final Product product;
  List<String> sizes = ["36", "37", "38"];
  int qty = 1;

  void increaseQty() {
    qty = qty + 1;
  }

  void decreaseQty() {
    qty = qty - 1;
  }

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizeContainerList(sizes: sizes),
                            Qty(
                                qty: qty,
                                increaseQty: increaseQty,
                                decreaseQty: decreaseQty)
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
                  press: () => {Cart.addToCart(product: product, qty: qty)},
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class Qty extends StatefulWidget {
  Qty(
      {Key? key,
      required this.qty,
      required this.increaseQty,
      required this.decreaseQty})
      : super(key: key);
  late int qty;

  Function increaseQty;
  Function decreaseQty;

  @override
  State<Qty> createState() => _QtyState();
}

class _QtyState extends State<Qty> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Qty",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(30),
              width: getProportionateScreenWidth(30),
              child: OutlinedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                ),
                onPressed: () {
                  setState(() {
                    widget.qty = widget.qty - 1;
                    widget.decreaseQty();
                  });
                },
                child: Icon(
                  Icons.remove,
                  color: kTextColor,
                  size: 10.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                widget.qty.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(30),
              width: getProportionateScreenWidth(30),
              child: OutlinedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                ),
                onPressed: () {
                  setState(() {
                    widget.qty = widget.qty + 1;
                    widget.increaseQty();
                  });
                },
                child: Icon(
                  Icons.add,
                  color: kTextColor,
                  size: 10.0,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class SizeContainerList extends StatefulWidget {
  const SizeContainerList({Key? key, required this.sizes}) : super(key: key);
  final List<String> sizes;

  @override
  State<SizeContainerList> createState() => _SizeContainerListState();
}

class _SizeContainerListState extends State<SizeContainerList> {
  String selectedSize = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        Row(
          children: [
            ...List.generate(widget.sizes.length,
                (index) => buildSingleSize(widget.sizes[index])),
          ],
        ),
      ],
    );
  }

  GestureDetector buildSingleSize(String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
          print(size);
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, right: 10),
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
                color: selectedSize == size ? kPrimaryColor : kBorderColor)),
        child: Text(
          size,
          style: TextStyle(
              color: selectedSize == size ? kPrimaryColor : kTextColor),
        ),
      ),
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
