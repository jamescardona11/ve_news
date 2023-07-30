part of 'summary_cubit.dart';

class SummaryState extends Equatable {
  final List<SummaryArticles> summaries;

  const SummaryState({
    this.summaries = const [],
  });

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
