import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmojiLayout extends StatelessWidget {
  final List<List<String>> emojis = [
    [
      'assets/icons/emojis/office.png',
      'assets/icons/emojis/key.png',
    ],
    [
      'assets/icons/emojis/money.png',
      'assets/icons/emojis/laptop.png',
      "assets/icons/emojis/star.png",
    ],
    [
      'assets/icons/emojis/hand.png',
      'assets/icons/emojis/fire.png',
    ],
    [
      'assets/icons/emojis/diamond.png',
    ],
    ['assets/icons/emojis/unicorn.png', "", 'assets/icons/emojis/rocket.png']
  ];

  EmojiLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        for (var row in emojis)
          Padding(
            padding: emojis.indexOf(row) == 3
                ? EdgeInsets.only(top: 10.sp)
                : EdgeInsets.symmetric(
                    vertical: emojis.indexOf(row) == 4 ? 0 : 10.sp),
            child: Row(
              mainAxisAlignment: row.length == 2 || emojis.indexOf(row) == 0
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.spaceAround,
              children: [
                for (var emoji in row)
                  Padding(
                    padding: emojis.indexOf(row) == 2
                        ? EdgeInsets.symmetric(horizontal: 60.w)
                        : EdgeInsets.zero,
                    child: EmojiWidget(emoji),
                  ),
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
    if (emoji == "") {
      return const SizedBox.shrink();
    }
    return SizedBox(
        height: 41.h,
        child: Image.asset(
          emoji,
          fit: BoxFit.fitHeight,
        ));
  }
}
