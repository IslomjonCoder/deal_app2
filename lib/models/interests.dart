import 'package:equatable/equatable.dart';

class Interests extends Equatable {
  final String emoji;
  final String word;

  const Interests({required this.emoji, required this.word});

  @override
  List<Object?> get props => [emoji, word];
}
