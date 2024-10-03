part of 'auth_bloc.dart';

class AuthServiceEvents {
  const AuthServiceEvents();
}

class SignInWithGoogle extends AuthServiceEvents {
  const SignInWithGoogle();
}

class SignOutGoogle extends AuthServiceEvents {
  const SignOutGoogle();
}

class DeleteUser extends AuthServiceEvents {
  final String id;
  const DeleteUser({
    required this.id,
  });
}

class LoadLocalUser extends AuthServiceEvents {
  const LoadLocalUser();
}
