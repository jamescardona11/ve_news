import 'package:collection/collection.dart';
import 'package:isar/isar.dart';
import 'package:projectile/projectile.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ve_news/config/environment/env.dart';
import 'package:ve_news/config/environment/url_routes.dart';
import 'package:ve_news/cross/utils/date_utils.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/source/repository/sources_repository.dart';
import 'package:ve_news/domain/source/source_model.dart';

import 'dto/isar_article_dto.dart';

final class ArticlesRepositoryImpl extends ArticlesRepository {
  final Isar _isar;
  final Projectile _projectile;
  final SourcesRepository _sourcesRepository;

  ArticlesRepositoryImpl(this._isar, this._projectile, this._sourcesRepository) {
    _articleStore = _isar.isarArticleDtos;
  }

  int _page = 0;
  late final IsarCollection<IsarArticleDto> _articleStore;

  @override
  Future<void> fetchTodayArticles() async {
    _page = 0;
    await fetchNewArticles();
    await removeAllArticles();
  }

  // TODO (james):
  // change the now and yesterday to be local variables
  // reason: if a person is looking cache and go to the end we are fetch new article from today
  @override
  Future<void> fetchNewArticles() async {
    final sourcesMap = _sourcesRepository.readAllEnabled().map((e) => {'sourceUri': e.url}).toList();

    final now = DateUtils.nowStringFormat();
    final yesterday = DateUtils.yesterdayStringFormat();

    final result = await _projectile.create(
      target: UrlRoutes.getArticles,
      method: Method.POST,
      body: {
        'query': {
          '\$query': {
            '\$and': [
              {'\$or': sourcesMap},
              {
                'dateStart': yesterday,
                'dateEnd': now,
                'lang': 'eng',
              }
            ]
          }
        },
        'resultType': 'articles',
        'articlesPage': ++_page,
        'articlesCount': 100,
        'articlesSortBy': 'date',
        'includeArticleConcepts': true,
        'includeArticleCategories': true,
        'includeArticleImage': true,
        'includeArticleLinks': true,
        'dataType': 'news',
        'apiKey': Env.newsKEY,
      },
    ).fire();

    if (result.isSuccess) {}
  }

  @override
  Future<void> removeAllArticles() =>
      _articleStore.filter().dateTimeLessThan(DateTime.now().subtract(const Duration(hours: 24))).deleteAll();

  @override
  Stream<List<ArticleModel>> watch() {
    return CombineLatestStream.combine2(
      _articleStore.where().sortByDateTime().watch(fireImmediately: true),
      _sourcesRepository.watch(),
      (List<IsarArticleDto> articles, List<SourceModel> sources) => articles
          .map((article) {
            final source = sources.firstWhereOrNull((source) => source.id == article.sourceId);
            if (source == null) return null;
            return article.toModel(source);
          })
          .whereNotNull()
          .toList(),
    );
  }
}
