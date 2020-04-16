import 'package:flutter/foundation.dart';
import 'package:upfr/src/models/address_model.dart';

class EventModel {
  const EventModel({
    @required this.picture,
    @required this.title,
    @required this.date,
    @required this.address,
    @required this.description,
  });

  final String picture;
  final String title;
  final DateTime date;
  final AddressModel address;
  final String description;

  @override
  String toString() {
    return '''EventModel {
      pictureUrl: $picture,
      title,: $title,
      date: $date, 
      address: $address,
      description: $description,
    }''';
  }
}
