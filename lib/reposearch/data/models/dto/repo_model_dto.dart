class RepoModelDTO {
  final int id;
  final String name;
  final String fullName;
  final String description;
  final String htmlUrl;

  RepoModelDTO({
    required this.id,
    required this.name,
    required this.fullName,
    required this.description,
    required this.htmlUrl,
  });

  factory RepoModelDTO.fromJson(Map<String, dynamic> json) {
    return RepoModelDTO(
      id: json['id'] as int,
      name: json['name'] ?? '',
      fullName: json['full_name'] ?? '',
      description: json['description'] ?? '',
      htmlUrl: json['html_url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'full_name': fullName,
      'description': description,
      'html_url': htmlUrl,
    };
  }

  factory RepoModelDTO.fromMap(Map<String, dynamic> m) {
    return RepoModelDTO(
      id: m['id'] as int,
      name: m['name'] ?? '',
      fullName: m['full_name'] ?? '',
      description: m['description'] ?? '',
      htmlUrl: m['html_url'] ?? '',
    );
  }
}
