part of 'on_boarding_cubit.dart';

class OnBoardingState {
  OnBoardingState({
    this.currentePage = 0,
    this.skip = false,
  });

  final int currentePage;
  final bool skip;

  OnBoardingState copyWith({
    int? currentePage,
    bool? skip,
  }) =>
      OnBoardingState(
        currentePage: currentePage ?? this.currentePage,
        skip: skip ?? this.skip,
      );
}
