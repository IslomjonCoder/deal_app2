import 'package:equatable/equatable.dart';

class Hobby extends Equatable {
  final String emoji;
  final String word;

  const Hobby({required this.emoji, required this.word});

  @override
  List<Object?> get props => [
        emoji,
        word,
      ];

  String toJson() {
    return word;
  }

  factory Hobby.fromJson(String word) {
    return Hobby(emoji: '', word: word);
  }
}
