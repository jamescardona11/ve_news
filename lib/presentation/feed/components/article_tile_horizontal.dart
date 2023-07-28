import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';
import 'package:ve_news/cross/presentation/presentation.dart';
import 'package:ve_news/cross/presentation/widgets/network_image_with_loader.dart';
import 'package:ve_news/cross/presentation/widgets/round_container.dart';
import 'package:ve_news/cross/utils/date_utils.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/presentation/feed/cubit/feed_cubit.dart';

class ArticleTileHorizontal extends StatelessWidget {
  const ArticleTileHorizontal({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Row(
      children: [
        if (article.image != null)
          BlocSelector<FeedCubit, FeedState, bool>(
            selector: (state) {
              return state.summary?.articles.contains(article.id) ?? false;
            },
            builder: (context, wasAdded) {
              return Expanded(
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.1,
                      child: NetworkImageWithLoader(article.image!),
                    ),
                    const SizedBox(height: AppDimens.size4),
                    BounceWrapper(
                      onPressed: () {
                        if (wasAdded) {
                          context.read<FeedCubit>().removeArticleToSummary(article);
                        } else {
                          context.read<FeedCubit>().addArticleToSummary(article);
                        }
                      },
                      child: RoundContainer(
                        width: double.maxFinite,
                        height: AppDimens.size24,
                        border: AppDimens.size10,
                        color: wasAdded ? AppColors.primary : AppColors.white,
                        child: Center(
                          child: Text(
                            !wasAdded ? 'Add' : 'Remove',
                            style: textTheme.bodyMedium!.copyWith(color: wasAdded ? AppColors.white : AppColors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        const SizedBox(width: AppDimens.defaultPadding),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.source.name,
                  style: textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                Text(
                  article.title,
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      article.category,
                      style: textTheme.category,
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.circle,
                      size: 4,
                      color: AppColors.grey50,
                    ),
                    const SizedBox(width: 10),
                    if (article.dateTime != null) Text(AppDateUtils.timeAgo(article.dateTime!), style: textTheme.timeAgo),
                  ],
                )
              ],
            ))
      ],
    );
  }
}
