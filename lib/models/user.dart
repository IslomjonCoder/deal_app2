import "package:equatable/equatable.dart";

import "interests.dart";

class CustomUser extends Equatable {
  final List<Hobby>? hobby;
  final String firstname;
  final String lastName;
  final String? about;
  final String born;
  final int age;
  final String id;
  final String gender;
  final String? patronymic;
  final String? avatar;
  final List<String>? userChats;
  final List<String>? userChatIgnore;
  final bool? isOnline;

  const CustomUser(
      {required this.avatar,
      required this.firstname,
      required this.lastName,
      required this.age,
      required this.userChats,
      required this.id,
      required this.userChatIgnore,
      required this.born,
      required this.gender,
      required this.patronymic,
      required this.about,
      required this.hobby,
      required this.isOnline,
      fff});

  factory CustomUser.fromJson(Map<String, dynamic> json) {
    return CustomUser(
      avatar: json["avatar"],
      firstname: json["firstName"],
      lastName: json["lastName"],
      age: json["age"],
      userChats: json["userChats"],
      id: json["id"],
      userChatIgnore: (json["userChatIgnore"] as List?)
          ?.map(
            (e) => e as String,
          )
          .toList(),
      born: json["born"],
      gender: json["gender"],
      patronymic: json["patronymic"],
      about: json["about"],
      hobby: (json["hobby"] as List?)?.map((e) => Hobby.fromJson(e)).toList(),
      isOnline: json["online"],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, Object?>{
      "firstName": firstname,
      "lastName": lastName,
      "age": age,
      "born": born,
      "gender": gender,
      "online": isOnline ?? false,
      "userChatIgnore": userChatIgnore,
      "userChats": userChats,
      "patronymic": patronymic,
      "about": about,
    };

    if (avatar != null) {
      data["avatar"] = avatar!;
    }

    if (hobby != null) {
      data["hobby"] = hobby
          ?.map(
            (e) => e.word,
          )
          .toList();
    }

    print("################################");

    print(data);
    print("################################");
    return data;
  }

  @override
  String toString() {
    return "User{avatar: $avatar, firstname: $firstname, lastName: $lastName, age: $age, userChats: $userChats, id: $id, userChatIgnore: $userChatIgnore, born: $born, gender: $gender, patronymic: $patronymic, about: $about, hobby: $hobby, isOnline: $isOnline}";
  }

  CustomUser copyWith({
    String? avatar,
    String? firstname,
    String? lastName,
    int? age,
    List<String>? userChats,
    String? id,
    List<String>? userChatIgnore,
    String? born,
    String? gender,
    List<Hobby>? hobby,
    String? patronymic,
    String? about,
    bool? isOnline,
  }) {
    return CustomUser(
      avatar: avatar ?? this.avatar,
      firstname: firstname ?? this.firstname,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      userChats: userChats != null ? List.from(userChats) : this.userChats,
      id: id ?? this.id,
      userChatIgnore: userChatIgnore != null
          ? List.from(userChatIgnore)
          : this.userChatIgnore,
      born: born ?? this.born,
      gender: gender ?? this.gender,
      hobby: hobby != null ? List.from(hobby) : this.hobby,
      patronymic: patronymic ?? this.patronymic,
      about: about ?? this.about,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  Map<String, dynamic> toSql() {
    final data = <String, Object?>{
      "id": id,
      "avatar": avatar,
      "firstName": firstname,
      "lastName": lastName,
      "age": age,
      "born": born,
      "gender": gender,
      "online": isOnline ?? false,
      "userChatIgnore": userChatIgnore?.join(","),
      "userChats": userChats?.join(","),
      "patronymic": patronymic,
      "about": about,
    };

    if (hobby != null) {
      data["hobby"] = hobby!.map((e) => e.word).join(",");
    }

    return data;
  }

  static CustomUser fromSql(Map<String, Object?> data) {
    return CustomUser(
      id: data["id"] as String,
      avatar: data["avatar"] as String?,
      firstname: data["firstName"] as String,
      lastName: data["lastName"] as String,
      age: data["age"] as int,
      userChats: (data["userChats"] as String?)?.split(",").toList(),
      userChatIgnore: (data["userChatIgnore"] as String?)?.split(",").toList(),
      born: data["born"] as String,
      gender: data["gender"] as String,
      hobby: (data["hobby"] as String?)
          ?.split(",")
          .map((e) => Hobby(word: e, emoji: ""))
          .toList(),
      patronymic: data["patronymic"] as String,
      about: data["about"] as String?,
      isOnline: data["online"] as bool,
    );
  }

  @override
  List<Object?> get props => [
        id,
        avatar,
        firstname,
        lastName,
        age,
        userChats,
        userChatIgnore,
        born,
        gender,
        patronymic,
        about,
        hobby,
        isOnline
      ];
}
