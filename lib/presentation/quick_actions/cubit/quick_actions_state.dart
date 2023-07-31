// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quick_actions_cubit.dart';

class QuickActionsState extends Equatable {
  final List<ArticleModel> articles;
  final bool isLoading;
  final String loadingMessage;

  const QuickActionsState({
    this.articles = const [],
    this.isLoading = false,
    this.loadingMessage = '',
  });

  @override
  List<Object> get props => [];

  QuickActionsState copyWith({
    List<ArticleModel>? articles,
    bool? isLoading,
    String? loadingMessage,
  }) {
    return QuickActionsState(
      articles: articles ?? this.articles,
      isLoading: isLoading ?? this.isLoading,
      loadingMessage: loadingMessage ?? this.loadingMessage,
    );
  }
}
