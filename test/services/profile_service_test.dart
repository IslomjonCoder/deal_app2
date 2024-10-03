import 'package:deal_app/config/datasource.dart';
import 'package:deal_app/models/interests.dart';
import 'package:deal_app/services/profile_service.dart';
import 'package:test/test.dart';

void main() {
  group(
    ProfileService,
    () {
      test(
        'get me method',
        () async {
          const id = "cbfbf673-6e20-46bf-8a4a-ddb1325ce575";

          final response = await ProfileService().getMe(id) as DataSuccess;
          print(response.message);
          print(response.data);
        },
      );

      test(
        'get all users',
        () async {
          final response = await ProfileService().getAllUsers() as DataSuccess;
          print(response.message);
          print(response.data);
        },
      );

      test(
        'update user gender',
        () async {
          const id = "cbfbf673-6e20-46bf-8a4a-ddb1325ce575";
          const gender = "male";

          final response = await ProfileService().updateUserGender(id, gender)
              as DataSuccess;
          print(response.message);
          print(response.data);
        },
      );

      test(
        'update user hobby',
        () async {
          const id = "cbfbf673-6e20-46bf-8a4a-ddb1325ce575";
          const hobbies = <Hobby>[
            Hobby(emoji: "emoji", word: "gamer"),
            Hobby(emoji: "emoji", word: "Gambler")
          ];

          final response =
              await ProfileService().updateHobby(hobbies, id) as DataSuccess;
          print(response.message);
          print(response.data);
        },
      );

      test(
        'update user',
        () async {
          const id = "cbfbf673-6e20-46bf-8a4a-ddb1325ce575";
          const firstName = "Alex";
          final user = await ProfileService().getMe(id) as DataSuccess;
          print(user.data);
          final response = await ProfileService().updateUser(id,
              user: user.data,
              firstName: firstName,
              gender: "male") as DataSuccess;
          print(response.message);
          print(response.data);
        },
      );

      test(
        'update status user',
        () async {
          const id = "cbfbf673-6e20-46bf-8a4a-ddb1325ce575";
          const online = true;
          final response =
              await ProfileService().updateStatus(id, online) as DataSuccess;
          print(response.message);
          print(response.data);
        },
      );

      test(
        'update avatar user',
        () async {
          const id = "cbfbf673-6e20-46bf-8a4a-ddb1325ce575";
          const avatar = "https://picsum.photos/200";
          final response = await ProfileService().updateAvatarUser(id, avatar)
              as DataSuccess;
          print(response.message);
          print(response.data);
        },
      );
    },
  );
}
