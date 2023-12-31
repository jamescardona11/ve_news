import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ve_news/config/di/di.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/presentation/account/account_screen.dart';
import 'package:ve_news/presentation/articles/bookmarks/bookmarks_screen.dart';
import 'package:ve_news/presentation/articles/cubit/articles_cubit.dart';
import 'package:ve_news/presentation/articles/feed/feed_screen.dart';
import 'package:ve_news/presentation/quick_actions/cubit/quick_actions_cubit.dart';
import 'package:ve_news/presentation/quick_actions/quick_actions.dart';
import 'package:ve_news/presentation/summary/cubit/summary_cubit.dart';
import 'package:ve_news/presentation/summary/summary_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final selectedIndex = ValueNotifier<int>(0);
  late final pageController = PageController(
    initialPage: selectedIndex.value,
  );

  @override
  void initState() {
    selectedIndex.addListener(() {
      pageController.jumpToPage(selectedIndex.value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SummaryCubit>(create: (_) => getIt<SummaryCubit>()),
        BlocProvider<ArticlesCubit>(create: (_) => getIt<ArticlesCubit>()),
        BlocProvider<QuickActionsCubit>(create: (_) => getIt<QuickActionsCubit>()),
      ],
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            FeedScreen(
              changePage: changePage,
            ),
            const QuickActions(),
            const BookmarksScreen(),
            const SummaryScreen(),
            const AccountScreen(),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: selectedIndex,
          builder: (context, index, child) => DecoratedBox(
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
              padding: const EdgeInsets.only(
                top: AppDimens.size10,
                bottom: AppDimens.size30,
                left: AppDimens.size16,
                right: AppDimens.size16,
              ),
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
                    icon: FontAwesomeIcons.solidBookmark,
                    text: 'Bookmarks',
                  ),
                  GButton(
                    icon: FontAwesomeIcons.solidNewspaper,
                    text: 'Summary',
                  ),
                  GButton(
                    icon: FontAwesomeIcons.userAstronaut,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: index,
                onTabChange: (index) => selectedIndex.value = index,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
