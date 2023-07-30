import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ve_news/cross/presentation/presentation.dart';
import 'package:ve_news/presentation/articles/components/articles_list.dart';
import 'package:ve_news/presentation/articles/components/sources_list.dart';
import 'package:ve_news/presentation/articles/cubit/articles_cubit.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) => VeNewsScaffold(
        title: 'VeNews',
        iconLeft: FontAwesomeIcons.inbox,
        iconRight: FontAwesomeIcons.magnifyingGlass,
        onRightTap: () {},
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
