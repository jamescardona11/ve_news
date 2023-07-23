import 'dart:async';

import 'package:isar/isar.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/data/source/dto/isar_source_dto.dart';
import 'package:ve_news/domain/source/repository/sources_repository.dart';
import 'package:ve_news/domain/source/source_model.dart';

final class SourcesRepositoryImpl extends SourcesRepository {
  final Isar _isar;

  SourcesRepositoryImpl(this._isar) {
    _sourceStore = _isar.isarSourceDtos;
    _initStream();
  }

  late IsarCollection<IsarSourceDto> _sourceStore;
  final _sourcesController = BehaviorSubject<List<SourceModel>>.seeded([]);

  @override
  Stream<List<SourceModel>> watch() => _sourcesController.stream;

  @override
  Future<void> createDefaultSources() async {
    final initialSources = [
      IsarSourceDto(id: 1, name: 'BBC', url: 'bbc.com', logo: AppAssets.sources.bbcImg),
      IsarSourceDto(id: 2, name: 'Bloomberg', url: 'bloomberg.com', logo: AppAssets.sources.bloombergImg),
      IsarSourceDto(id: 3, name: 'CNBC', url: 'cnbc.com', logo: AppAssets.sources.cnbcImg),
      IsarSourceDto(id: 4, name: 'CNN', url: 'cnn.com', logo: AppAssets.sources.cnnImg),
      IsarSourceDto(id: 5, name: 'Daily Mail', url: 'dailymail.co.uk', logo: AppAssets.sources.dailyMailImg, isEnabled: false),
      IsarSourceDto(id: 6, name: 'Forbes', url: 'forbes.com', logo: AppAssets.sources.forbesImg),
      IsarSourceDto(id: 7, name: 'FoxNews', url: 'foxnews.com', logo: AppAssets.sources.foxNewsImg),
      IsarSourceDto(id: 8, name: 'MSN', url: 'msn.com', logo: AppAssets.sources.msnImg),
      IsarSourceDto(id: 9, name: 'NYPost', url: 'nypost.com', logo: AppAssets.sources.newYorkPostImg),
      IsarSourceDto(id: 10, name: 'News18', url: 'news18.com', logo: AppAssets.sources.news18Img),
      IsarSourceDto(id: 11, name: 'The Guardian', url: 'theguardian.com', logo: AppAssets.sources.theGuardianImg),
      IsarSourceDto(id: 12, name: 'NYTimes', url: 'nytimes.com', logo: AppAssets.sources.theNewYorkTimesImg),
      IsarSourceDto(id: 13, name: 'The Sun', url: 'thesun.co.uk', logo: AppAssets.sources.theSunImg, isEnabled: false),
      IsarSourceDto(id: 14, name: 'Usa Today', url: 'usatoday.com', logo: AppAssets.sources.usaTodayImg),
      IsarSourceDto(id: 15, name: 'Washington Post', url: 'washingtonpost.com', logo: AppAssets.sources.washingtonPostImg),
      IsarSourceDto(id: 16, name: 'Yahoo News', url: 'news.yahoo.com', logo: AppAssets.sources.yahooNewsImg),
    ];

    await _isar.writeTxn(() async {
      await _sourceStore.putAll(initialSources);
    });
  }

  void _initStream() {
    safeSubscribe(_sourceStore
        .filter()
        .isEnabledEqualTo(true)
        .sortByIsFavorite()
        .build()
        .watch(fireImmediately: true)
        .map((event) => event.map((e) => e.toModel()))
        .listen((sources) {
      _sourcesController.add(sources.toList());
    }));
  }

  @override
  Future<List<SourceModel>> readAllEnabled() async {
    final result = await _sourceStore.filter().isEnabledEqualTo(true).build().findAll();
    return result.map((e) => e.toModel()).toList();
  }
}
