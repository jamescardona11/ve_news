import 'package:injectable/injectable.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/source/repository/sources_repository.dart';
import 'package:ve_news/domain/source/source_model.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';
import 'package:ve_news/domain/summary/use_cases/remove_article_use_case.dart';
import 'package:ve_news/presentation/articles/cubit/articles_cubit.dart';
import 'package:ve_news/presentation/intro/cubit/intro_cubit.dart';
import 'package:ve_news/presentation/quick_actions/cubit/quick_actions_cubit.dart';
import 'package:ve_news/presentation/summary/cubit/new_summary_cubit.dart';
import 'package:ve_news/presentation/summary/cubit/summary_cubit.dart';

@module
abstract class PresentationModule {
  IntroCubit get introCubit;

  ArticlesCubit articlesCubit({
    required SourcesRepository sourcesRepository,
    required ArticlesRepository articlesRepository,
    required SummaryRepository summaryRepository,
    required RemoveArticleUseCase removeArticleUseCase,
    @factoryParam SourceModel? sourceFilter,
  }) =>
      ArticlesCubit(
        sourcesRepository,
        articlesRepository,
        summaryRepository,
        removeArticleUseCase,
        sourceFilter: sourceFilter,
      );

  SummaryCubit get summaryCubit;

  NewSummaryCubit get newSummaryCubit;

  QuickActionsCubit get quickActionsCubit;
}
