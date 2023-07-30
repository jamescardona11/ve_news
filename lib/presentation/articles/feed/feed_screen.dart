import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/di/di.dart';
import 'package:ve_news/config/navigation/app_router.dart';
import 'package:ve_news/presentation/articles/components/articles_list.dart';
import 'package:ve_news/presentation/articles/components/sources_list.dart';
import 'package:ve_news/presentation/articles/cubit/articles_cubit.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ArticlesCubit>()..initFeedItems(),
      child: const _FeedView(),
    );
  }
}

class _FeedView extends StatelessWidget {
  const _FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) => VeNewsScaffold(
        title: 'VeNews',
        iconLeft: FontAwesomeIcons.inbox,
        iconRight: FontAwesomeIcons.magnifyingGlass,
        onRightTap: () {},
        onLeftTap: () {
          context.push(AppRouter.newSummary);
        },
        body: Column(
          children: [
            SizedBox(
              height: 85,
              child: SourcesList(sources: state.sources),
            ),
            Expanded(child: ArticlesList(articles: state.articles)),
          ],
        ),
      ),
    );
  }
}
