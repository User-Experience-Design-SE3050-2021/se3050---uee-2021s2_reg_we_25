import 'package:cloud_firestore/cloud_firestore.dart';

class Offer{
  static const ID = "id";
  static const TITLE = "title";
  static const IMAGES = "images";
  static const DESCRIPTION = "description";

  late int _id;
  late List _images;
  late String _description;
  late String _title;

  //   getters
  int get id => _id;
  String get description => _description;
  List get images => _images;
  String get title => _title;

  Offer.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data() as Map;
    _id = data[ID];
    _description = data[DESCRIPTION];
    _title = data[TITLE];
    _images = data[IMAGES];
  }

}