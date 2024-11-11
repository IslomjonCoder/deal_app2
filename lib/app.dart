import 'package:deal_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:deal_app/bloc/chat_bloc/chat_bloc.dart';
import 'package:deal_app/bloc/event_bloc/event_bloc.dart';
import 'package:deal_app/bloc/event_bloc/event_event.dart';
import 'package:deal_app/bloc/get_users/get_users_bloc.dart';
import 'package:deal_app/bloc/profile/profile_bloc.dart';
import 'package:deal_app/models/user.dart';
import 'package:deal_app/pages/intro_page.dart';
import 'package:deal_app/pages/main_home_screen.dart';
import 'package:deal_app/services/local_user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      fontSizeResolver: FontSizeResolvers.diameter,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc()..add(const LoadLocalUser())),
          BlocProvider(create: (context) => GetUsersBloc()),
          BlocProvider(create: (context) => ProfileBloc()),
          BlocProvider(create: (context) => ChatBloc()),
          BlocProvider(create: (context) => EventBloc()..add(const GetEventsEvent()))
        ],
        child: FutureBuilder<CustomUser?>(
            future: LocalUserService.getUser(),
            builder: (context, snapshot) {
              print(snapshot.data);
              return StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                        fontFamily: "SfPro", primaryColor: Colors.white, iconTheme: const IconThemeData(color: Colors.white)),
                    home: snapshot.data == null ? const IntroPage() : const MainHomeScreen(),
                  );
                }
              );
            }),
      ),
    );
  }
}
