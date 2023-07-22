part of 'feed_cubit.dart';

class FeedState extends Equatable {
  final List<SourceModel> sources;

  const FeedState({
    this.sources = const [],
  });

  @override
  List<Object> get props => [sources];

  FeedState copyWith({
    List<SourceModel>? sources,
  }) {
    return FeedState(
      sources: sources ?? this.sources,
    );
  }
}
