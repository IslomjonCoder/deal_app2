import 'package:flutter/material.dart';

import '../colors.dart';

class LoginButton extends StatelessWidget {
  final Widget iconData;
  final String name;
  final VoidCallback onPressed;
  const LoginButton(
      {super.key,
      required this.iconData,
      required this.name,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MaterialButton(
        onPressed: onPressed,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconData,
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: CustomColors.cb71b1f26,
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
