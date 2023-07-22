import 'package:isar/isar.dart';
import 'package:projectile/projectile.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';

import 'dto/isar_article_dto.dart';

final class ArticlesRepositoryImpl extends ArticlesRepository {
  final Isar _isar;
  final Projectile _projectile;

  ArticlesRepositoryImpl(this._isar, this._projectile) {
    _articleStore = _isar.isarArticleDtos;
  }

  late final IsarCollection<IsarArticleDto> _articleStore;

  @override
  Future<void> fetchNewArticles() async {
    await _projectile
        .create(
          target: '/articles',
          method: Method.POST,
        )
        .fire();
  }

  @override
  Future<void> removeAllArticles() => _articleStore.clear();

  @override
  Stream<List<ArticleModel>> watch() {
    return _articleStore.where().sortByDateTime().watch(fireImmediately: true).map((event) => event.map((e) => e.toModel()).toList());
  }
}
