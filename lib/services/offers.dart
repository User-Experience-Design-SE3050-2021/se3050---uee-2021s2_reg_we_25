import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nolimit/models/Offer.dart';

class OffersService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = 'offers';

  Future<List<Offer>> getAllOffers() =>
      _firestore.collection(collection).get().then((QuerySnapshot snap) {
        List<Offer> allOffers = [];
        snap.docs.forEach((snapshot) {
          if (snapshot.exists) {
            allOffers.add(Offer.fromSnapshot(snapshot));
          } else {
            print("Snapshots doesn't exist");
          }
        });
        return allOffers;
      });
}
