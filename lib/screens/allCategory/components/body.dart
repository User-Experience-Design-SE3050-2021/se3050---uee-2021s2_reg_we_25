import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nolimit/provider/Category_provider.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);
    print(categoryProvider.allCategory.length);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "CATEGORIES",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            ...List.generate(categoryProvider.allCategory.length, (index) {
              return SingleCategory(
                catName: categoryProvider.allCategory[index].title,
                image: categoryProvider.allCategory[index].image,
                color: categoryProvider.allCategory[index].color,
              );
            })
          ],
        ),
      ),
    );
  }
}

class SingleCategory extends StatelessWidget {
  const SingleCategory({
    Key? key,
    required this.catName,
    required this.image,
    required this.color,
  }) : super(key: key);

  final String catName;
  final String image;
  final String color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(int.parse(color))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              catName.toUpperCase(),
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            child: Image.network(image),
          )
        ],
      ),
    );
  }
}
