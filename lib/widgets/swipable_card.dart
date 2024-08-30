import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/user.dart';
import 'user_card.dart';

class SwipableCard extends StatefulWidget {
  final User user;

  const SwipableCard({super.key, required this.user});

  @override
  _SwipableCardState createState() => _SwipableCardState();
}

class _SwipableCardState extends State<SwipableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _dragStartX = 0.0;
  double _dragCurrentX = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    _dragStartX = details.globalPosition.dx;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragCurrentX = details.globalPosition.dx - _dragStartX;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_dragCurrentX.abs() > 100) {
      _controller.forward().then((_) => _resetCard());
    } else {
      setState(() {
        _dragCurrentX = 0.0;
      });
    }
  }

  void _resetCard() {
    setState(() {
      _dragCurrentX = 0.0;
    });
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    double rotation = _dragCurrentX / 200;
    double translation = _dragCurrentX;

    return GestureDetector(
      onPanStart: _onPanStart,
      onPanEnd: _onPanEnd,
      onPanUpdate: _onPanUpdate,
      child: Transform.rotate(
        angle: rotation * pi / 6,
        child: Transform.translate(
          offset: Offset(translation, 0),
          child: SizedBox(
            height: 480.h,
            child: Stack(
              children: [
                UserCard(user: widget.user),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    // width: 324.w,
                    height: 100.h,
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFCBC1F3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      shadows: [
                        BoxShadow(
                          color: const Color(0x3F000000),
                          blurRadius: 23.sp,
                          offset: const Offset(4, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: [
                            for (var interest in widget.user.interests)
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: interest.emoji + ' ',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500)),
                                  TextSpan(
                                      text: interest.word,
                                      style: TextStyle(
                                          fontSize: 17.5.sp,
                                          fontWeight: FontWeight.w400))
                                ]),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
