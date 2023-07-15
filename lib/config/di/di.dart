import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ve_news/config/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() => getIt.init();
