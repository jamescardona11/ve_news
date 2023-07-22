import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/domain/channel/repository/sources_repository.dart';
import 'package:ve_news/domain/channel/source_model.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  final SourcesRepository _sourcesRepository;

  FeedCubit(this._sourcesRepository) : super(const FeedState()) {
    _init();
  }

  StreamSubscription<List<SourceModel>>? _sourcesSubscription;

  @override
  Future<void> close() {
    _sourcesSubscription?.cancel();
    return super.close();
  }

  void _init() {
    _sourcesSubscription = _sourcesRepository.watch().listen((sources) {
      emit(state.copyWith(sources: sources));
    });
  }
}
