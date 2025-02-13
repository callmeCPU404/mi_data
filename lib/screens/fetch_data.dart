// screens/fetch_data_screen.dart
import 'package:flutter/material.dart';
import 'package:mi_data/provider/user_provider.dart';
import 'package:mi_data/widgets/skeletonloader.dart';
import 'package:provider/provider.dart';

import '../widgets/user_card.dart';

class FetchDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: userProvider.isLoading
          ? SkeletonLoader()
          : ListView.builder(
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                final user = userProvider.users[index];
                return UserCard(user: user);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userProvider.fetchUsers();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}