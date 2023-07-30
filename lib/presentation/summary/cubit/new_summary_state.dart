part of 'new_summary_cubit.dart';

class NewSummaryState extends Equatable {
  final SummaryArticles? summary;

  const NewSummaryState({
    this.summary,
  });

  @override
  List<Object?> get props => [
        summary,
      ];

  NewSummaryState copyWith({
    SummaryArticles? summary,
  }) {
    return NewSummaryState(
      summary: summary ?? this.summary,
    );
  }
}
