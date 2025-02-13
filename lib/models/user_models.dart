class User {
  final String fullName;
  final String login;
  final String avatarUrl;
  final String type;
  final String? description;

  User({
    required this.fullName,
    required this.login,
    required this.avatarUrl,
    required this.type,
    this.description,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['full_name'] ?? "Unknown",
      login: json['owner']['login'] ?? "Unknown",
      avatarUrl: json['owner']['avatar_url'] ?? "",
      type: json['owner']['type'] ?? "Unknown",
      description: json['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'full_name': fullName,
      'login': login,
      'avatar_url': avatarUrl,
      'type': type,
      'description': description,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      fullName: map['full_name'],
      login: map['login'],
      avatarUrl: map['avatar_url'],
      type: map['type'],
      description: map['description'],
    );
  }
}
