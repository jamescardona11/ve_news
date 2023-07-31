part of 'new_summary_cubit.dart';

class NewSummaryState extends Equatable {
  final SummaryArticles? summary;
  final bool isLoading;
  final String loadingMessage;

  const NewSummaryState({
    this.summary,
    this.isLoading = false,
    this.loadingMessage = '',
  });

  @override
  List<Object?> get props => [
        summary,
        isLoading,
      ];

  NewSummaryState copyWith({
    SummaryArticles? summary,
    bool? isLoading,
    String? loadingMessage,
  }) {
    return NewSummaryState(
      summary: summary ?? this.summary,
      isLoading: isLoading ?? this.isLoading,
      loadingMessage: loadingMessage ?? this.loadingMessage,
    );
  }
}
