import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/domain/summary/export_summary.dart';
import 'package:ve_news/domain/summary/repository/audio_player_repository.dart';

part 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  final SummaryRepository _summaryRepository;
  final AudioPlayerRepository _audioPlayerRepository;

  SummaryCubit(this._summaryRepository, this._audioPlayerRepository) : super(const SummaryState()) {
    _init();
  }

  StreamSubscription<List<SummaryArticles>>? _summarySubscription;

  Stream<AudioPlayerState> get audioPlayerState => _audioPlayerRepository.audioPlayerState;

  int? _currentPlayingSummaryId;
  final Map<int, int> _mapIdIndex = {};
  int get _currentPlayingIndex => _mapIdIndex[_currentPlayingSummaryId]!;
  SummaryArticles get _currentPlayingSummary => state.summaries[_currentPlayingIndex];

  void onPlaySummaryPressed(SummaryArticles summary) {
    if (summary.voiceSummaryPath != null) {
      _onPlayAudio(summary);
    }
  }

  Future<void> _onPlayAudio(SummaryArticles composed) async {
    _currentPlayingSummaryId = composed.id;

    emit(state.copyWith(
      bottomBarState: BottomBarState.playing,
      currentPlayingSummaryId: _currentPlayingSummaryId,
    ));

    await _audioPlayerRepository.play(composed.id!, composed.voiceSummaryPath!);
  }

  void onMainActionPlayerPressed() {}

  void onNextMessagePlayerPressed() {}

  void onBackMessagePlayerPressed() {}

  Future<void> onSeekPlayerChanged(Duration position) async {
    await _audioPlayerRepository.seek(position);
  }

  @override
  Future<void> close() {
    _summarySubscription?.cancel();
    return super.close();
  }

  Future<void> _init() async {
    _summarySubscription = _summaryRepository.watch().listen((summaries) {
      emit(state.copyWith(summaries: summaries));

      for (int index = 0; index < summaries.length; index++) {
        _mapIdIndex[summaries[index].id!] = index;
      }
    });
  }
}
