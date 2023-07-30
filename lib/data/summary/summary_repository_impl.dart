import 'package:isar/isar.dart';
import 'package:projectile/projectile.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ve_news/data/summary/dto/summary_dto.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';
import 'package:ve_news/domain/summary/summary.dart';

final class SummaryRepositoryImpl extends SummaryRepository {
  final Isar _isar;
  final Projectile _projectile;
  final ArticlesRepository _articlesRepository;

  SummaryRepositoryImpl(
    this._isar,
    this._projectile,
    this._articlesRepository,
  ) {
    _summaryStore = _isar.summaryArticlesDtos;
    _readUncompletedSummary();
  }

  late final IsarCollection<SummaryArticlesDto> _summaryStore;
  final _lastSummaryController = BehaviorSubject<SummaryArticles>();

  @override
  Stream<List<SummaryArticles>> watch() =>
      _summaryStore.where().sortByDateTime().watch(fireImmediately: true).asyncMap((summariesDtos) async {
        final result = <SummaryArticles>[];
        for (var summary in summariesDtos) {
          final articles = await _articlesRepository.readByIds(summary.articles);
          result.add(
            SummaryArticles(
              id: summary.id,
              articles: articles,
              isCompleted: summary.isCompleted,
              isCreatingVoiceSummary: summary.isCreatingVoiceSummary,
              voiceSummaryPath: summary.voiceSummaryPath,
            ),
          );
        }
        return result;
      });

  @override
  Stream<SummaryArticles> watchLastUncompleted() => _lastSummaryController;

  @override
  Future<void> update(SummaryArticles summary) async {
    final dto = SummaryArticlesDto.fromModel(summary);
    await _isar.writeTxn(() => _summaryStore.put(dto));

    _lastSummaryController.add(summary);
  }

  @override
  Future<void> delete(int summaryId) {
    return _isar.writeTxn(() => _summaryStore.delete(summaryId));
  }

  @override
  Future<void> deleteAll() async {
    await _isar.writeTxn(() => _summaryStore.where().build().deleteAll());
  }

  Future<void> _readUncompletedSummary() async {
    final summary = await _summaryStore.where().filter().isCompletedEqualTo(false).findFirst();
    if (summary != null) {
      final articles = await _articlesRepository.readByIds(summary.articles);
      _lastSummaryController.add(summary.toModel().copyWith(articles: articles));
    } else {
      final dto = SummaryArticlesDto();
      final id = await _isar.writeTxn(() {
        return _summaryStore.put(dto);
      });

      final articles = await _articlesRepository.readByIds(dto.articles);

      _lastSummaryController.add(dto.toModel(id).copyWith(articles: articles));
    }
  }
}
