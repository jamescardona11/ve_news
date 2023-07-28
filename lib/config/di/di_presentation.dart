import 'package:injectable/injectable.dart';
import 'package:ve_news/presentation/feed/cubit/feed_cubit.dart';
import 'package:ve_news/presentation/intro/cubit/intro_cubit.dart';
import 'package:ve_news/presentation/summary/cubit/summary_cubit.dart';

@module
abstract class PresentationModule {
  IntroCubit get introCubit;

  FeedCubit get feedCubit;

  SummaryCubit get summaryCubit;
}
