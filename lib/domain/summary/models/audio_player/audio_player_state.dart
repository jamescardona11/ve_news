class AudioPlayerState {
  final int messageId;
  final bool isPlaying;
  final Duration? duration;
  final Duration position;
  final Duration bufferPosition;
  final AudioPlayerProcessingState processingState;

  AudioPlayerState({
    required this.messageId,
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
