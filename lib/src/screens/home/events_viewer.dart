import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:upfr/src/models/address_model.dart';
import 'package:upfr/src/models/event_model.dart';
import 'package:upfr/src/repositories/event_repository.dart';
import 'package:upfr/src/screens/map_screen.dart';
import 'package:upfr/src/screens/widgets/gradient_button.dart';
import 'package:upfr/src/utils/theme.dart';

class EventsViewer extends StatefulWidget {
  const EventsViewer({Key key, @required RemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig,
        super(key: key);

  final RemoteConfig _remoteConfig;

  @override
  _EventsViewerState createState() => _EventsViewerState();
}

class _EventsViewerState extends State<EventsViewer> {
  final EventsRepository eventsRepository = EventsRepository();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EventModel>>(
      stream: eventsRepository.readEvents(),
      initialData: <EventModel>[],
      builder: (BuildContext context, AsyncSnapshot<List<EventModel>> snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int i) {
                return EventCard(
                  event: snapshot.data[i],
                  remoteConfig: widget._remoteConfig,
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    Key key,
    @required EventModel event,
    @required RemoteConfig remoteConfig,
  })  : _event = event,
        _remoteConfig = remoteConfig,
        super(key: key);

  final EventModel _event;
  final RemoteConfig _remoteConfig;

  @override
  Widget build(BuildContext context) {
    print(_event.picture);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Card(
        elevation: 5.0,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      _event.picture,
                      alignment: Alignment(-1, -1),
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 25.0),
                    FractionallySizedBox(
                      widthFactor: 0.75,
                      child: GradientButton(
                        gradient: AppTheme.widgetGradient,
                        onPressed: () async {
                          await Navigator.push<void>(
                            context,
                            MapScreen.route(_event, _remoteConfig),
                          );
                        },
                        child: const Text(
                          'Register',
                          style:
                              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _event.title,
                      style: Theme.of(context).textTheme.headline6,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      DateFormat('MMMM d, y - ').add_jm().format(_event.date),
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(height: 10.0),
                    _EventAddress(event: _event),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          _event.description,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EventAddress extends StatelessWidget {
  const _EventAddress({
    Key key,
    @required EventModel event,
  })  : _event = event,
        super(key: key);

  final EventModel _event;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _streetSuite(_event.address),
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
        Text(
          _cityStateZip(_event.address),
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }

  String _streetSuite(AddressModel address) {
    String result = '${_event.address.street}';
    if (_event.address.suite != null) {
      result += ', ${_event.address.suite}';
    }
    return result;
  }

  String _cityStateZip(AddressModel address) {
    String result = '${_event.address.city}, ${_event.address.state}';
    if (_event.address.zipcode != null) {
      result += ', ${_event.address.zipcode}';
    }
    return result;
  }
}
