class Course {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Course({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
