import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upfr/src/blocs/authentication/authentication_bloc.dart';
import 'package:upfr/src/blocs/bloc/signin_bloc.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<SignInBloc, SignInBlocState>(
          listener: (BuildContext context, SignInBlocState state) async {
            if (state is SigninError) {
              Scaffold.of(context).showSnackBar(SnackBar(content: Text('ERROR')));
            } else if (state is SignedIn) {
              assert(state.user != null);
              context.bloc<AuthenticationBloc>().add(UserSignedIn(user: state.user));
            }
          },
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        const Spacer(flex: 2),
                        Image.asset(
                          'assets/images/logo.png',
                          height: orientation == Orientation.portrait
                              ? constraints.maxHeight * 0.3
                              : null,
                          width: orientation == Orientation.landscape
                              ? constraints.maxWidth * 0.5
                              : null,
                        ),
                        const Spacer(flex: 1),
                        GoogleSignInButton(
                          borderRadius: 4.0,
                          darkMode: Theme.of(context).brightness == Brightness.dark,
                          onPressed: () =>
                              context.bloc<SignInBloc>().add(SignInWithGooglePressed()),
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
