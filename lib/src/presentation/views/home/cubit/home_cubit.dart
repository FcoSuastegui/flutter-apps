import 'package:bloc/bloc.dart';
import 'package:flutter_apps/src/data/model/project.dart';
import 'package:flutter_apps/src/data/usecase/project.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeSate> {
  HomeCubit({
    required PagingController<int, ProjectModel> pagingController,
    required ProjectUseCase projectUse,
  })  : _pagingController = pagingController,
        _projectUse = projectUse,
        super(HomeSate());

  final PagingController<int, ProjectModel> _pagingController;
  PagingController<int, ProjectModel> get pagingController => _pagingController;

  final ProjectUseCase _projectUse;

  static const _pageSize = 10;

  Future<void> init() async {
    _pagingController.addPageRequestListener(getProjects);
  }

  Future<void> getProjects(int pageKey) async {
    final list = await _projectUse.getProjects(pageKey);
    if (list.message.isNotEmpty) {
      _pagingController.error = list.message;
      return;
    }
    list.itemList.length <= _pageSize
        ? _pagingController.appendLastPage(list.itemList)
        : _pagingController.appendPage(list.itemList, pageKey + 1);
  }

  void setGridView() {
    emit(state.copyWith(isGridView: !state.isGridView));
  }

  void dispose() {
    _pagingController.dispose();
  }
}
