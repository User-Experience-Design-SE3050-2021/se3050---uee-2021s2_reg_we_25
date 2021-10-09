import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Brand {
  static const TITLE = "title";
  static const IMAGE = "image";

  late String _title;
  late List _image;

//   getters

  String get title => _title;

  List get image => _image;

  Brand.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data() as Map;
    _title = data[TITLE];
    _image = data[IMAGE];

  }
}
