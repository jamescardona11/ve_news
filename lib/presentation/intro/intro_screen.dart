import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ve_news/config/di/di.dart';
import 'package:ve_news/config/navigation/app_router.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';
import 'package:ve_news/cross/presentation/presentation.dart';
import 'package:ve_news/presentation/intro/cubit/intro_cubit.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({
    Key? key,
  }) : super(key: key);

  final _wasFinished = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = context.textTheme;

    return BlocProvider(
      create: (context) => getIt<IntroCubit>(),
      child: BlocConsumer<IntroCubit, IntroState>(
        listenWhen: (previous, current) => current is IntroGoHome,
        listener: (context, state) => goToHome(context),
        builder: (context, state) => Scaffold(
          body: Center(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: size.height / 2 - 30,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: _wasFinished,
                    builder: (_, value, __) => Text(
                      'Ve ${value ? 'News' : ''}',
                      style: textTheme.mainTitle,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height / 2,
                  child: DefaultTextStyle(
                    style: textTheme.displayLarge!.copyWith(fontSize: AppTextTheme.fontSize700),
                    child: AnimatedTextKit(
                      pause: const Duration(milliseconds: 50),
                      totalRepeatCount: 1,
                      repeatForever: false,
                      onFinished: () {
                        _wasFinished.value = true;
                      },
                      animatedTexts: [
                        RotateAnimatedText('CONNECTED'),
                        RotateAnimatedText('OPTIMISTIC'),
                        RotateAnimatedText('NOTIFIED'),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: size.height / 2 + 50,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: _wasFinished,
                    builder: (_, value, __) => AnimatedOpacity(
                      duration: const Duration(milliseconds: 700),
                      opacity: value ? 1 : 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: AppDimens.size20, bottom: AppDimens.size100),
                        child: CircularIconButton(
                          size: 65,
                          color: AppColors.black,
                          iconColor: AppColors.white,
                          icon: FontAwesomeIcons.arrowRight,
                          onPressed: () => goToHome(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goToHome(BuildContext context) {
    context.replace(AppRouter.home);
  }
}
