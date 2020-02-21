part of 'signin_bloc.dart';

abstract class SigninBlocEvent extends Equatable {
  const SigninBlocEvent();

  @override
  List<Object> get props => <Object>[];
}

class SignInWithGooglePressed extends SigninBlocEvent {}
