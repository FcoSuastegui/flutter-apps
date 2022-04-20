import 'package:flutter_apps/src/data/model/list_page.dart';
import 'package:flutter_apps/src/data/model/project.dart';

class ProjectUseCase {
  Future<ListPage<ProjectModel>> getProjects(int page) async {
    final List<ProjectModel> list = <ProjectModel>[];
    for (var item in jsonProjects) {
      list.add(ProjectModel.fromMap(item));
    }
    return ListPage<ProjectModel>(
      itemList: list,
      totalCount: list.length,
    );
  }
}

List<Map<String, dynamic>> jsonProjects = [
  {
    "title": "On Boarding",
    "description": "Flutter UI + On Boarding",
    "designer": "Mao Lop",
    "pathImage": 'assets/home/images/onboarding.png',
    "route": "/on-boarding",
  }
];
