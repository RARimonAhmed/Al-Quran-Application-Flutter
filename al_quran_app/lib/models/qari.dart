class QariModel {
  String? name;
  String? path;
  String? format;
  QariModel({
    this.name,
    this.path,
    this.format,
  });
  factory QariModel.fromJSON(Map<String, dynamic> json) {
    return QariModel(
      name: json['name'],
      path: json['relative_path'],
      format: json['file_formats'],
    );
  }
}
