import 'package:injectable/injectable.dart';
import 'package:ve_news/presentation/intro/cubit/intro_cubit.dart';

@module
abstract class PresentationModule {
  IntroCubit get introCubit;
}
