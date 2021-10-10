import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nolimit/components/secondary_button.dart';
import 'package:nolimit/constants.dart';
import 'package:nolimit/models/Cart.dart';
import 'package:nolimit/models/Order.dart';
import 'package:nolimit/screens/checkout/checkout_screen.dart';
import 'package:nolimit/size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<OrderProduct> orderItems = [];

  Order order = Order.getOrder();
  double total = 0;
  int totalQty = 0;
  void setOrderItems() {
    orderItems = [];
    order.products.forEach((product) {
      orderItems.add(product);
      totalQty = totalQty + product.qty;
    });
    print(orderItems);
  }

  @override
  void initState() {
    print(order.products);
    total = order.total;

    setOrderItems();
  }

  @override
  Widget build(BuildContext context) {
    if (orderItems.length == 0) {
      return Center(child: Text("There are no items in the order"));
    } else {
      return Stack(
        children: [
          Column(
            children: [
              ...List.generate(
                  orderItems.length,
                  (index) => CardItemCard(
                        product: orderItems[index],
                      ))
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Column(
                              children: [
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Qty:",
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(16),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      totalQty.toString(),
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(16),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Sub Total:",
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(18),
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Rs.${total}",
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(18),
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SecondaryButton(
                        text: "Proceed to Checkout",
                        press: () {
                          Navigator.pushNamed(
                              context, CheckoutScreen.routeName);
                        },
                      )
                    ],
                  ),
                ),
              ))
        ],
      );
    }
  }
}

class CardItemCard extends StatefulWidget {
  CardItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final OrderProduct product;

  @override
  State<CardItemCard> createState() => _CardItemCardState();
}

class _CardItemCardState extends State<CardItemCard> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(88),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: kProductBgColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.network(widget.product.image),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 142,
                  child: Text(
                    widget.product.productName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black),
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Color :",
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3, left: 5),
                        child: Container(
                          height: getProportionateScreenWidth(15),
                          width: getProportionateScreenWidth(15),
                          decoration: BoxDecoration(
                              color: Color(widget.product.colorCode),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Size : ${widget.product.size}",
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs.${(widget.product.price).toDouble()}",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          "x${widget.product.qty}",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        )
      ]),
    );
  }
}
