import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Category {
  static const TITLE = "title";
  static const IMAGE = "image";
  static const COLOR = "color";

  late String _title;
  late String _image;
  late String _color;
//   getters

  String get title => _title;
  String get image => _image;
  String get color => _color;

  Category.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data() as Map;
    _title = data[TITLE];
    _image = data[IMAGE];
    _color = data[COLOR];
  }
}
