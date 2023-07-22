import 'package:ve_news/domain/source/source_model.dart';

abstract base class SourcesRepository {
  Stream<List<SourceModel>> watch();

  Future<void> createDefaultSources();
}
