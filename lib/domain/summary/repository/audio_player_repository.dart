import 'package:ve_news/domain/summary/export_summary.dart';

abstract interface class AudioPlayerRepository {
  Future<void> play(int id, String path);

  Future<void> stop();

  Future<void> pause();

  Future<void> seek(Duration position);

  Stream<AudioPlayerState> get audioPlayerState;
}
