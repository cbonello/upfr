part of 'signin_bloc.dart';

abstract class SignInBlocState extends Equatable {
  const SignInBlocState();

  @override
  List<Object> get props => [];
}

class SigninBlocInitial extends SignInBlocState {}

class SignedIn extends SignInBlocState {
  const SignedIn(this.user);

  final FirebaseUser user;

  @override
  List<Object> get props => <Object>[user];

  @override
  String toString() => 'SignedIn { user : $user }';
}

class SigninError extends SignInBlocState {
  const SigninError(this.exception);

  final AppException exception;

  @override
  List<Object> get props => <Object>[exception];

  @override
  String toString() => 'SigninError { exception : $exception }';
}
