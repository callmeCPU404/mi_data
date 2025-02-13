// models/user_model.dart
class User {
  final String fullName;
  final String login;
  final String avatarUrl;
  final String type;
  final String description;

  User({
    required this.fullName,
    required this.login,
    required this.avatarUrl,
    required this.type,
    required this.description,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullname'],
      login: json['login'],
      avatarUrl: json['avatar_url'],
      type: json['type'],
      description: json['description'],
    );
  }
}