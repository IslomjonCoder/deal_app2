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

    return Expanded(
      child: Stack(
        children: [
          GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            child: Transform.translate(
              offset: Offset(translation, 0),
              child: Transform.rotate(
                angle: rotation * pi / 6,
                child: UserCard(user: widget.user),
              ),
            ),
          ),
          Positioned(
            top: 370.h,
            right: 10,
            left: 10,
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanEnd,
              child: Transform.translate(
                offset: Offset(translation, 0),
                child: Transform.rotate(
                  angle: rotation * pi / 6,
                  child: Container(
                    width: 323.w,
                    margin: EdgeInsets.symmetric(horizontal: 14.w),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFCBC1F3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 23.60,
                          offset: Offset(4, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(14.sp),
                      child: Wrap(
                        spacing: 10.h,
                        runSpacing: 7.h,
                        children: [
                          for (var interest in widget.user.interests)
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(text: interest.emoji),
                                TextSpan(
                                    text: interest.word,
                                    style: TextStyle(fontSize: 17.sp))
                              ]),
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
