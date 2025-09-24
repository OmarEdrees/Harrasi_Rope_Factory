class CategoryModel {
  final String id;
  final String name;
  final String description;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryModel(
      {required this.name,
      required this.id,
      required this.description,
      required this.active,
      required this.createdAt,
      required this.updatedAt});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      active: json['active'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'active': active,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
