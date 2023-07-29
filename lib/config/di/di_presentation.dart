import 'package:injectable/injectable.dart';
import 'package:ve_news/presentation/articles/cubit/articles_cubit.dart';
import 'package:ve_news/presentation/intro/cubit/intro_cubit.dart';
import 'package:ve_news/presentation/summary/cubit/summary_cubit.dart';

@module
abstract class PresentationModule {
  IntroCubit get introCubit;

  ArticlesCubit get articlesCubit;

  SummaryCubit get summaryCubit;
}
