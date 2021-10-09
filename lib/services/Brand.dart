import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nolimit/models/Brand.dart';



class BrandService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = 'brands';

  Future<List<Brand>> getAllBrand() =>
      _firestore.collection(collection).get().then((QuerySnapshot snap) {
        List<Brand> allBrand = [];
        snap.docs.forEach((snapshot) {
          if (snapshot.exists) {
            allBrand.add(Brand.fromSnapshot(snapshot));
          } else {
            print("Snapshots doesn't exist");
          }
        });
        return allBrand;
      });
}
