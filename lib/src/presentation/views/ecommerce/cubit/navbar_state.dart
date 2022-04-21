part of 'navbar_cubit.dart';

class NavbarState {
  NavbarState({
    this.selectedPage = 0,
  });

  final int selectedPage;

  NavbarState copyWith({
    int? selectedPage,
  }) =>
      NavbarState(
        selectedPage: selectedPage ?? this.selectedPage,
      );
}
