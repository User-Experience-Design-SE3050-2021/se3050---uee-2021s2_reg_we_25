import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nolimit/components/product_card.dart';
import 'package:nolimit/models/Brand.dart';
import 'package:nolimit/models/Category.dart';
import 'package:nolimit/models/Product.dart';
import 'package:nolimit/provider/BrandProvider.dart';
import 'package:nolimit/provider/Category_provider.dart';
import 'package:nolimit/provider/app_provider.dart';
import 'package:nolimit/screens/allBrands/allBrands_screen.dart';
import 'package:nolimit/screens/allCategory/all_category_screen.dart';
import 'package:nolimit/screens/allOffers/all_offers_screen.dart';
import 'package:nolimit/screens/allProducts/all_products_screen.dart';
import 'package:nolimit/screens/categoryProducts/categoryProducts_screen.dart';
import 'package:nolimit/screens/singleProduct/singleProduct_screen.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var brandProvider = Provider.of<BrandProvider>(context);
    final double itemHeight = getProportionateScreenHeight(202);
    final double itemWidth = getProportionateScreenWidth(100);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ImageSlideshow(
                height: 170,
                indicatorColor: Colors.transparent,
                indicatorBackgroundColor: Colors.transparent,
                autoPlayInterval: 5000,
                isLoop: true,
                children: [
                  Image.asset(
                    "assets/images/hero.png",
                  ),
                  Image.asset(
                    "assets/images/hero3.png",
                  ),
                  Image.asset(
                    "assets/images/hero2.png",
                  ),
                ]),
            SizedBox(
              height: 15,
            ),
            HotIconsRow(),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  ProductGroup(
                      arr: appProvider.newArrivals,
                      title: "New Arrivals",
                      route: AllProductsScreen.routeName),
                  ProductGroup(
                      arr: appProvider.bestSellers,
                      title: "Best Sellers",
                      route: AllProductsScreen.routeName),
                  TopCollections(
                    allCollections: categoryProvider.allCategory,
                  ),
                  ProductGroup(
                      arr: appProvider.trendingProducts,
                      title: "Trending Products",
                      route: AllProductsScreen.routeName),
                  AllBrands(
                    allBrands: brandProvider.allBrand,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AllBrands extends StatelessWidget {
  const AllBrands({Key? key, required this.allBrands}) : super(key: key);
  final List<Brand> allBrands;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Brands",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 18),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AllBrandsScreen.routeName);
              },
              child: Text(
                "See More",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(allBrands.length,
                  (index) => SingleBrand(image: allBrands[index].image))
            ],
          ),
        )
      ],
    );
  }
}

class SingleBrand extends StatelessWidget {
  const SingleBrand({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: SizedBox(
            width: getProportionateScreenWidth(100),
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(5),
                  getProportionateScreenWidth(2),
                  getProportionateScreenWidth(2),
                  0),
              child: Image.network(
                image,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class TopCollections extends StatelessWidget {
  const TopCollections({Key? key, required this.allCollections})
      : super(key: key);

  final List<Category> allCollections;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Collections",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AllCategoryScreen.routeName);
                  },
                  child: Text(
                    "See More",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Wrap(
                spacing: 15,
                runSpacing: 10,
                children: [
                  ...List.generate(
                      allCollections.length,
                      (index) => SingleCollection(
                            name: allCollections[index].title,
                            image: allCollections[index].image,
                          )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SingleCollection extends StatelessWidget {
  const SingleCollection({Key? key, required this.name, required this.image})
      : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CategoryProductsScreen.routeName,
            arguments: name);
      },
      child: SizedBox(
        width: getProportionateScreenWidth(95),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(5),
                    getProportionateScreenWidth(5),
                    getProportionateScreenWidth(2),
                    0),
                decoration: BoxDecoration(
                    color: kProductBgColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15)),
                child: Image.network(
                  image,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

class ProductGroup extends StatelessWidget {
  const ProductGroup(
      {Key? key, required this.arr, required this.title, required this.route})
      : super(key: key);
  final List<Product> arr;
  final String title;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 18),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, route);
              },
              child: Text(
                "See More",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
          ],
        ),
        Wrap(
          spacing: 30,
          runSpacing: -15,
          children: [
            ...List.generate(
                arr.length,
                (index) => ProductCard(
                      product: arr[index],
                      press: () => {
                        Navigator.pushNamed(
                            context, SingleProductScreen.routeName,
                            arguments:
                                ProductDetailsArguments(product: arr[index])),
                      },
                    )),
          ],
        ),
      ],
    );
  }
}

class HotIconsRow extends StatelessWidget {
  const HotIconsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HotIcon(
            name: "Offers",
            icon: "assets/icons/discount.svg",
            color1: 0xFF1488CC,
            color2: 0xFF2B32B2,
            padding: 12,
            route: AllOffersScreen.routeName,
          ),
          HotIcon(
            name: "Categories",
            icon: "assets/icons/categories.svg",
            color1: 0xFF02AAB0,
            color2: 0xFF00CDAC,
            padding: 14,
            route: AllCategoryScreen.routeName,
          ),
          HotIcon(
              name: "Brands",
              icon: "assets/icons/brands.svg",
              color1: 0xFF11ADD4,
              color2: 0xFF92EAFF,
              padding: 10,
              route: AllBrandsScreen.routeName),
          HotIcon(
            name: "Vouchers",
            icon: "assets/icons/vouchers.svg",
            color1: 0xFF46B3DB,
            color2: 0xFF22BCAF,
            padding: 10,
            route: "",
          ),
          HotIcon(
            name: "Clothes",
            icon: "assets/icons/clothers.svg",
            color1: 0xFF4CB7FC,
            color2: 0xFF1046D1,
            padding: 12,
            route: AllProductsScreen.routeName,
          )
        ],
      ),
    );
  }
}

class HotIcon extends StatelessWidget {
  const HotIcon(
      {Key? key,
      required this.name,
      required this.icon,
      required this.color1,
      required this.color2,
      required this.padding,
      required this.route})
      : super(key: key);
  final String name;
  final String icon;
  final int color1;
  final int color2;
  final double padding;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: Container(
            padding: EdgeInsets.all(padding),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(color1), Color(color2)],
              ),
            ),
            child: SvgPicture.asset(icon),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
