import 'package:ve_news/domain/source/source_model.dart';

abstract interface class SourcesRepository {
  Stream<List<SourceModel>> watch();

  Future<void> createDefaultSources();
}
