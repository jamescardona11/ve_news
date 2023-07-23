import 'package:ve_news/core/data/data.dart';
import 'package:ve_news/domain/source/source_model.dart';

abstract base class SourcesRepository with BaseSubscriptionMixin {
  Stream<List<SourceModel>> watch();

  Future<List<SourceModel>> readAllEnabled();

  Future<void> createDefaultSources();
}
