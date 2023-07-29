import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/presentation/articles/components/articles_list.dart';
import 'package:ve_news/presentation/articles/cubit/articles_cubit.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) => Column(
        children: [
          Expanded(child: ArticlesList(articles: state.articles)),
        ],
      ),
    );
  }
}
