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
    var appProvider = Provider.of<AppProvider>(context);
    final double itemHeight = getProportionateScreenHeight(202);
    final double itemWidth = getProportionateScreenWidth(100);
    return Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryTab(
                        name: 'All',
                      ),
                      CategoryTab(
                        name: 'Men',
                      ),
                      CategoryTab(
                        name: 'Women',
                      ),
                      CategoryTab(
                        name: 'Kids',
                      ),
                      CategoryTab(
                        name: 'Shirts',
                      ),
                    ],
                  )),
            ),
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: itemWidth / itemHeight,
                children: [
                  ...List.generate(
                      appProvider.allProducts.length,
                      (index) => ProductCard(
                            product: appProvider.allProducts[index],
                            press: () => {
                              Navigator.pushNamed(
                                  context, SingleProductScreen.routeName,
                                  arguments: ProductDetailsArguments(
                                      product: appProvider.allProducts[index])),
                            },
                          )),
                ],
              ),
            ),
          ],
        ));
  }
}
