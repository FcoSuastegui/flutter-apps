part of 'home_cubit.dart';

class HomeSate {
  HomeSate({
    this.isGridView = false,
  });
  final bool isGridView;

  HomeSate copyWith({
    bool? isGridView,
  }) =>
      HomeSate(
        isGridView: isGridView ?? this.isGridView,
      );
}
