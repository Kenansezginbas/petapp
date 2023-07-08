import 'package:flutter/material.dart';

import '../../utils/ui/material/profile_card.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ProfileCard(iconData: Icons.email, title: "Email Degistir"),
        ProfileCard(iconData: Icons.person, title: "Sifre Degistir"),
        ProfileCard(iconData: Icons.credit_card, title: "Odeme Bilgisi Ekle"),
      ],
    );
  }
}


//material & cupertino