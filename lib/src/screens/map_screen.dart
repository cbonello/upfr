import 'package:easy_google_maps/easy_google_maps.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:upfr/src/models/event_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {Key key, @required EventModel event, @required RemoteConfig remoteConfig})
      : _event = event,
        _remoteConfig = remoteConfig,
        super(key: key);

  final EventModel _event;
  final RemoteConfig _remoteConfig;

  static Route<dynamic> route(EventModel event, RemoteConfig remoteConfig) {
    return MaterialPageRoute(
      builder: (BuildContext context) => MapScreen(
        event: event,
        remoteConfig: remoteConfig,
      ),
    );
  }

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget._event.title)),
        body: _MapView(event: widget._event, remoteConfig: widget._remoteConfig),
      ),
    );
  }
}

class _MapView extends StatelessWidget {
  const _MapView({
    Key key,
    @required this.event,
    @required this.remoteConfig,
  }) : super(key: key);

  final EventModel event;
  final RemoteConfig remoteConfig;

  @override
  Widget build(BuildContext context) {
    final String key = remoteConfig.getString('GOOGLE_MAP_KEY');

    return EasyGoogleMaps(
      apiKey: key,
      address: event.toString(),
      title: event.title,
    );
  }
}
