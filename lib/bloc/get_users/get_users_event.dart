part of "get_users_bloc.dart";

abstract class GetUsersEvent {}

class UsersFetch extends GetUsersEvent {
  final String id;
  UsersFetch({required this.id});
}
