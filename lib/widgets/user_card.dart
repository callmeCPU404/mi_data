// widgets/user_card.dart
import 'package:flutter/material.dart';
import 'package:mi_data/models/user_models.dart';


class UserCard extends StatelessWidget {
  final User user;
  final VoidCallback? onDelete;

  UserCard({required this.user, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
        title: Text(user.fullName),
        subtitle: Text(user.description),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}