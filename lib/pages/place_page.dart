import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/meeting_card.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 19.w, left: 19.w, top: 20.h),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 27.h,
          );
        },
        itemCount: 20,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MeetingCard(
                time: DateTime(2024, 10, 20, 13, 40),
                price: '10000 ₽',
                description:
                    'Оценочное собеседование или как работает коммерческий профайлинг',
                title: 'Бизнес завтрак в ресторане Van Gogh',
                address: "Казань, улица Шафмата, дом 2",
                image: const AssetImage("assets/images/event.png"),
              ),
              if (index == 19)
                SizedBox(
                  height: 47.h,
                ),
            ],
          );
        },
      ),
    );
  }
}
