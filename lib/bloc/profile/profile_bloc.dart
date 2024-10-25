import 'package:deal_app/models/interests.dart';
import 'package:deal_app/models/user.dart';
import 'package:deal_app/services/local_user_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/datasource.dart';
import '../../services/profile_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileInitial()) {
    on<UpdateAvatar>((event, emit) {
      // TODO: implement event handler
    });
    on<LogOut>(logOut);
    on<GetMe>(getMe);
    on<UpdateStatus>((event, emit) {
      // TODO: implement event handler
    });
    on<UpdateHobby>(updateHobby);
    on<UpdateGender>(updateGender);
    on<UpdateBirthDate>(updateBirthDate);
    on<AddUserOnChat>(addChat);
  }

  Future<void> getMe(GetMe event, Emitter<ProfileState> emitter) async {
    final result = await ProfileService().getMe(event.id);
    if (result is DataSuccess<CustomUser>) {
      emitter(GetMeSuccess(user: result.data));
    }
    emitter(ProfileError(
      message: result.message,
      user: state.user,
    ));
  }

  Future<void> updateGender(
      UpdateGender event, Emitter<ProfileState> emitter) async {
    final result = await ProfileService().updateUserGender(
      event.id,
      event.gender,
    );

    if (result is DataSuccess<CustomUser>) {
      emitter(UpdateGenderSuccess(
        user: result.data,
      ));
    }
    emitter(ProfileError(
      message: result.message,
      user: state.user,
    ));
  }

  Future<void> updateBirthDate(
      UpdateBirthDate event, Emitter<ProfileState> emitter) async {
    final result =
        await ProfileService().updateDateBorn(event.user, event.date);

    if (result is DataSuccess<CustomUser>) {
      await LocalUserService.saveUser(result.data);
      emitter(UpdateBirthDateSuccess(
        user: result.data,
      ));
    }
    emitter(ProfileError(
      message: result.message,
      user: state.user,
    ));
  }

  Future<void> updateHobby(
      UpdateHobby event, Emitter<ProfileState> emitter) async {
    final result = await ProfileService().updateHobby(event.hobbies, event.id);

    if (result is DataSuccess<CustomUser>) {
      emitter(UpdateHobbySuccess(
        user: result.data,
      ));

      print("Update hobby success: " "${result.data.toJson()}");
    }
    emitter(ProfileError(
      message: result.message,
      user: state.user,
    ));
  }

  Future<void> addChat(
      AddUserOnChat event, Emitter<ProfileState> emitter) async {
    final result = await ProfileService().updateUserChat(
      event.user,
      event.userId,
    );

    if (result is DataSuccess<CustomUser>) {
      emitter(AddUserChatSuccess(
        user: result.data,
      ));
      return;
    }
    emitter(ProfileError(
      message: result.message,
      user: state.user,
    ));
  }

  Future<void> logOut(LogOut event, Emitter<ProfileState> emitter) async {
    emitter(ProfileLoading(user: state.user));
    LocalUserService.deleteUser();
    emitter(const LogOutSuccess());
  }
}
