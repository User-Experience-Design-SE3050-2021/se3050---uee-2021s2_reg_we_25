import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nolimit/models/Category.dart';

class CategoryService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = 'categories';

  Future<List<Category>> getAllCategory() =>
      _firestore.collection(collection).get().then((QuerySnapshot snap) {
        List<Category> allCategory = [];
        snap.docs.forEach((snapshot) {
          print("snapshot");
          if (snapshot.exists) {
            allCategory.add(Category.fromSnapshot(snapshot));
          } else {
            print("Snapshots doesn't exist");
          }
        });
        return allCategory;
      });
}
