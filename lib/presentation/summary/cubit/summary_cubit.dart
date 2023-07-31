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
    });
  }
}
