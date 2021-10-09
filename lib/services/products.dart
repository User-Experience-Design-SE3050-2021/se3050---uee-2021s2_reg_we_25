import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nolimit/models/Product.dart';

class ProductsService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = 'products';

  Future<List<Product>> getAllProducts() =>
      _firestore.collection(collection).get().then((QuerySnapshot snap) {
        List<Product> allProducts = [];
        snap.docs.forEach((snapshot) {
          if (snapshot.exists) {
            allProducts.add(Product.fromSnapshot(snapshot));
          } else {
            print("Snapshots doesn't exist");
          }
        });
        return allProducts;
      });

  Future<List<Product>> getNewArrivals() => _firestore
      .collection(collection)
      .where("categories", arrayContainsAny: ['new Arrivals'])
      .get()
      .then((QuerySnapshot snap) {
        List<Product> newArrivals = [];
        snap.docs.forEach((snapshot) {
          if (snapshot.exists) {
            print(snapshot.id);
            newArrivals.add(Product.fromSnapshot(snapshot));
          } else {
            print("Snapshots doesn't exist");
          }
        });
        return newArrivals;
      });
}
