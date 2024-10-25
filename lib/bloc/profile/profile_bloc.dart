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
    on<UpdateAvatar>(updateAvatar);
    on<UpdateStatus>(updateStatus);
    on<GetMe>(getMe);
    on<UpdateHobby>(updateHobby);
    on<UpdateGender>(updateGender);
    on<UpdateBirthDate>(updateBirthDate);
    on<AddUserOnChat>(addChat);
  }

  Future<void> updateStatus(
      UpdateStatus event, Emitter<ProfileState> emitter) async {
    final result = await ProfileService().updateStatus(event.id, event.online);

    if (result is DataSuccess<CustomUser>) {
      emitter(UpdateStatusSuccess(user: result.data));
    }
    emitter(ProfileError(user: state.user, message: result.message));
  }

  Future<void> updateAvatar(
      UpdateAvatar event, Emitter<ProfileState> emitter) async {
    final result =
        await ProfileService().updateAvatarUser(event.id, event.avatar);
    if (result is DataSuccess<CustomUser>) {
      emitter(UpdateAvatarSuccess(user: result.data));
    }
    emitter(ProfileError(user: state.user, message: result.message));
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
}
