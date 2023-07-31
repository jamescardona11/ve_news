import 'dart:async';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ve_news/core/logger/logger.dart';
import 'package:ve_news/domain/article/article_model.dart';
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

  Stream<AudioPlayerState> get audioPlayerState => _audioPlayerRepository.audioPlayerState.doOnData((event) {
        logger.d(event.toString());
      });

  int? _currentPlayingSummaryId;
  final Map<int, int> _mapIdIndex = {};

  Future<void> onPlaySummaryPressed(SummaryArticles summary) async {
    _currentPlayingSummaryId = summary.id;
    emit(state.copyWith(currentPlayingSummaryId: _currentPlayingSummaryId));

    await _audioPlayerRepository.play(summary);
  }

  Future<void> onClosePlayerPressed() async {
    emit(state.copyWith(currentPlayingSummaryId: -1));

    await _audioPlayerRepository.stop();
  }

  Future<void> onMainActionPlayerPressed() async {
    if (state.notCurrent) return;

    await _audioPlayerRepository.pause();
  }

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
