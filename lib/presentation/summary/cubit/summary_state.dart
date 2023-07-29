part of 'summary_cubit.dart';

class SummaryState extends Equatable {
  final List<SummaryArticles> summaries;

  const SummaryState({
    this.summaries = const [],
  });

  List<Category> get categories =>
      summaries.map((e) => e.articles.map((e) => e.categories).expand((element) => element).toList()).expand((element) => element).toList();

  @override
  List<Object> get props => [summaries];

  SummaryState copyWith({
    List<SummaryArticles>? summaries,
  }) {
    return SummaryState(
      summaries: summaries ?? this.summaries,
    );
  }
}
