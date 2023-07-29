import 'dart:async';

import 'package:isar/isar.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/data/source/dto/source_dto.dart';
import 'package:ve_news/domain/source/repository/sources_repository.dart';
import 'package:ve_news/domain/source/source_model.dart';

final class SourcesRepositoryImpl extends SourcesRepository {
  final Isar _isar;

  SourcesRepositoryImpl(this._isar) {
    _sourceStore = _isar.sourceDtos;
    _initStream();
  }

  late IsarCollection<SourceDto> _sourceStore;
  final _sourcesController = BehaviorSubject<List<SourceModel>>.seeded([]);

  @override
  Stream<List<SourceModel>> watch() => _sourcesController.stream;

  @override
  Future<void> createDefaultSources() async {
    const initialSources = [
      SourceDto(id: 1, name: 'BBC', url: 'bbc.com', logo: AppAssets.bbcImg),
      SourceDto(id: 2, name: 'Bloomberg', url: 'bloomberg.com', logo: AppAssets.bloombergImg),
      SourceDto(id: 3, name: 'CNBC', url: 'cnbc.com', logo: AppAssets.cnbcImg),
      SourceDto(id: 4, name: 'CNN', url: 'cnn.com', logo: AppAssets.cnnImg),
      SourceDto(id: 5, name: 'Daily Mail', url: 'dailymail.co.uk', logo: AppAssets.dailyMailImg, isEnabled: false),
      SourceDto(id: 6, name: 'Forbes', url: 'forbes.com', logo: AppAssets.forbesImg),
      SourceDto(id: 7, name: 'FoxNews', url: 'foxnews.com', logo: AppAssets.foxNewsImg),
      SourceDto(id: 8, name: 'MSN', url: 'msn.com', logo: AppAssets.msnImg),
      SourceDto(id: 9, name: 'NYPost', url: 'nypost.com', logo: AppAssets.newYorkPostImg),
      SourceDto(id: 10, name: 'News18', url: 'news18.com', logo: AppAssets.news18Img),
      SourceDto(id: 11, name: 'The Guardian', url: 'theguardian.com', logo: AppAssets.theGuardianImg),
      SourceDto(id: 12, name: 'NYTimes', url: 'nytimes.com', logo: AppAssets.theNewYorkTimesImg),
      SourceDto(id: 13, name: 'The Sun', url: 'thesun.co.uk', logo: AppAssets.theSunImg, isEnabled: false),
      SourceDto(id: 14, name: 'Usa Today', url: 'usatoday.com', logo: AppAssets.usaTodayImg),
      SourceDto(id: 15, name: 'Washington Post', url: 'washingtonpost.com', logo: AppAssets.washingtonPostImg),
      SourceDto(id: 16, name: 'Yahoo News', url: 'news.yahoo.com', logo: AppAssets.yahooNewsImg),
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
