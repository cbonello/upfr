import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:upfr/src/models/address_model.dart';

class EventModel extends Equatable {
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
  List<Object> get props => <Object>[
        picture,
        title,
        date,
        address,
        description,
      ];

  @override
  bool get stringify => true;
}
