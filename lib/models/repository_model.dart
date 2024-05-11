class RepositoryModel {
  final int id;
  final String name;
  final bool isFavorite;

  const RepositoryModel(
      {required this.name, required this.id, this.isFavorite = false});

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      RepositoryModel(name: json['name'], id: json['id']);

  Map toJson() => {
    'name': name,
    'id': id,
  };

  RepositoryModel copyWith({
    int? id,
    String? name,
    bool? isFavorite,
  }) {
    return RepositoryModel(
        name: name ?? this.name,
        id: id ?? this.id,
        isFavorite: isFavorite ?? this.isFavorite);
  }
}
