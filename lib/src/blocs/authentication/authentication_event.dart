part of 'authentication_bloc.dart';

abstract class AuthenticationBlocEvent extends Equatable {
  const AuthenticationBlocEvent();

  @override
  List<Object> get props => <Object>[];
}

class AppStarted extends AuthenticationBlocEvent {}

class UserSignedIn extends AuthenticationBlocEvent {
  const UserSignedIn({@required this.user}) : assert(user != null);

  final FirebaseUser user;

  @override
  List<Object> get props => <Object>[user];

  @override
  bool get stringify => true;
}

class UserSignedOut extends AuthenticationBlocEvent {}
