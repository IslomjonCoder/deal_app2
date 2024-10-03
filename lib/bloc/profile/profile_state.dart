part of "profile_bloc.dart";

class ProfileState extends Equatable {
  final CustomUser? user;
  const ProfileState({this.user});

  @override
  List<Object?> get props => [user];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial() : super();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading({required super.user});
}

class UpdateGenderSuccess extends ProfileState {
  const UpdateGenderSuccess({required super.user});
}

class UpdateBirthDateSuccess extends ProfileState {
  const UpdateBirthDateSuccess({required super.user});
}

class GetMeSuccess extends ProfileState {
  const GetMeSuccess({required super.user});
}

class UpdateHobbySuccess extends ProfileState {
  const UpdateHobbySuccess({required super.user});
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError({
    required super.user,
    required this.message,
  });
}

class AddUserChatSuccess extends ProfileState {
  const AddUserChatSuccess({required super.user});
}
