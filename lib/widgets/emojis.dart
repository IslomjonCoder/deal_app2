import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmojiLayout extends StatelessWidget {
  final List<List<String>> emojis = [
    [
      '🏢',
      '🔑',
    ],
    [
      '💸',
      '💻',
      '⭐',
    ],
    [
      '👋',
      '🔥',
    ],
    ['💎', '🦄', '🚀']
  ];

  EmojiLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var row in emojis)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: row.length == 2
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.spaceAround,
              children: [
                for (var emoji in row) EmojiWidget(emoji),
              ],
            ),
          )
      ],
    );
  }
}

class EmojiWidget extends StatelessWidget {
  final String emoji;

  const EmojiWidget(this.emoji, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(emoji, style: TextStyle(fontSize: 40.sp));
  }
}
