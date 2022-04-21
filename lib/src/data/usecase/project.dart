import 'package:flutter_apps/src/data/model/list_page.dart';
import 'package:flutter_apps/src/data/model/project.dart';

class ProjectUseCase {
  Future<ListPage<ProjectModel>> getProjects(int page) async {
    List<Map<String, dynamic>> jsonProjects = [
      {
        "title": "On Boarding",
        "description": "Flutter UI + On Boarding",
        "designer": "Free",
        "pathImage": 'assets/home/images/onboarding.png',
        "route": "/on-boarding",
      },
      {
        "title": "Travel App",
        "description": "Flutter UI + Travel App",
        "designer": "Damoty Pixel",
        "pathImage": 'assets/home/images/travel-app.png',
        "route": "/travel-app",
      },
      {
        "title": "E-commerce Application",
        "description": "Flutter UI + E-commerce.",
        "designer": "Afgprogrammer",
        "pathImage": 'assets/home/images/ecommerce.png',
        "route": "/ecommerce-app",
      },
    ];

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
