import 'package:ve_news/domain/summary/export_summary.dart';

abstract interface class AudioPlayerRepository {
  Future<void> play(SummaryArticles summary);

  Future<void> stop();

  Future<void> pause();

  Future<void> seek(Duration position);

  Future<bool> seekToNext();

  Future<bool> seekToPrevious();

  Stream<AudioPlayerState> get audioPlayerState;
}
