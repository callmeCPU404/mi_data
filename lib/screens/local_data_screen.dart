import 'package:flutter/material.dart';
import 'package:mi_data/provider/user_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/user_card.dart';

class LocalDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Saved Users (Offline)")),
      body: userProvider.localUsers.isEmpty
          ? Center(child: Text("No saved users found."))
          : ListView.builder(
              itemCount: userProvider.localUsers.length,
              itemBuilder: (context, index) {
                final user = userProvider.localUsers[index];
                return UserCard(
                  user: user,
                  onDelete: () {
                    userProvider.deleteLocalUser(user);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("User removed from local storage!")),
                    );
                  }, onSave: () {  },
                );
              },
            ),
    );
  }
}
