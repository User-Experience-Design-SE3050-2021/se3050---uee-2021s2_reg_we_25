import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    required this.name,
    Key? key,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
        decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5)),
        child: Text(name),
      ),
    );
  }
}
