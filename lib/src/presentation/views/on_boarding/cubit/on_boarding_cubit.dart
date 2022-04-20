import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit({
    required pageController,
  })  : _pageController = pageController,
        super(OnBoardingState());

  final PageController _pageController;
  PageController get pageViewController => _pageController;

  void nextPage(int page) {
    emit(state.copyWith(currentePage: page, skip: false));
  }

  void nextPageButton() {
    bool skip = _pageController.page! > 1;
    emit(state.copyWith(skip: skip));
    if (!skip) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void skipPage() {
    emit(state.copyWith(skip: true));
    _pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
