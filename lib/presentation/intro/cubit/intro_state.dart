part of 'intro_cubit.dart';

abstract class IntroState {
  const IntroState();
}

class IntroInitial extends IntroState {}

class IntroLoading extends IntroState {}

class IntroGoHome extends IntroState {}
