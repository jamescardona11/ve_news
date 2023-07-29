import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/cross/domain/models/image_value_object.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/source/source_model.dart';
import 'package:ve_news/domain/summary/summary.dart';

part 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit()
      : super(
          SummaryState(
            summaries: [
              SummaryArticles(
                id: 1,
                articles: [
                  ArticleModel(
                    uuid: 'uuid',
                    title: 'title',
                    url: 'url',
                    body: 'body',
                    categories: [
                      Category(
                        label: 'label',
                        wgt: 1,
                        uri: 'uri',
                      ),
                      Category(
                        label: 'label2',
                        wgt: 1,
                        uri: 'uri',
                      ),
                      Category(
                        label: 'label3',
                        wgt: 1,
                        uri: 'uri',
                      ),
                    ],
                    source: SourceModel(name: 'name', url: 'url', logo: ImageValueObject.create(AppAssets.theGuardianImg)),
                  ),
                  ArticleModel(
                    uuid: 'uuid2',
                    title: 'title2',
                    url: 'url2',
                    body: 'body2',
                    source: SourceModel(name: 'name', url: 'url', logo: ImageValueObject.create(AppAssets.theGuardianImg)),
                  ),
                  ArticleModel(
                    uuid: 'uuid2',
                    title: 'title2',
                    url: 'url2',
                    body: 'body2',
                    source: SourceModel(name: 'name', url: 'url', logo: ImageValueObject.create(AppAssets.bloombergImg)),
                  ),
                ],
              ),
            ],
          ),
        );
}
