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
      appBar: AppBar(title: Text("Fetch Data")),
      body: userProvider.isLoading
          ? SkeletonLoader()
          : userProvider.users.isEmpty
              ? Center(child: Text("No data found. Tap refresh to fetch users."))
              : ListView.builder(
                  itemCount: userProvider.users.length,
                  itemBuilder: (context, index) {
                    final user = userProvider.users[index];
                    return UserCard(
                      user: user,
                      onSave: () {
                        userProvider.saveLocalUser(user);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("User saved locally!")),
                        );
                      },
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Fetching users...");
          userProvider.fetchUsers();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
