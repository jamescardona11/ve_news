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
  Future<void> readNewArticles() {
    // TODO: implement readNewArticles
    throw UnimplementedError();
  }

  @override
  Future<void> removeAllArticles() {
    // TODO: implement removeAllArticles
    throw UnimplementedError();
  }

  @override
  Stream<List<ArticleModel>> watch() {
    // TODO: implement watch
    throw UnimplementedError();
  }
}
