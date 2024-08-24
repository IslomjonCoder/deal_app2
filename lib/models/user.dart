import 'interests.dart';

class User {
  final List<Interests> interests;
  final String name;
  final String desc;
  final int age;
  final String image;

  const User({
    required this.image,
    required this.name,
    required this.age,
    required this.desc,
    required this.interests,
  });
}
