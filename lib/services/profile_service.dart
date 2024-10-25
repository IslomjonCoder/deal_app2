import 'dart:convert';

import 'package:deal_app/config/apis.dart';
import 'package:deal_app/config/datasource.dart';
import 'package:deal_app/models/interests.dart';
import 'package:deal_app/models/user.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  Future<DataSource> getMe(String id) async {
    final response = await http.get(
      Uri.http(Apis.baseUrl, Apis.getMe, {"id": id}),
    );
    if (response.statusCode == 200) {
      final user = CustomUser.fromJson(jsonDecode(response.body));
      return DataSuccess<CustomUser>(data: user, message: "User fetch success");
    }
    print(response.body);

    return DataFailure(message: "Something got wrong ${response.body}");
  }

  Future<DataSource> getAllUsers() async {
    final response = await http.get(Uri.http(Apis.baseUrl, Apis.getAllUser));
    if (response.statusCode == 200) {
      final users = List<CustomUser>.from(
          jsonDecode(response.body).map((x) => CustomUser.fromJson(x)));
      return DataSuccess<List<CustomUser>>(
          data: users, message: "Users fetch success");
    }
    print(response.body);
    return DataFailure(message: "Something got wrong ${response.body}");
  }

  Future<DataSource> updateUserGender(String id, String gender) async {
    final response = await http.post(
      Uri.parse(
          "http://5.35.81.3:8080/User/update-gender-user?id=$id&gender=$gender"),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("Update user gender success");
      return DataSuccess<CustomUser>(
          data: CustomUser.fromJson(jsonDecode(response.body)),
          message: "User update success");
    }

    return DataFailure(message: "Something got wrong ${response.body}");
  }

  Future<DataSource> updateHobby(List<Hobby> hobbies, String id) async {
    final response = await http.put(
      Uri.http(Apis.baseUrl, Apis.updateHobbyUser, <String, String>{
        "id": id,
      }),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode(hobbies
          .map(
            (e) => e.word,
          )
          .toList()),
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return DataSuccess<CustomUser>(
          data: CustomUser.fromJson(jsonDecode(response.body)),
          message: "User update success");
    }
    return DataFailure(message: "Something got wrong ${response.body}");
  }

  Future<DataSource> updateUser(
    String id, {
    String? firstName,
    required CustomUser user,
    String? lastName,
    String? patronymic,
    int? age,
    String? gender,
    String? about,
    String? born,
    List<Hobby>? hobby,
    String? avatar,
    List<String>? usersChat,
    List<String>? userChatIgnore,
    bool? online,
  }) async {
    final headers = {"accept": "*/*", "Content-Type": "application/json"};
    final data = user
        .copyWith(
          avatar: avatar,
          firstname: firstName,
          lastName: lastName,
          age: age,
          userChats: usersChat,
          userChatIgnore: userChatIgnore,
          born: born,
          gender: gender,
          patronymic: patronymic,
          about: about,
          hobby: hobby,
          isOnline: online,
        )
        .toJson();
    print("Data: $data  $id");
    final response = await http.put(
        headers: headers,
        Uri.parse('http://5.35.81.3:8080/User/update-user?id=$id'),
        body: jsonEncode(data));

    print(jsonEncode(data));
    print(response.statusCode);
    // Handle the response
    if (response.statusCode == 200) {
      print("User update success");
      final user = CustomUser.fromJson(jsonDecode(response.body));
      return DataSuccess<CustomUser>(
        data: user,
        message: "User update success",
      );
    } else {
      print(response.body);
      return DataFailure(
        message: "Something got wrong ${response.body}",
      );
    }
  }

  Future<DataSource> updateStatus(String id, bool online) async {
    final response = await Dio().post(
      "http://${Apis.baseUrl}${Apis.updateStatus}?id=$id&online=$online",
    );

    if (response.statusCode == 200) {
      return DataSuccess<CustomUser>(
        data: CustomUser.fromJson(response.data),
        message: "User status update success",
      );
    }

    return DataFailure(message: "Something got wrong ${response.data}");
  }

  Future<DataSource> updateAboutUser(CustomUser user, String about) async {
    final result = await updateUser(
      user.id,
      user: user,
      about: about,
    );
    if (result is DataSuccess<CustomUser>) {
      return result;
    }
    return result;
  }

  Future<DataSource> updateDateBorn(CustomUser user, String born) async {
    final datetime = DateTime.parse(born);
    final age = DateTime.now().difference(datetime).inDays ~/ 365;
    final result =
        await updateUser(user.id, user: user, born: born, age: age.abs());
    if (result is DataSuccess<CustomUser>) {
      return result;
    }
    return result;
  }

  Future<DataSource> updateAvatarUser(String id, String avatar) async {
    final response = await http.post(
      Uri.parse(
          'http://5.35.81.3:8080/User/update-avatar-user?id=$id&avatar=$avatar'),
      headers: {
        'accept': '*/*',
      },
    );

    if (response.statusCode == 200) {
      return DataSuccess<CustomUser>(
        data: CustomUser.fromJson(jsonDecode(response.body)),
        message: "User avatar update success",
      );
    }

    return DataFailure(message: "Something got wrong ${response.body}");
  }

  Future<DataSource> updateUserChat(CustomUser user, String chatId) async {
    final result = await updateUser(
      user.id,
      user: user,
      usersChat: {...(user.userChats ?? <String>[]), chatId}.toList(),
    );
    print(result.message);
    if (result is DataSuccess<CustomUser>) {
      return result;
    }
    return result;
  }
}
