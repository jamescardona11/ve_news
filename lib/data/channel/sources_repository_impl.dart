import 'package:isar/isar.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/data/channel/dto/isar_source_dto.dart';
import 'package:ve_news/domain/channel/repository/sources_repository.dart';
import 'package:ve_news/domain/channel/source_model.dart';

final class SourcesRepositoryImpl extends SourcesRepository {
  final Isar _isar;

  SourcesRepositoryImpl(this._isar) {
    _isarStore = _isar.isarSourceDtos;
  }

  late IsarCollection<IsarSourceDto> _isarStore;

  @override
  Stream<List<SourceModel>> watch() {
    final filter = _isarStore.where().filter().isEnabledEqualTo(true).sortByIsFavorite().build();
    return filter.watch().map((event) => event.map((e) => e.toModel()).toList());
  }

  @override
  Future<void> createDefaultSources() async {
    final initialSources = [
      IsarSourceDto.create(name: 'BBC', url: 'bbc.com', logo: AppAssets.sources.bbcImg),
      IsarSourceDto.create(name: 'Bloomberg', url: 'bloomberg.com', logo: AppAssets.sources.bloombergImg),
      IsarSourceDto.create(name: 'CNBC', url: 'cnbc.com', logo: AppAssets.sources.cnbcImg),
      IsarSourceDto.create(name: 'CNN', url: 'cnn.com', logo: AppAssets.sources.cnnImg),
      IsarSourceDto.create(name: 'Daily Mail', url: 'dailymail.co.uk', logo: AppAssets.sources.dailyMailImg, isEnabled: false),
      IsarSourceDto.create(name: 'Forbes', url: 'forbes.com', logo: AppAssets.sources.forbesImg),
      IsarSourceDto.create(name: 'FoxNews', url: 'foxnews.com', logo: AppAssets.sources.foxNewsImg),
      IsarSourceDto.create(name: 'MSN', url: 'msn.com', logo: AppAssets.sources.msnImg),
      IsarSourceDto.create(name: 'New York Post', url: 'nypost.com', logo: AppAssets.sources.newYorkPostImg),
      IsarSourceDto.create(name: 'News18', url: 'news18.com', logo: AppAssets.sources.news18Img),
      IsarSourceDto.create(name: 'The Guardian', url: 'theguardian.com', logo: AppAssets.sources.theGuardianImg),
      IsarSourceDto.create(name: 'The NewYork Times', url: 'nytimes.com', logo: AppAssets.sources.theNewYorkTimesImg),
      IsarSourceDto.create(name: 'The Sun', url: 'thesun.co.uk', logo: AppAssets.sources.theSunImg, isEnabled: false),
      IsarSourceDto.create(name: 'Usa Today', url: 'usatoday.com', logo: AppAssets.sources.usaTodayImg),
      IsarSourceDto.create(name: 'Washington Post', url: 'washingtonpost.com', logo: AppAssets.sources.washingtonPostImg),
      IsarSourceDto.create(name: 'Yahoo News', url: 'news.yahoo.com', logo: AppAssets.sources.yahooNewsImg),
    ];

    await _isar.writeTxn(() async {
      await _isarStore.putAll(initialSources);
    });
  }
}
