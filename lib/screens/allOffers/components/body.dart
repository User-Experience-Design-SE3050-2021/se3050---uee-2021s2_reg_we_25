import 'package:flutter/material.dart';
import 'package:nolimit/components/category_tab.dart';
import 'package:nolimit/components/product_card.dart';
import 'package:nolimit/provider/app_provider.dart';
import 'package:nolimit/screens/singleProduct/singleProduct_screen.dart';
import 'package:nolimit/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
              children: [
                Container(
                  // margin: EdgeInsets.only(left: 130.0, right: 130.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 20.0,
                        width: double.infinity,
                      ),
                      Text(
                        'OFFERS',
                        style: TextStyle(
                            fontFamily: 'Muli',
                            color: Colors.grey.shade600,
                            fontSize: 20.0,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                        width: double.infinity,
                      ),
                      Container(
                        height: 150.0,
                        width: 340.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage(
                                'images/offer1.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 30.0,
                        width: double.infinity,
                      ),
                      Container(
                        height: 150.0,
                        width: 340.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage(
                                'images/offer1.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 30.0,
                        width: double.infinity,
                      ),
                      Container(
                        height: 150.0,
                        width: 340.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage(
                                'images/offer1.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 30.0,
                        width: double.infinity,
                      ),
                      Container(
                        height: 150.0,
                        width: 340.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage(
                                'images/offer1.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 30.0,
                        width: double.infinity,
                      ),
                      Container(
                        height: 150.0,
                        width: 340.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage(
                                'images/offer1.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ]
          ),

        ),
      ),
    );

  }
}
