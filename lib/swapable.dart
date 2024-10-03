// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'models/user.dart';
// import 'pages/interest_page.dart';
// import 'widgets/swipable_card.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(428, 927),
//       child: MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Swipable Card'),
//           ),
//           body: Center(
//             child: SwipableCard(
//               user: CustomUser(
//                 isOnline: false,
//                 avatar: "assets/images/source_avatar.jpeg",
//                 firstname: "Ангелина",
//                 lastName: "lastname",
//                 userChatIgnore: [],
//                 userChats: [],
//                 id: "aaaaa",
//                 born: "2024-02-12",
//                 gender: "female",
//                 patronymic: "patronymyc",
//                 age: 24,
//                 about:
//                     "Привет 👋🏻 Ищу ребят в маркетинге, готова поделится и дать потенциальных клиентов для вас, если ср",
//                 hobby: interestList,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
