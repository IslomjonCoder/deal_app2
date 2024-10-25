import 'package:deal_app/bloc/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderChoose extends StatelessWidget {
  const GenderChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GenderButton(
          emoji: "👧",
          text: "Женский",
          onTap: () {
            final id = context.read<ProfileBloc>().state.user!.id;
            context.read<ProfileBloc>().add(UpdateGender("female", id));

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('female'),
              ),
            );
          },
        ),
        SizedBox(
          width: 10.w,
        ),
        GenderButton(
          emoji: "👦",
          text: 'Мужской',
          onTap: () {
            final id = context.read<ProfileBloc>().state.user!.id;
            context.read<ProfileBloc>().add(UpdateGender("male", id));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Мужской'),
              ),
            );
          },
        ),
      ],
    );
  }
}

class GenderButton extends StatelessWidget {
  final String emoji;
  final String text;
  final Function() onTap;
  const GenderButton({
    super.key,
    required this.emoji,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // width: 179.w,
          // height: 125.h,
          padding: EdgeInsets.only(
            top: 10.h,
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
          ),
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.800000011920929),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            shadows: [
              BoxShadow(
                color: const Color(0x26000000),
                blurRadius: 20.r,
                offset: const Offset(0, 5),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                emoji,
                style: TextStyle(
                    fontSize: 65.sp, fontWeight: FontWeight.w400, height: 0),
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21.sp,
                  height: 0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
