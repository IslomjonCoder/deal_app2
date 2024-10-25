import 'package:deal_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:deal_app/bloc/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/gender_choose.dart';
import 'interest_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final valueNotifer = ValueNotifier(0);
  DateTime? birthDay;

  void goToInterestPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const InterestPage(),
        ));
  }

  void initListeners(BuildContext context) {}

  @override
  void initState() {
    super.initState();
    initListeners(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.w),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is LogOutSuccess) {
            // context.read<AuthBloc>().add(const AuthLogout());
            Navigator.popUntil(
              context,
              (route) => !Navigator.canPop(context),
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 11.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 51.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.sp),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 16,
                        offset: Offset(0, 4.14),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(const LogOut());
                    },
                    padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                    highlightElevation: 0,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.white.withOpacity(0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.57),
                    ),
                    color: const Color(0x26007AFF),
                    elevation: 0,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Container(
                      width: 170.w,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 5),
                      child: Text(
                        'Выйти',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          height: 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              Center(
                  child: SizedBox(
                      height: 180.h,
                      child: Image.asset("assets/icons/hand_up.png"))),
              Center(
                child: Text(
                  'Какой пол?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFEBEDF0),
                    fontSize: 21.sp,
                    height: 0.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              const GenderChoose(),
              SizedBox(
                height: 18.h,
              ),
              Center(
                child: Text(
                  'Теперь уточним интересы \nи дату рождения',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFEBEDF0),
                    fontSize: 21.sp,
                    height: 1.1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              MaterialButton(
                onPressed: () => goToInterestPage(context),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 16.w),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.sp))),
                color: Colors.white,
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Мои интерсы 🔥',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w500,
                        height: 0.05,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              MaterialButton(
                onPressed: () async {
                  final result = showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2023));
                  birthDay = await result;
                  final user = context.read<ProfileBloc>().state.user;
                  context.read<ProfileBloc>().add(UpdateBirthDate(
                      "${birthDay!.year}-${birthDay!.month.toString().padLeft(2, "0")}-${birthDay!.day.toString().padLeft(2, "0")}",
                      user!));
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 16.w),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.sp))),
                color: Colors.white,
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        print("Birth date: ${state.user?.born}");
                        return Text(
                          state.user?.born == "1000-01-01"
                              ? 'Choose birthday'
                              : state.user?.born ?? "Choose birthday",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w500,
                            height: 0.05,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 29.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Flexible(
                  //   child: SizedBox(
                  //     width: 275.w,
                  //     child: Text(
                  //       'Напиши здесь три тезиса о себе и ИИ поможет сделать остальное',
                  //       style: TextStyle(
                  //         color: const Color(0xFFFAFAFA),
                  //         fontSize: 17.sp,
                  //         fontWeight: FontWeight.w300,
                  //         height: 0,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.22),
                          hintStyle: TextStyle(
                            color: const Color(0xFFFAFAFA),
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w300,
                            height: 0,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  MaterialButton(
                    onPressed: () {
                      // Add your onPressed functionality here
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
                    color: Colors.white.withOpacity(0.22),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    highlightElevation: 0,
                    elevation: 0,
                    child: Text(
                      'AI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 9.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/icons/emojis/hand.png",
                    height: 29.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Text(
                        state.user?.firstname ?? "",
                        style: TextStyle(
                          color: const Color(0xFFFAFAFA),
                          fontSize: 29.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
