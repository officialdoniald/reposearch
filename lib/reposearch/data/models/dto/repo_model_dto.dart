class RepoModelDTO {
  final int id;
  final String name;
  final String fullName;
  final String description;
  final String htmlUrl;
  final String avatarUrl;
  final String createdAt;
  final String updatedAt;
  final int forksCount;

  RepoModelDTO({
    required this.id,
    required this.name,
    required this.fullName,
    required this.description,
    required this.htmlUrl,
    required this.avatarUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.forksCount,
  });

  factory RepoModelDTO.fromJson(Map<String, dynamic> json) {
    return RepoModelDTO(
      id: json['id'] as int,
      name: json['name'] ?? '',
      fullName: json['full_name'] ?? '',
      description: json['description'] ?? '',
      htmlUrl: json['html_url'] ?? '',
      avatarUrl: json['owner']?['avatar_url'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      forksCount: json['forks_count'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'full_name': fullName,
      'description': description,
      'html_url': htmlUrl,
      'avatar_url': avatarUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'forks_count': forksCount,
    };
  }

  factory RepoModelDTO.fromMap(Map<String, dynamic> m) {
    return RepoModelDTO(
      id: m['id'] as int,
      name: m['name'] ?? '',
      fullName: m['full_name'] ?? '',
      description: m['description'] ?? '',
      htmlUrl: m['html_url'] ?? '',
      avatarUrl: m['avatar_url'] ?? '',
      createdAt: m['created_at'] ?? '',
      updatedAt: m['updated_at'] ?? '',
      forksCount: m['forks_count'] ?? 0,
    );
  }
}
