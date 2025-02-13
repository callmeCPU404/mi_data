// widgets/skeleton_loader.dart
import 'package:flutter/material.dart';

class SkeletonLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
            ),
            title: Container(
              height: 10,
              width: 100,
              color: Colors.grey[300],
            ),
            subtitle: Container(
              height: 10,
              width: 200,
              color: Colors.grey[300],
            ),
          ),
        );
      },
    );
  }
}