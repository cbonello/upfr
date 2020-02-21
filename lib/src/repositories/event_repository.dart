import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upfr/src/models/address_model.dart';
import 'package:upfr/src/models/event_model.dart';

abstract class EventsRepositoryInterface {
  Stream<List<EventModel>> readEvents();
}

class EventsRepository implements EventsRepositoryInterface {
  @override
  Stream<List<EventModel>> readEvents() async* {
    final List<EventModel> events = <EventModel>[
      EventModel(
        picture: 'assets/images/empire_state_building.jpg',
        title: 'Empire State Building',
        date: DateTime.now(),
        address: AddressModel(
          street: '350 Fifth Avenue',
          city: 'New York',
          state: 'NY',
          zipcode: '10118',
          geo: GeoPoint(40.7484, 73.9857),
        ),
        description:
            '''The Empire State Building is no longer the tallest building in the world, but it captures the imagination as one of the first and most iconic skyscrapers – a symbol of New York City. It is reputed to be the most photographed building in the world, and is also the country’s favorite according to the American Institute of Architects.

The open-air 86th Floor Observation Deck is the perfect place to take in all that New York has to offer, putting yourself in the center of it all with a 360-degree view of the city. Experience one-of-a-kind views of The Hudson River, East River, Central Park, The Brooklyn Bridge, Times Square, Lady Liberty and much more!''',
      ),
      EventModel(
        picture: 'assets/images/chrysler_building.jpg',
        title: 'Chrysler Building',
        date: DateTime.now(),
        address: AddressModel(
          street: '405 Lexington Avenue',
          city: 'New York',
          state: 'NY',
          zipcode: '10174',
          geo: GeoPoint(40.456, 73.583108),
        ),
        description:
            '''When the building opened in 1930, there was an observation deck called “Celestial” on the 71st floor. It was closed to the public in 1945 and is currently occupied by a private firm.  Until the late ‘70’s there was also The Cloud Club, a private club occupying the 66th through 68th floors.

Today, unfortunately, there is no official way for tourists to visit anything beyond the lobby, though, we are keeping our fingers crossed that this will change. ''',
      ),
      EventModel(
        picture: 'assets/images/statue_of_liberty.jpg',
        title: 'Statue of Liberty',
        date: DateTime.now(),
        address: AddressModel(
          street: 'Liberty Island',
          city: 'New York',
          state: 'NY',
          geo: GeoPoint(40.4121, 74.240),
        ),
        description:
            '''The Statue of Liberty, officially named the Statue of Liberty Enlightening the World, sits on the 12-acre Liberty Island in New York Harbor. This national monument, along with Ellis Island, has represented freedom from tyranny, financial hardship and suffering for many immigrants since the late 1800s. The French gave the Statue of Liberty to the United States as a gift to mark the centennial of the American Declaration of Independence.
French sculptor Frederic Bartholdi collaborated with French engineer Gustave Eiffel to create the statue.''',
      ),
    ];

    yield events;
  }
}
