import 'package:deal_app/models/user.dart';
import 'package:deal_app/services/profile_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/datasource.dart';

part 'get_users_event.dart';
part 'get_users_state.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  GetUsersBloc() : super(GetUsersInitial()) {
    on<UsersFetch>((event, emit) => getUsers(event, emit));
  }

  Future<void> getUsers(UsersFetch event, Emitter<GetUsersState> emit) async {
    emit(GetUsersLoading(users: state.users));
    final datasource = await ProfileService().getAllUsers();
    if (datasource is DataSuccess<List<CustomUser>>) {
      final users = (datasource.data)
          .where(
            (element) =>
                element.born != "1000-01-01" &&
                element.age != 0 &&
                element.id != event.id,
          )
          .toList();
      print("users: $users");

      emit(GetUsersSuccess(users: users));
    } else {
      emit(GetUsersFailed(message: datasource.message, users: state.users));
    }
  }
}
