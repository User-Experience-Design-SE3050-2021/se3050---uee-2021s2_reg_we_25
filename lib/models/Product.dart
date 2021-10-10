import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  static const ID = "id";
  static const TITLE = "title";
  static const PRICE = "price";
  static const IMAGES = "images";
  static const DESCRIPTION = "description";
  static const COLORS = "colors";
  static const SIZES = "sizes";
  static const QTY = "qty";
  static const CATEGORIES = "categories";

  late int _id;
  late String _title;
  late int _price;
  late List _images;
  late String _description;
  late List _colors;
  late List _sizes;
  late int _qty;
  late List _categories;

//   getters
  int get id => _id;
  String get title => _title;
  int get price => _price;
  String get description => _description;
  List get images => _images;
  List get sizes => _sizes;
  List get colors => _colors;
  int get qty => _qty;
  List get categories => _categories;

  Product.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data() as Map;
    _id = data[ID];
    _title = data[TITLE];
    _price = data[PRICE];
    _description = data[DESCRIPTION];
    _images = data[IMAGES];
    _sizes = data[SIZES];
    _colors = data[COLORS];
    _qty = data[QTY];
    _categories = data[CATEGORIES];
  }
}
