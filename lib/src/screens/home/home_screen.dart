import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:upfr/src/blocs/authentication/authentication_bloc.dart';
import 'package:upfr/src/screens/home/events_viewer.dart';
import 'package:upfr/src/screens/home/user_identity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key key, @required FirebaseUser user, @required RemoteConfig remoteConfig})
      : _user = user,
        _remoteConfig = remoteConfig,
        super(key: key);

  final FirebaseUser _user;
  final RemoteConfig _remoteConfig;

  static Route<dynamic> route(
    RouteSettings settings,
    FirebaseUser user,
    RemoteConfig remoteConfig,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => HomeScreen(
        user: user,
        remoteConfig: remoteConfig,
      ),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('UPFR'),
          actions: <Widget>[
            PopupMenuButton<dynamic>(
              icon: Icon(Icons.person),
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<dynamic>>[
                  PopupMenuItem<dynamic>(
                    child: ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Sign Out'),
                      onTap: () {
                        Navigator.of(context).pop();
                        context.bloc<AuthenticationBloc>().add(UserSignedOut());
                      },
                    ),
                  ),
                ];
              },
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: UserIdentity(user: widget._user),
                ),
                EventsViewer(remoteConfig: widget._remoteConfig),
                const SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
