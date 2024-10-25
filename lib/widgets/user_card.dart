// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../models/user.dart';
//
// class UserCard extends StatelessWidget {
//   final User user;
//
//   const UserCard({super.key, required this.user});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 405.h,
//       margin: EdgeInsets.symmetric(
//           vertical: 10.h), // Add some margin for spacing between cards
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(23.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             blurRadius: 8.r,
//             offset: Offset(0, 4.r),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(23.r),
//         child: Stack(
//           children: [
//             // Background image
//             Positioned.fill(
//               child: Image.asset(
//                 user.image,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             // Gradient overlay
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.transparent,
//                       const Color(0xff76718E).withOpacity(0.8),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             // Content (Text)
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       '${user.name}, ${user.age} года',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 23.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(
//                         height: 10.h), // Adjusted spacing for better layout
//                     Text(
//                       user.desc,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 21.sp,
//                         fontWeight: FontWeight.w400,
//                         height: 1.2,
//                       ),
//                     ),
//                     SizedBox(
//                         height: 20.h), // Adjusted spacing for better layout
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/user.dart';

class UserCard extends StatelessWidget {
  final CustomUser user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(23.r)),
      child: Container(
        height: 405.h,
        width: 382.w,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        // clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              user.avatar ?? "",
            ),
            // scale: 0.1,
            fit: BoxFit.fitWidth,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x14000000),
              blurRadius: 4.47,
              offset: Offset(0, 1.sp),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              // clipBehavior: Clip.antiAlias,
              position: DecorationPosition.background,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: [
                    Color(0x00131313),
                    Color(0xff76718E),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 7.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${user.firstname}, ${user.age} года',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      user.about ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
