class AudioPlayerState {
  final int summaryId;
  final int articleIndex;
  final bool isPlaying;
  final Duration? duration;
  final Duration position;
  final Duration bufferPosition;
  final AudioPlayerProcessingState processingState;

  AudioPlayerState({
    required this.summaryId,
    this.articleIndex = -1,
    this.isPlaying = false,
    this.duration,
    this.position = Duration.zero,
    this.bufferPosition = Duration.zero,
    this.processingState = AudioPlayerProcessingState.notReady,
  });
}

enum AudioPlayerProcessingState {
  notReady,
  ready,
  completed,
}
