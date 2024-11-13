import 'package:deal_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:deal_app/bloc/navigation_cubit/navigation_cubit.dart';
import 'package:deal_app/bloc/profile/profile_bloc.dart';
import 'package:deal_app/services/local_user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tab_manager.dart';
import '../widgets/background_gradient_overlay.dart';
import '../widgets/bottomnavbar.dart';
import 'chat_page.dart';
import 'place_page.dart';
import 'profile_page.dart';
import 'search_page.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({
    super.key,
  });

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  // final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignInWithGoogleSuccess) {
          final user = state.user;
          context.read<ProfileBloc>().add(GetMe(user.id));
        }
      },
      child: BackgroundGradientOverlay(
        child: BlocProvider(
          create: (context) => NavigationCubit(),
          child: BlocBuilder<NavigationCubit, int>(
            builder: (context, state) {
              return Scaffold(
                extendBodyBehindAppBar: true,
                extendBody: state == 3,
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      Expanded(
                        child: BlocBuilder<NavigationCubit, int>(
                          builder: (context, state) {
                            if (state == 3) {
                              return const ChatPage();
                            }
                            return IndexedStack(
                              index: state,
                              children: const [
                                PlacePage(),
                                SearchPage(),
                                ProfilePage(),
                                // ChatPage(),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: const Bottomnavbar(),
              );
            },
          ),
        ),
      ),
    );
  }
}
