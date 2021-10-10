import 'package:flutter/material.dart';
import 'package:nolimit/models/Offer.dart';
import 'package:nolimit/services/offers.dart';

class OffersProvider with ChangeNotifier {
  List<Offer> _allOffers = [];
  OffersService _offerService = OffersService();

  OffersProvider() {
    _getAllOffers();
  }

//  getter
  List<Offer> get allOffers => _allOffers;

//  methods
  void _getAllOffers() async {
    _allOffers = await _offerService.getAllOffers();
    notifyListeners();
  }
}
