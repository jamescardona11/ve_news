import 'package:isar/isar.dart';
import 'package:projectile/projectile.dart';
import 'package:ve_news/data/summary/dto/isar_summary_dto.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';
import 'package:ve_news/domain/summary/summary.dart';

final class SummaryRepositoryImpl extends SummaryRepository {
  final Isar _isar;
  final Projectile _projectile;

  SummaryRepositoryImpl(this._isar, this._projectile) {
    _summaryStore = _isar.isarSummaryArticlesDtos;
  }

  late final IsarCollection<IsarSummaryArticlesDto> _summaryStore;

  @override
  Stream<List<SummaryArticles>> watch() =>
      _summaryStore.where().sortByDateTime().watch(fireImmediately: true).map((event) => event.map((e) => e.toModel()).toList());

  @override
  Future<SummaryArticles> readLastUncompletedOrNew() async {
    final summary = await _summaryStore.where().filter().isCompletedEqualTo(false).findFirst();
    if (summary != null) {
      return summary.toModel();
    } else {
      final dto = IsarSummaryArticlesDto();
      final id = await _isar.writeTxn(() {
        return _summaryStore.put(dto);
      });

      return dto.toModel(id);
    }
  }

  @override
  Future<void> update(SummaryArticles summary) async {
    final dto = IsarSummaryArticlesDto.fromModel(summary);
    await _isar.writeTxn(() => _summaryStore.put(dto));
  }

  @override
  Future<void> delete(int summaryId) {
    return _isar.writeTxn(() => _summaryStore.delete(summaryId));
  }

  @override
  Future<void> deleteAll() async {
    await _isar.writeTxn(() => _summaryStore.where().build().deleteAll());
  }
}