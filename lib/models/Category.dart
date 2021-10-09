import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Category {
  static const TITLE = "title";
  static const IMAGE = "image";
  static const DESCRIPTION = "description";

  late String _title;
  late List _image;
  late String _description;

//   getters

  String get title => _title;
  String get description => _description;
  List get image => _image;


  Category.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data() as Map;
    _title = data[TITLE];
    _description = data[DESCRIPTION];
    _image = data[IMAGE];

  }
}
