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
  int qty = 1;
  static String selectedSize = "";
  static String selectedColor = "";
  static int selectedColorCode = 0;

  void increaseQty() {
    qty = qty + 1;
  }

  void decreaseQty() {
    qty = qty - 1;
  }

  Body({required this.product});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
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
                      padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(20)),
                      child: Column(
                        children: [
                          Container(
                            width: SizeConfig.screenWidth - 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: SizeContainerList(
                                        sizes: product.sizes)),
                                Container(
                                  child: Qty(
                                      qty: qty,
                                      increaseQty: increaseQty,
                                      decreaseQty: decreaseQty),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  child: ColorContainerList(colors: product.colors),
                ),
                Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  child: SecondaryButton(
                    text: "Add To Cart",
                    press: () {
                      Cart.addToCart(
                          product: product,
                          qty: qty,
                          size: selectedSize,
                          color: selectedColor,
                          colorCode: selectedColorCode);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            "Product added to Cart Successfully",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 16),
                          )));
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
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
        SizedBox(
          height: 2,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.qty = widget.qty - 1;
                  widget.decreaseQty();
                });
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kGreyBorder)),
                child: Icon(
                  Icons.remove,
                  color: Colors.black,
                  size: 16.0,
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
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.qty = widget.qty + 1;
                  widget.increaseQty();
                });
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kGreyBorder)),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 16.0,
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
  final List<dynamic> sizes;

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
          Body.selectedSize = size;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, right: 10),
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
        decoration: BoxDecoration(
            color: selectedSize == size ? kPrimaryColor : Colors.white,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
                color: selectedSize == size ? kPrimaryColor : kBorderColor)),
        child: Text(
          size,
          style: TextStyle(
              color: selectedSize == size ? Colors.white : kTextColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class ColorContainerList extends StatefulWidget {
  const ColorContainerList({Key? key, required this.colors}) : super(key: key);
  final List colors;
  @override
  State<ColorContainerList> createState() => _ColorContainerListState();
}

class _ColorContainerListState extends State<ColorContainerList> {
  int selectedColor = 0xFF000000;

  @override
  Widget build(BuildContext context) {
    print("In Color Container List");
    print(widget.colors);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Color",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
          Row(
            children: [
              ...List.generate(widget.colors.length,
                  (index) => buildSingleColor(widget.colors[index])),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector buildSingleColor(var color) {
    print("In build Single Color");
    print(color);
    print(color["code"]);

    return GestureDetector(
      onTap: () {
        setState(() {
          Body.selectedColor = color["color"];
          Body.selectedColorCode = int.parse(color["code"]);
          print(Body.selectedColor);
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, right: 10),
        width: Body.selectedColor == color["color"] ? 40 : 30,
        height: Body.selectedColor == color["color"] ? 40 : 30,
        decoration: BoxDecoration(
            color: Color(int.parse(color["code"])),
            shape: BoxShape.circle,
            border: Body.selectedColor == color["color"]
                ? Border.all(color: Colors.grey, width: 2)
                : Border.all(color: Colors.transparent)),
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
      constraints: BoxConstraints(minHeight: 390),
      padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: child,
    );
  }
}
