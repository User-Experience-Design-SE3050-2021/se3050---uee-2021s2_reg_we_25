import 'package:cloud_firestore/cloud_firestore.dart';

class Offer {
  static const TITLE = "title";
  static const IMAGE = "image";
  static const HEROIMAGE = "heroImage";
  static const CONDITIONS = "conditions";
  static const BGCOLOR = "bgColor";

  late String _heroImage;
  late String _image;
  late List _conditions;
  late String _title;
  late String _bgColor;

  //getters
  String get heroImage => _heroImage;
  String get image => _image;
  List get conditions => _conditions;
  String get title => _title;
  String get bgColor => _bgColor;

  Offer.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data() as Map;
    _image = data[IMAGE];
    _title = data[TITLE];
    _conditions = data[CONDITIONS];
    _heroImage = data[HEROIMAGE];
    _bgColor = data[BGCOLOR];
  }
}
