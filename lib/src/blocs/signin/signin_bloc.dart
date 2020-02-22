import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:upfr/src/utils/exceptions.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SigninBlocEvent, SignInBlocState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  SignInBlocState get initialState => SigninBlocInitial();

  @override
  Stream<SignInBlocState> mapEventToState(SigninBlocEvent event) async* {
    if (event is SignInWithGooglePressed) {
      yield* _mapSignInWithGooglePressedToState();
    }
  }

  Stream<SignInBlocState> _mapSignInWithGooglePressedToState() async* {
    try {
      final GoogleSignInAccount account = await GoogleSignIn().signIn();
      if (account != null) {
        final GoogleSignInAuthentication auth = await account.authentication;
        final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: auth.idToken,
          accessToken: auth.accessToken,
        );
        final AuthResult authResult = await _firebaseAuth.signInWithCredential(
          credential,
        );
        yield SignedIn(authResult.user);
      }
    } catch (exception, stacktrace) {
      print(stacktrace);
      yield SigninError(AppException.from(exception));
    }
  }
}
