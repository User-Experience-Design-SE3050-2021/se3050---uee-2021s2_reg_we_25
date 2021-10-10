import 'package:flutter/material.dart';
import 'package:nolimit/components/category_tab.dart';
import 'package:nolimit/components/product_card.dart';
import 'package:nolimit/models/Product.dart';
import 'package:nolimit/provider/Category_provider.dart';
import 'package:nolimit/provider/app_provider.dart';
import 'package:nolimit/screens/singleProduct/singleProduct_screen.dart';
import 'package:nolimit/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  List<Product> products = [];
  final String category;

  Body({required this.category});
  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    products = appProvider.filterProducts(category);

    var categoryProvider = Provider.of<CategoryProvider>(context);

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
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        CategoryTab(
                          name: 'All',
                          selectedCategory: category,
                        ),
                        ...List.generate(
                            categoryProvider.allCategory.length,
                            (index) => CategoryTab(
                                  name:
                                      categoryProvider.allCategory[index].title,
                                  selectedCategory: category,
                                ))
                      ],
                    ),
                  )),
            ),
            if (products.length > 0)
              Flexible(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: itemWidth / itemHeight,
                  children: [
                    ...List.generate(
                        products.length,
                        (index) => ProductCard(
                              product: products[index],
                              press: () => {
                                Navigator.pushNamed(
                                    context, SingleProductScreen.routeName,
                                    arguments: ProductDetailsArguments(
                                        product: products[index])),
                              },
                            )),
                  ],
                ),
              ),
            if (products.length == 0)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "This category has no products, Please select another category",
                  textAlign: TextAlign.center,
                ),
              )
          ],
        ));
  }
}
