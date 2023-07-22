import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ve_news/config/di/di.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/presentation/feed/cubit/feed_cubit.dart';
import 'package:ve_news/presentation/feed/feed_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FeedCubit>(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(top: AppDimens.size4, right: AppDimens.size20),
                child: FaIcon(FontAwesomeIcons.inbox),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: PageView(
            children: const [
              FeedScreen(),
              SizedBox(),
              SizedBox(),
              SizedBox(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: AppDimens.size10, bottom: AppDimens.size30, left: AppDimens.size16, right: AppDimens.size16),
            child: GNav(
              rippleColor: AppColors.lightGrey200,
              hoverColor: AppColors.lightGrey300,
              gap: AppDimens.size8,
              activeColor: Colors.black,
              iconSize: AppDimens.size24,
              padding: const EdgeInsets.all(AppDimens.size12),
              duration: const Duration(milliseconds: 200),
              tabBackgroundColor: AppColors.lightGrey300,
              color: AppColors.black,
              tabs: const [
                GButton(
                  icon: FontAwesomeIcons.house,
                  text: 'Home',
                ),
                GButton(
                  icon: FontAwesomeIcons.bolt,
                  text: 'Actions',
                ),
                GButton(
                  icon: FontAwesomeIcons.magnifyingGlass,
                  text: 'Search',
                ),
                GButton(
                  icon: FontAwesomeIcons.userAstronaut,
                  text: 'Profile',
                ),
              ],
              selectedIndex: 0,
              onTabChange: (index) {},
            ),
          ),
        ),
      ),
    );
  }
}
