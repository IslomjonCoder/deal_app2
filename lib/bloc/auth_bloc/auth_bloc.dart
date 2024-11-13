import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:deal_app/config/datasource.dart';
import 'package:deal_app/models/user.dart';
import 'package:deal_app/services/local_user_service.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../services/auth_service.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthServiceEvents, AuthState> {
  final AuthService _authService = AuthService();

  AuthBloc() : super(AuthInitial()) {
    on<SignInWithGoogle>(_signInWithGoogle);
    on<SignOutGoogle>(_signOutGoogle);
    on<DeleteUser>(_deleteUser);
    on<LoadLocalUser>(_loadLocalUser);
  }

  Future<void> _signInWithGoogle(SignInWithGoogle event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState(user: state.user));
    var (displayName, lastName, email, avatar) = await _authService.signInWithGoogle();

    if ((displayName?.split(" ").length ?? 0) > 1 && lastName == null) {
      lastName = displayName?.split(" ")[1];
    }
    final datasource = await AuthService().registerUser(
      displayName ?? "",
      lastName ?? "empty",
      "",
      0,
      "empty",
      "",
      "1000-01-01",
      [],
      '',
      [],
      [],
      false,
    );
    if (datasource is DataFailure) {
      print("Error:${datasource.message}");
      emit(SignInWithGoogleFailed(datasource.message, user: state.user));
      return;
    }
    await LocalUserService.saveUser((datasource as DataSuccess).data);

    emit(SignInWithGoogleSuccess((datasource).data!));
  }

  Future<void> _signOutGoogle(
    SignOutGoogle event,
    Emitter<AuthState> emit,
  ) async {
    try {
      _authService.signOutGoogle();
      FirebaseAuth.instance.signOut();
      // emit(state.copyWith(user: null));
    } on FirebaseAuthException catch (e) {
      // emit(state.copyWith(error: e.message));
    }
  }

  Future<void> _deleteUser(
    DeleteUser event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authService.deleteUser(event.id);
      await LocalUserService.deleteUser();
      // emit(state.copyWith(user: null));
    } on FirebaseAuthException catch (e) {
      // emit(state.copyWith(error: e.message));
    }
  }

  Future<void> _loadLocalUser(LoadLocalUser event, Emitter<AuthState> emit) async {
    // await LocalUserService.deleteUser();
    final user = await LocalUserService.getUser();
    log(user.toString(), name: "_loadLocalUser");
    if (user == null) return;

    emit(SignInWithGoogleSuccess(user));
  }
}
