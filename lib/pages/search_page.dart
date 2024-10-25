import 'package:deal_app/bloc/chat_bloc/chat_bloc.dart';
import 'package:deal_app/bloc/get_users/get_users_bloc.dart';
import 'package:deal_app/bloc/profile/profile_bloc.dart';
import 'package:deal_app/pages/chat_detail.dart';
import 'package:deal_app/widgets/swipable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/auth_bloc/auth_bloc.dart';
import '../models/interests.dart';
import '../models/user.dart';
import '../tab_manager.dart';
import 'filter_page.dart';

List<Hobby> interestList = [
  const Hobby(emoji: '💻', word: 'Технологии'),
  const Hobby(emoji: '📺', word: 'Маркетинг'),
  const Hobby(emoji: '✨', word: 'Фриланс'),
  const Hobby(emoji: '🔥', word: 'Крупный бизнес'),
];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int index = 0;
  void goToChatPage(BuildContext context) {
    TabManager.changeTab(3);
    final user = context.read<ProfileBloc>().state.user;
    final ids = user?.userChats ?? [];
    context.read<ChatBloc>().add(GetAllChats(ids: ids, myId: user?.id ?? ""));
  }

  void goToFilterPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FilterPage(),
        ));
  }

  List<CustomUser> userList = [];

  @override
  void initState() {
    super.initState();
    final user = context.read<ProfileBloc>().state.user;
    context.read<GetUsersBloc>().add(UsersFetch(id: user?.id ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final user = context.read<ProfileBloc>().state.user;
        context.read<GetUsersBloc>().add(UsersFetch(id: user?.id ?? ""));
        print("I am here");
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => goToFilterPage(context),
                    minWidth: 0,
                    splashColor: Colors.transparent,
                    child: CircleAvatar(
                      child: SizedBox(
                        height: 44.h,
                        child: SvgPicture.asset(
                            "assets/icons/Sliders_vertical.svg"),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () => goToChatPage(context),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.r),
                    ),
                    elevation: 0,
                    highlightElevation: 0,
                    color: const Color(0xFFEBEDF0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Чаты',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF376062),
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SvgPicture.asset("assets/icons/chat_icon.svg"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80.h,
              ),
              BlocBuilder<GetUsersBloc, GetUsersState>(
                builder: (context, state) {
                  if (state.users.isNotEmpty) {
                    userList = state.users;
                    return SwipableCard(
                      user: userList[index],
                      onDragEnd: () {
                        if (index < userList.length - 1) {
                          setState(() {
                            index++;
                          });
                        }
                      },
                    );
                  }

                  return SizedBox(
                    height: 480.h,
                  );
                },
              ),
              const Spacer(),
              BlocBuilder<GetUsersBloc, GetUsersState>(
                builder: (context, state) {
                  final userList = state.users;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(minWidth: 180.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 20,
                              offset: Offset(0, 5),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          highlightElevation: 0,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.white.withOpacity(0.05),
                          color: Colors.white.withOpacity(0.12),
                          elevation: 0,
                          child: Text(
                            'Пропустить',
                            style: TextStyle(
                              color: const Color(0xFFF2F2F7),
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(minWidth: 180.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 20,
                              offset: Offset(0, 5),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            final user = context.read<ProfileBloc>().state.user;
                            context
                                .read<ProfileBloc>()
                                .add(AddUserOnChat(userList[index].id, user!));

                            context.read<ProfileBloc>().stream.listen(
                              (event) {
                                if (event is AddUserChatSuccess) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ChatDetail(name: "name", age: 20),
                                  ));
                                }
                              },
                            );
                          },
                          padding: EdgeInsets.symmetric(
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          highlightElevation: 0,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.black.withOpacity(0.05),
                          color: Colors.white.withOpacity(0.12),
                          elevation: 0,
                          child: Text(
                            'Написать',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xB71B1F26),
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w500,
                              // height: 0.05,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
