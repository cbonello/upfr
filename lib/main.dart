import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upfr/src/app.dart';
import 'package:upfr/src/blocs/authentication/authentication_bloc.dart';
import 'package:upfr/src/blocs/bloc/signin_bloc.dart';
import 'package:upfr/src/blocs/bloc_delegate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (BuildContext context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
              create: (_) => AuthenticationBloc()..add(AppStarted()),
            ),
            BlocProvider<SignInBloc>(create: (_) => SignInBloc()),
          ],
          child: UPFRApp(),
        );
      },
    ),
  );
}
