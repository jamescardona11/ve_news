import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/domain/summary/summary.dart';

part 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit()
      : super(
          const SummaryState(
            summaries: [
              SummaryArticles(
                id: 1,
              ),
            ],
          ),
        );
}
