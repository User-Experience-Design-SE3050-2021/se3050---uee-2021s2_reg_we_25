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
      .limit(4)
      .get()
      .then((QuerySnapshot snap) {
        List<Product> newArrivals = [];
        snap.docs.forEach((snapshot) {
          if (snapshot.exists) {
            newArrivals.add(Product.fromSnapshot(snapshot));
          } else {
            print("Snapshots doesn't exist");
          }
        });
        return newArrivals;
      });

  Future<List<Product>> getTrendingProducts() => _firestore
      .collection(collection)
      .where("categories", arrayContainsAny: ['trending'])
      .limit(4)
      .get()
      .then((QuerySnapshot snap) {
        List<Product> trendingProducts = [];
        snap.docs.forEach((snapshot) {
          if (snapshot.exists) {
            trendingProducts.add(Product.fromSnapshot(snapshot));
          } else {
            print("Snapshots doesn't exist");
          }
        });
        return trendingProducts;
      });

  Future<List<Product>> getBestSellers() => _firestore
      .collection(collection)
      .where("categories", arrayContainsAny: ['best Sellers'])
      .limit(4)
      .get()
      .then((QuerySnapshot snap) {
        List<Product> bestSellers = [];
        snap.docs.forEach((snapshot) {
          if (snapshot.exists) {
            bestSellers.add(Product.fromSnapshot(snapshot));
          } else {
            print("Snapshots doesn't exist");
          }
        });
        return bestSellers;
      });
}
