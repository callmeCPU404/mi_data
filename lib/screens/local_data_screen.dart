// screens/local_data_screen.dart
import 'package:flutter/material.dart';
import 'package:mi_data/provider/user_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/user_card.dart';

class LocalDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: userProvider.localUsers.length,
        itemBuilder: (context, index) {
          final user = userProvider.localUsers[index];
          return UserCard(
            user: user,
            onDelete: () {
              userProvider.deleteLocalUser(user);
            },
          );
        },
      ),
    );
  }
}