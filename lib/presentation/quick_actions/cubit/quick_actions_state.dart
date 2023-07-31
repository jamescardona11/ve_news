// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quick_actions_cubit.dart';

class QuickActionsState extends Equatable {
  final List<ArticleModel> articles;

  const QuickActionsState({this.articles = const []});

  @override
  List<Object> get props => [];

  QuickActionsState copyWith({
    List<ArticleModel>? articles,
  }) {
    return QuickActionsState(
      articles: articles ?? this.articles,
    );
  }
}
