import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/navigation/app_router.dart';
import 'package:ve_news/presentation/articles/components/articles_list.dart';
import 'package:ve_news/presentation/articles/components/sources_list.dart';
import 'package:ve_news/presentation/articles/cubit/articles_cubit.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key, required this.changePage}) : super(key: key);

  final ValueChanged<int> changePage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) => VeNewsScaffold(
        title: 'VeNews',
        // iconLeft: FontAwesomeIcons.inbox,
        iconRight: state.summary?.isNotEmpty ?? false ? FontAwesomeIcons.inbox : null,
        showLeftNotification: state.summary?.isNotEmpty ?? false,
        onRightTap: () async {
          final result = await GoRouter.of(context).push(AppRouter.newSummary);
          if (result == true) {
            changePage(3);
          }
        },
        onLeftTap: () {},
        body: Column(
          children: [
            SizedBox(
              height: 85,
              child: SourcesList(sources: state.sourcesWithResults),
            ),
            Expanded(child: ArticlesList(articles: state.articles)),
          ],
        ),
      ),
    );
  }
}
