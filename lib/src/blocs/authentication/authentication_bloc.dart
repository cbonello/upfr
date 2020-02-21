import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  AuthenticationBlocState get initialState => Unauthenticated();

  @override
  Stream<AuthenticationBlocState> mapEventToState(AuthenticationBlocEvent event) async* {
    if (event is AppStarted) {
      yield* _mapUnauthenticatedEventToState();
    } else if (event is UserSignedIn) {
      yield* _mapSignedInToState(event.user);
    } else if (event is UserSignedOut) {
      yield* _mapSignedOutToState();
    }
  }

  Stream<AuthenticationBlocState> _mapUnauthenticatedEventToState() async* {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    if (user != null) {
      yield Authenticated(user);
    } else {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationBlocState> _mapSignedInToState(FirebaseUser user) async* {
    yield Authenticated(user);
  }

  Stream<AuthenticationBlocState> _mapSignedOutToState() async* {
    yield Unauthenticated();
    try {
      await Future.wait<void>(<Future<void>>[
        _firebaseAuth.signOut(),
        GoogleSignIn().signOut(),
      ]);
    } catch (exception, stacktrace) {
      print(stacktrace);
      print(exception);
    }
  }
}
