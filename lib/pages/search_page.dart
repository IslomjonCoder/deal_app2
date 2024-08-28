import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/interests.dart';
import '../models/user.dart';
import '../tab_manager.dart';
import '../widgets/swipable_card.dart';
import 'filter_page.dart';

List<Interests> interestList = [
  const Interests(emoji: '💻', word: 'Технологии'),
  const Interests(emoji: '📺', word: 'Маркетинг'),
  const Interests(emoji: '✨', word: 'Фриланс'),
  const Interests(emoji: '🔥', word: 'Крупный бизнес'),
];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void goToChatPage() {
    TabManager.changeTab(3);
  }

  void goToFilterPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FilterPage(),
        ));
  }

  List<User> userList = [
    User(
      image: "assets/images/source_avatar.jpeg",
      name: "Ангелина",
      age: 24,
      desc:
          "Привет 👋🏻 Ищу ребят в маркетинге, готова поделится и дать потенциальных клиентов для вас, если ср",
      interests: interestList,
    ),
    User(
      image: "assets/images/source_avatar.jpeg",
      name: "Максим",
      age: 27,
      desc:
          "Люблю технологии и занимаюсь разработкой. Ищу единомышленников для совместных проектов.",
      interests: interestList,
    ),
    User(
      image: "assets/images/source_avatar.jpeg",
      name: "Виктория",
      age: 22,
      desc:
          "Фрилансер в сфере дизайна. Интересуюсь крупными проектами и развитием бизнеса.",
      interests: interestList,
    ),
    User(
      image: "assets/images/source_avatar.jpeg",
      name: "Алексей",
      age: 30,
      desc:
          "Бизнесмен и инвестор. Ищу новые идеи и партнеров для масштабных проектов.",
      interests: interestList,
    ),
    User(
      image: "assets/images/source_avatar.jpeg",
      name: "София",
      age: 25,
      desc:
          "Маркетолог с опытом работы. Открыта к новым вызовам и сотрудничеству.",
      interests: interestList,
    ),
    User(
      image: "assets/images/source_avatar.jpeg",
      name: "Дмитрий",
      age: 29,
      desc:
          "Технологический энтузиаст, интересуюсь стартапами и новыми разработками.",
      interests: interestList,
    ),
    User(
      image: "assets/images/source_avatar.jpeg",
      name: "Екатерина",
      age: 26,
      desc:
          "Работаю в крупном бизнесе, ищу возможности для расширения своих знаний и навыков.",
      interests: interestList,
    ),
    User(
      image: "assets/images/source_avatar.jpeg",
      name: "Иван",
      age: 28,
      desc: "Инженер, интересуюсь новыми технологиями и проектами в IT-сфере.",
      interests: interestList,
    ),
    User(
      image: "assets/images/source_avatar.jpeg",
      name: "Ольга",
      age: 23,
      desc: "Фрилансер и предприниматель, ищу вдохновение для новых проектов.",
      interests: interestList,
    ),
    User(
      image: "assets/images/source_avatar.jpeg",
      name: "Андрей",
      age: 31,
      desc: "Бизнес-консультант, интересуюсь крупными проектами и инновациями.",
      interests: interestList,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: SafeArea(
        child: Column(
          children: [
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
                      child:
                          SvgPicture.asset("assets/icons/Sliders_vertical.svg"),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: goToChatPage,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.r),
                  ),
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
            SwipableCard(user: userList.first),
            const Spacer(),
            Row(
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
                    onPressed: () {
                      // Add your button action here
                    },
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
                      // Add your button action here
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
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
