import 'package:flutter/material.dart';
import 'package:nolimit/screens/categoryProducts/categoryProducts_screen.dart';

import '../constants.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    required this.name,
    required this.selectedCategory,
    Key? key,
  }) : super(key: key);
  final String name;
  final selectedCategory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CategoryProductsScreen.routeName,
            arguments: name);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
          decoration: BoxDecoration(
              color: name == selectedCategory
                  ? kPrimaryColor.withOpacity(0.15)
                  : kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5)),
          child: name != selectedCategory
              ? Text(name)
              : Text(
                  name,
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                ),
        ),
      ),
    );
  }
}
