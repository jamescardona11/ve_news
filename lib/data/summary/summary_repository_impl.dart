import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:projectile/projectile.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ve_news/config/environment/env.dart';
import 'package:ve_news/config/environment/url_routes.dart';
import 'package:ve_news/core/errors/app_error.dart';
import 'package:ve_news/core/logger/logger.dart';
import 'package:ve_news/data/summary/dto/chat_gpt_response_dto.dart';
import 'package:ve_news/data/summary/dto/summary_dto.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/summary/chat_gpt_request.dart';
import 'package:ve_news/domain/summary/chat_gpt_response.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';
import 'package:ve_news/domain/summary/summary.dart';

import 'dto/chat_gpt_request_dto.dart';

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
  Future<Either<AppError, ChatGptResponse>> sendQuestion(ChatGptRequest request) async {
    final dto = ChatGptRequestDto.fromDomain(request);

    final response = await _projectile
        .request(
          ProjectileRequest(
            method: Method.POST,
            target: UrlRoutes.gptCompletions,
            headers: {
              HeadersKeys.authorization: 'Bearer ${Env.openAIKey}',
              HeadersKeys.contentType: ContentType.json,
            },
            body: dto.toJson(),
          ),
        )
        .fire();

    if (response.isFailure) {
      logger.e('SendQuestion error', error: response.error);
      return left(HttpResponseError(source: response.errorString, err: response.error));
    }

    return right(ChatGptResponseDto.fromJson(response.data).toDomain());
  }

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
