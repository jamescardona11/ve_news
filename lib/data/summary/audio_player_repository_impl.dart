import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ve_news/domain/summary/export_summary.dart';
import 'package:ve_news/domain/summary/repository/audio_player_repository.dart';

class AudioPlayerRepositoryImpl implements AudioPlayerRepository {
  final player = AudioPlayer();
  int? elementId;

  @override
  Future<void> play(SummaryArticles summary) async {
    if (player.playing) await stop();
    elementId = summary.id;

    final playlist = ConcatenatingAudioSource(
        children: summary.resumeArticles.where((element) => element.path != null).map((e) => AudioSource.file(e.path!)).toList());

    await player.setAudioSource(playlist);

    if (playlist.children.isNotEmpty) await player.play();
  }

  @override
  Future<void> stop() async {
    elementId = null;
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
  Stream<AudioPlayerState> get audioPlayerState => CombineLatestStream.combine5(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        player.playerStateStream,
        player.sequenceStateStream,
        (Duration position, Duration buffered, Duration? duration, PlayerState state, SequenceState? sequenceState) {
          return elementId != null
              ? AudioPlayerState(
                  summaryId: elementId!,
                  articleIndex: sequenceState?.currentIndex ?? -1,
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
