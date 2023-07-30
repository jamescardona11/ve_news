import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/common/presentation/empty_widget.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/di/di.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/presentation/articles/components/articles_list.dart';
import 'package:ve_news/presentation/articles/cubit/articles_cubit.dart';

// https://github.com/mkathiravan/flutter_search/blob/main/lib/HomePage.dart
// https://stackoverflow.com/questions/61575049/how-to-custom-appbar-style-inside-searchdelegate
class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ArticlesCubit>()..initBookMarks(),
      child: const _BookmarksView(),
    );
  }
}

class _BookmarksView extends StatelessWidget {
  const _BookmarksView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) => VeNewsScaffold(
        title: 'Bookmarks',
        onRightTap: () {},
        body: state.articles.isEmpty
            ? const EmptyWidget(label: 'bookmarks')
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
                    child: RoundContainer(
                      // height: 100,
                      width: double.maxFinite,
                      showDefaultShadow: true,
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text('#Bookmarks: 20')),
                      ),
                    ),
                  ),
                  Expanded(child: ArticlesList(articles: state.articles)),
                ],
              ),
      ),
    );
  }
}
