part of 'summary_cubit.dart';

class SummaryState extends Equatable {
  final List<SummaryArticles> summaries;
  final BottomBarState bottomBarState;
  final int? currentPlayingSummaryId;

  const SummaryState({
    this.summaries = const [],
    this.bottomBarState = BottomBarState.normal,
    this.currentPlayingSummaryId,
  });

  @override
  List<Object?> get props => [
        summaries,
        bottomBarState,
        currentPlayingSummaryId,
      ];

  SummaryState copyWith({
    List<SummaryArticles>? summaries,
    BottomBarState? bottomBarState,
    int? currentPlayingSummaryId,
  }) {
    return SummaryState(
      summaries: summaries ?? this.summaries,
      bottomBarState: bottomBarState ?? this.bottomBarState,
      currentPlayingSummaryId: currentPlayingSummaryId ?? this.currentPlayingSummaryId,
    );
  }
}
