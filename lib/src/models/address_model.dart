import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class AddressModel extends Equatable {
  const AddressModel({
    @required this.street,
    this.suite,
    @required this.city,
    @required this.state,
    this.zipcode,
    @required this.geo,
  });

  final String street;
  final String suite;
  final String city;
  final String state;
  final String zipcode;
  final GeoPoint geo;

  @override
  List<Object> get props => <Object>[
        street,
        suite,
        city,
        state,
        zipcode,
        geo,
      ];

  @override
  bool get stringify => true;
}
