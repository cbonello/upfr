part of 'authentication_bloc.dart';

abstract class AuthenticationBlocState extends Equatable {
  const AuthenticationBlocState();

  @override
  List<Object> get props => [];
}

class Unauthenticated extends AuthenticationBlocState {}

class Authenticated extends AuthenticationBlocState {
  const Authenticated(this.user);

  final FirebaseUser user;

  @override
  List<Object> get props => <Object>[user];

  @override
  String toString() => 'Authenticated { user : $user }';
}
