part of 'new_summary_cubit.dart';

class NewSummaryState extends Equatable {
  final SummaryArticles? summary;
  final int summaryPercentage;

  const NewSummaryState({
    this.summary,
    this.summaryPercentage = 90,
  });

  @override
  List<Object?> get props => [
        summary,
        summaryPercentage,
      ];

  NewSummaryState copyWith({
    SummaryArticles? summary,
    int? summaryPercentage,
  }) {
    return NewSummaryState(
      summary: summary ?? this.summary,
      summaryPercentage: summaryPercentage ?? this.summaryPercentage,
    );
  }
}
