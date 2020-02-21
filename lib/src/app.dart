import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upfr/src/blocs/authentication/authentication_bloc.dart';
import 'package:upfr/src/screens/home/home_screen.dart';
import 'package:upfr/src/screens/signin_screen.dart';
import 'package:upfr/src/utils/theme.dart';

class UPFRApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return FutureBuilder(
      future: _setupRemoteConfig(),
      builder: (BuildContext context, AsyncSnapshot<RemoteConfig> snapshot) {
        return snapshot.hasData
            ? MaterialApp(
                title: 'Event Manager',
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.system,
                theme: AppTheme.theme(Brightness.light),
                darkTheme: AppTheme.theme(Brightness.dark),
                home: BlocBuilder<AuthenticationBloc, AuthenticationBlocState>(
                  builder: (BuildContext context, AuthenticationBlocState state) {
                    if (state is Authenticated) {
                      return HomeScreen(
                        user: state.user,
                        remoteConfig: snapshot.data,
                      );
                    }
                    return SignInScreen();
                  },
                ),
              )
            : Container();
      },
    );
  }

  Future<RemoteConfig> _setupRemoteConfig() async {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: true));
    return remoteConfig;
  }
}
