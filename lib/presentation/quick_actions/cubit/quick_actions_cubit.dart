import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quick_actions_state.dart';

class QuickActionsCubit extends Cubit<QuickActionsState> {
  QuickActionsCubit() : super(QuickActionsInitial());

  Future<void> onTemp10MinutesNews() async {}

  Future<void> onTemp5TheGuardianNews() async {}

  Future<void> onTemp5SportsNews() async {}
}
