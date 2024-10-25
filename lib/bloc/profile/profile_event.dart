part of "profile_bloc.dart";

abstract class ProfileEvent {
  const ProfileEvent();
}

class GetMe extends ProfileEvent {
  final String id;
  GetMe(this.id);
}

class UpdateGender extends ProfileEvent {
  final String gender;
  final String id;
  UpdateGender(this.gender, this.id);
}

class UpdateHobby extends ProfileEvent {
  final List<Hobby> hobbies;
  final String id;
  UpdateHobby(
    this.hobbies, {
    required this.id,
  });
}

class UpdateBirthDate extends ProfileEvent {
  final String date;
  final CustomUser user;
  UpdateBirthDate(this.date, this.user);
}

// class UpdateUser extends ProfileEvent {
//   final CustomUser user;
//   UpdateUser(this.user);
// }

class UpdateStatus extends ProfileEvent {
  final String id;
  final bool online;
  UpdateStatus(this.online, this.id);
}

class UpdateAvatar extends ProfileEvent {
  final String id;
  final String avatar;
  UpdateAvatar(this.avatar, this.id);
}

// class AddUserChat extends ProfileEvent {
//   final String myId;
//   AddUserChat(this.myId);
// }

class AddUserOnChat extends ProfileEvent {
  final String userId;
  final CustomUser user;
  AddUserOnChat(this.userId, this.user);
}
