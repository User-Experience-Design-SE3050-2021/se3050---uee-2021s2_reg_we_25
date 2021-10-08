import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nolimit/components/secondary_button.dart';
import 'package:nolimit/constants.dart';
import 'package:nolimit/models/Cart.dart';
import 'package:nolimit/size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Cart> selectedItems = [];
  void addSelectedItem(Cart c) {
    setState(() {
      selectedItems.add(c);
    });
    calculateTotal();
  }

  void removeSelectedItem(Cart c) {
    setState(() {
      selectedItems.remove(c);
    });
    calculateTotal();
  }

  void calculateTotal() {
    int sum = 0;
    selectedItems.forEach((item) {
      sum = sum + (item.product.price * item.numOfItems);
    });
    setState(() {
      selectedTotal = sum.toDouble();
    });
  }

  void setQty(int index, int qty) {
    Cart.cartItems[index].numOfItems = qty;
    calculateTotal();
  }

  double selectedTotal = 0;

  @override
  Widget build(BuildContext context) {
    if (Cart.cartItems.length == 0) {
      return Center(child: Text("There are no items in the cart"));
    } else {
      return Stack(
        children: [
          Column(
            children: [
              ...List.generate(
                  Cart.cartItems.length,
                  (index) => CardItemCard(
                        cart: Cart.cartItems[index],
                        addSelectedItem: addSelectedItem,
                        removeSelectedItem: removeSelectedItem,
                        setQty: setQty,
                        index: index,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Selected Items (${selectedItems.length})",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Text(
                                "Rs.${selectedTotal}",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SecondaryButton(
                      text: "Checkout",
                      press: () => {},
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
    }
  }
}

class CardItemCard extends StatefulWidget {
  CardItemCard(
      {Key? key,
      required this.cart,
      required this.addSelectedItem,
      required this.removeSelectedItem,
      required this.setQty,
      required this.index})
      : super(key: key);
  final Cart cart;
  final Function addSelectedItem;
  final Function removeSelectedItem;
  final Function setQty;
  final int index;

  @override
  State<CardItemCard> createState() => _CardItemCardState();
}

class _CardItemCardState extends State<CardItemCard> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10, right: 10),
      child: Row(children: [
        Theme(
          child: Checkbox(
            checkColor: Colors.white,
            value: checked,
            onChanged: (bool? value) {
              print(value);
              setState(() {
                checked = value!;
                if (checked)
                  widget.addSelectedItem(widget.cart);
                else
                  widget.removeSelectedItem(widget.cart);
              });
            },
            activeColor: kPrimaryDarkColor,
          ),
          data: ThemeData(unselectedWidgetColor: kGreyBorder),
        ),
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: kProductBgColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.network(widget.cart.product.images[0]),
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
                widget.cart.product.title,
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
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Size : M",
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
                    "Rs.${(widget.cart.product.price * widget.cart.numOfItems).toDouble()}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  numberPicker(
                      qty: widget.cart.numOfItems,
                      setQty: widget.setQty,
                      index: widget.index)
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}

class numberPicker extends StatefulWidget {
  numberPicker(
      {Key? key, required this.qty, required this.setQty, required this.index})
      : super(key: key);
  int qty;
  Function setQty;
  int index;
  @override
  State<numberPicker> createState() => _numberPickerState();
}

class _numberPickerState extends State<numberPicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (widget.qty != 0) {
                widget.qty = widget.qty - 1;
              }
            });
            widget.setQty(widget.index, widget.qty);
          },
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: kGreyBorder)),
            child: Icon(
              Icons.remove,
              color: Colors.black,
              size: 15,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            widget.qty.toString(),
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.w600),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.qty = widget.qty + 1;
            });
            widget.setQty(widget.index, widget.qty);
          },
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: kPrimaryDarkColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: kPrimaryDarkColor)),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
