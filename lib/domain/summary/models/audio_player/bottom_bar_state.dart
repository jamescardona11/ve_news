enum BottomBarState {
  playing(200),
  recording(500),
  normal(90);

  final double value;

  const BottomBarState(this.value);

  bool get isPlaying => this == playing;
  bool get isRecording => this == recording;
  bool get isNormal => this == normal;
}
