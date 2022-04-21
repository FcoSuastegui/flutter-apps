import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit({
    required PageController pageController,
  })  : _pageController = pageController,
        super(NavbarState());

  final PageController _pageController;
  PageController get pageController => _pageController;

  void onItemTapped(int index) {
    emit(state.copyWith(selectedPage: index));
    _pageController.jumpToPage(index);
  }
}
