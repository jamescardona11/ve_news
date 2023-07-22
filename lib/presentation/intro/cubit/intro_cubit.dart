import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/domain/app_setup/use_case/app_setup_use_case.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  final AppSetupUseCase _appSetupUseCase;

  IntroCubit(this._appSetupUseCase) : super(IntroInitial()) {
    _init();
  }

  Future<void> _init() async {
    emit(IntroLoading());

    final isFirstTime = await _appSetupUseCase.call();

    if (!isFirstTime) {
      emit(IntroGoHome());
    }
  }
}
