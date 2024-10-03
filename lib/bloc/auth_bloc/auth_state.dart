part of 'auth_bloc.dart';

abstract class AuthState {
  final CustomUser? user;
  const AuthState({this.user});
}

class AuthInitial extends AuthState {
  AuthInitial({super.user});
}

class AuthLoadingState extends AuthState {
  AuthLoadingState({super.user});
}

class SignInWithGoogleSuccess extends AuthState {
  const SignInWithGoogleSuccess({
    required super.user,
  });
}

class SignInWithGoogleFailed extends AuthState {
  final String message;

  const SignInWithGoogleFailed(this.message, {super.user});
}

class SignOutGoogleSuccess extends AuthState {
  const SignOutGoogleSuccess({super.user});
}

class SignOutGoogleFailed extends AuthState {
  final String message;

  const SignOutGoogleFailed(this.message, {super.user});
}

class DeleteUserSuccess extends AuthState {}

class DeleteUserFailed extends AuthState {
  final String message;

  const DeleteUserFailed(this.message);
}
