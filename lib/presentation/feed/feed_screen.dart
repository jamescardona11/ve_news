import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/presentation/feed/cubit/feed_cubit.dart';

import 'components/articles_list.dart';
import 'components/sources_list.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      builder: (context, state) => Column(
        children: [
          SizedBox(
            height: 85,
            child: SourcesList(sources: state.sources),
          ),
          Expanded(child: ArticlesList(articles: state.articles)),
        ],
      ),
    );
  }
}
