class ProjectModel {
  ProjectModel({
    required this.title,
    required this.description,
    required this.designer,
    required this.pathImage,
    required this.route,
  });

  String title;
  String description;
  String designer;
  String pathImage;
  String route;

  factory ProjectModel.fromMap(Map<String, dynamic> json) => ProjectModel(
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        designer: json["designer"] ?? "",
        pathImage: json["pathImage"] ?? "",
        route: json["route"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "designer": designer,
        "pathImage": pathImage,
        "route": route,
      };
}
