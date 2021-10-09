import 'package:flutter/material.dart';
import 'package:nolimit/constants.dart';
import 'package:nolimit/provider/BrandProvider.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var brandProvider = Provider.of<BrandProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "BRANDS",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 25,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 20,
              spacing: 35,
              children: [
                ...List.generate(
                    brandProvider.allBrand.length,
                        (index) => BrandContainer(
                      url: brandProvider.allBrand[index].image,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BrandContainer extends StatelessWidget {
  const BrandContainer({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(0),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: kBorderColor, width: 2)),
      child: Image.network(
        url,
        width: 100,
      ),
    );
  }
}
