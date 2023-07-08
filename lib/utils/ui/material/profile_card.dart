import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  const ProfileCard({
    super.key,
    required this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title),
        onTap: () {},
      ),
    );
  }
}
