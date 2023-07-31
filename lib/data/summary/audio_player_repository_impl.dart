import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ve_news/domain/summary/export_summary.dart';
import 'package:ve_news/domain/summary/repository/audio_player_repository.dart';

class AudioPlayerRepositoryImpl implements AudioPlayerRepository {
  final player = AudioPlayer();
  int? messageId;

  @override
  Future<void> play(SummaryArticles summary) async {
    if (player.playing) await stop();

    messageId = summary.id;
    await player.setFilePath(summary.voiceSummaryPath!);

    await player.play();
  }

  @override
  Future<void> stop() async {
    messageId = null;
    await player.stop();
  }

  @override
  Future<void> pause() async {
    if (player.playing) {
      await player.pause();
    } else {
      await player.play();
    }
  }

  @override
  Future<void> seek(Duration position) async {
    await player.seek(position);
  }

  @override
  Future<bool> seekToNext() async {
    final hasNext = player.hasNext;
    await player.seekToNext();

    return hasNext;
  }

  @override
  Future<bool> seekToPrevious() async {
    final hasPrevious = player.hasNext;
    await player.seekToPrevious();

    return hasPrevious;
  }

  @override
  Stream<AudioPlayerState> get audioPlayerState => CombineLatestStream.combine4(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        player.playerStateStream,
        (Duration position, Duration buffered, Duration? duration, PlayerState state) {
          return messageId != null
              ? AudioPlayerState(
                  messageId: messageId!,
                  isPlaying: state.playing,
                  processingState: _mapToAudioPlayerProcessingState(state.processingState),
                  position: position,
                  bufferPosition: buffered,
                  duration: duration,
                )
              : null;
        },
      ).mapNotNull((audio) => audio);

  AudioPlayerProcessingState _mapToAudioPlayerProcessingState(ProcessingState state) {
    switch (state) {
      case ProcessingState.idle:
      case ProcessingState.loading:
      case ProcessingState.buffering:
        return AudioPlayerProcessingState.notReady;

      case ProcessingState.ready:
        return AudioPlayerProcessingState.ready;

      case ProcessingState.completed:
        return AudioPlayerProcessingState.completed;
    }
  }
}
