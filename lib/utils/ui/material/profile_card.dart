import 'package:flutter/material.dart';
import 'package:pet_app/config/router/routes_enum.dart';

class ProfileCard extends StatelessWidget {
  final Routes route;
  final IconData iconData;
  final String title;
  const ProfileCard({
    super.key,
    required this.iconData,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title),
        onTap: () => AppNavigator.push(route),
      ),
    );
  }
}
