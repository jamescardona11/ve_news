part of 'summary_cubit.dart';

class SummaryState extends Equatable {
  const SummaryState({
    this.summaries = const [],
  });

  final List<SummaryArticles> summaries;

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
