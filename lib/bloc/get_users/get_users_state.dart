part of 'get_users_bloc.dart';

abstract class GetUsersState extends Equatable {
  final List<CustomUser> users;

  const GetUsersState({required this.users});

  @override
  List<Object?> get props => [users];
}

class GetUsersInitial extends GetUsersState {
  GetUsersInitial() : super(users: []);
}

class GetUsersLoading extends GetUsersState {
  const GetUsersLoading({required super.users});
}

class GetUsersSuccess extends GetUsersState {
  const GetUsersSuccess({required super.users});
}

class GetUsersFailed extends GetUsersState {
  final String message;
  const GetUsersFailed({required super.users, required this.message});
}
