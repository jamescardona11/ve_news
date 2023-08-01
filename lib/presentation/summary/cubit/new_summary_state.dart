part of 'new_summary_cubit.dart';

class NewSummaryState extends Equatable {
  final SummaryArticles? summary;
  final bool isLoading;
  final String loadingMessage;
  final bool isDone;

  const NewSummaryState({
    this.summary,
    this.isLoading = false,
    this.loadingMessage = '',
    this.isDone = false,
  });

  @override
  List<Object?> get props => [
        summary,
        isLoading,
        loadingMessage,
        isDone,
      ];

  NewSummaryState copyWith({
    SummaryArticles? summary,
    bool? isLoading,
    String? loadingMessage,
    bool? isDone,
  }) {
    return NewSummaryState(
      summary: summary ?? this.summary,
      isLoading: isLoading ?? this.isLoading,
      loadingMessage: loadingMessage ?? this.loadingMessage,
      isDone: isDone ?? this.isDone,
    );
  }
}
