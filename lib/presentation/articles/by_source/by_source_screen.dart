import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/di/di.dart';
import 'package:ve_news/domain/source/source_model.dart';
import 'package:ve_news/presentation/articles/components/articles_list.dart';
import 'package:ve_news/presentation/articles/cubit/articles_cubit.dart';

class BySourceScreen extends StatelessWidget {
  const BySourceScreen({
    Key? key,
    required this.source,
  }) : super(key: key);

  final SourceModel source;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ArticlesCubit>(
        param1: source,
      ),
      child: BlocBuilder<ArticlesCubit, ArticlesState>(
        builder: (context, state) => VeNewsScaffold(
          title: source.name,
          iconLeft: FontAwesomeIcons.chevronLeft,
          onLeftTap: () {
            Navigator.pop(context);
          },
          body: Column(
            children: [
              SourceLogo(
                source: source,
                showName: false,
                size: 80,
              ),
              Expanded(
                child: ArticlesList(articles: state.articles),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
