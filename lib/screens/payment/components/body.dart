import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nolimit/components/CheckoutProgress.dart';
import 'package:nolimit/components/secondary_button.dart';
import 'package:nolimit/models/Cart.dart';
import 'package:nolimit/models/Order.dart';
import 'package:nolimit/screens/cart/components/checkout_form.dart';
import 'package:nolimit/screens/order_success/order_success_screen.dart';
import 'package:nolimit/screens/payment/components/payment_form.dart';
import 'package:nolimit/services/orders.dart';
import 'package:nolimit/size_config.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Order order = Order.getOrder();
  static String paymentMethod = "cash";
  void setPaymentMethod(String method) {
    setState(() {
      paymentMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(fontSize: 9, height: 0.3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: kGreyBorder),
            gapPadding: 5,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: kGreyBorder),
            gapPadding: 5,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        )),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Column(
                  children: [
                    CheckoutProgress(index: 3),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 0),
                      child: Container(
                        transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payment Methods",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: getProportionateScreenWidth(18),
                                  color: Colors.black),
                            ),
                            Text(
                              "Please Select a payment Method",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                              ),
                            ),
                            Row(
                              children: [
                                PaymentMethodIcon(
                                  icon: "assets/icons/Cashnew.svg",
                                  method: "cash",
                                  setPaymentMehtod: setPaymentMethod,
                                ),
                                PaymentMethodIcon(
                                  icon: "assets/icons/VisaNew.svg",
                                  method: "visa",
                                  setPaymentMehtod: setPaymentMethod,
                                ),
                                PaymentMethodIcon(
                                  icon: "assets/icons/masterNew.svg",
                                  method: "master",
                                  setPaymentMehtod: setPaymentMethod,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            if (paymentMethod == "visa" ||
                                paymentMethod == "master")
                              PaymentForm(),

                            // PaymentForm(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Promo Code",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: getProportionateScreenWidth(16),
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: getProportionateScreenWidth(5),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {}
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Promo Code",
                                          )),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        width: 50,
                                        height:
                                            getProportionateScreenHeight(54),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            primary: Colors.white,
                                            backgroundColor: kPrimaryDarkColor,
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            "Apply",
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      18),
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
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
                                        "Sub Total:",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(16),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Rs.${order.total}",
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
                                        "Shipping:",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(16),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Rs.${order.deliveryCharge}",
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
                                        "Discount:",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(16),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Rs.0.00",
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
                                        "Grand Total:",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(18),
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Rs.${order.total + order.deliveryCharge}",
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
                          text: "Pay",
                          press: () {
                            if (paymentMethod == "visa" ||
                                paymentMethod == "master") {
                              if (PaymentForm.formKey.currentState!
                                  .validate()) {
                                Order order = Order.getOrder();
                                order.paymentType = paymentMethod;
                                Order.setOrder(order);
                                OrderService orderService = OrderService();
                                orderService.addOrder();
                              }
                            } else if (paymentMethod == "cash") {
                              Order order = Order.getOrder();
                              order.paymentType = paymentMethod;
                              Order.setOrder(order);
                              OrderService orderService = OrderService();
                              orderService.addOrder();
                            }
                            Cart.removeOrderedItemsFromCart();
                            Order.setOrder(new Order());
                            Navigator.pushNamed(
                                context, OrderSuccessScreen.routeName);
                          },
                        )
                      ],
                    ),
                  ),
                )
              ])),
        ));
  }
}

class PaymentMethodIcon extends StatefulWidget {
  const PaymentMethodIcon(
      {Key? key,
      required this.icon,
      required this.method,
      required this.setPaymentMehtod})
      : super(key: key);
  final String method;
  final String icon;
  final Function setPaymentMehtod;

  @override
  State<PaymentMethodIcon> createState() => _PaymentMethodIconState();
}

class _PaymentMethodIconState extends State<PaymentMethodIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.setPaymentMehtod(widget.method);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 20, right: 15),
        width: 80,
        height: 50,
        decoration: BoxDecoration(
          color: _BodyState.paymentMethod == widget.method
              ? kPrimaryColor.withOpacity(0.08)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: _BodyState.paymentMethod == widget.method
                  ? kPrimaryColor.withOpacity(0.6)
                  : kGreyBorder),
        ),
        child: SvgPicture.asset(widget.icon),
      ),
    );
  }
}
