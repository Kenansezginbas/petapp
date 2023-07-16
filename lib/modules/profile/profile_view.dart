import 'package:flutter/material.dart';
import 'package:pet_app/config/router/routes_enum.dart';

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
        ProfileCard(
          iconData: Icons.email,
          title: "Email Degistir",
          route: Routes.updateEmail,
        ),
        ProfileCard(
          iconData: Icons.person,
          title: "Sifre Degistir",
          route: Routes.updatePassword,
        ),
        ProfileCard(
          iconData: Icons.credit_card,
          title: "Odeme Bilgisi Ekle",
          route: Routes.paymentConfirmed,
        ),
        ProfileCard(
          iconData: Icons.person_2_outlined,
          title: "Kullanicilar",
          route: Routes.users,
        ),
      ],
    );
  }
}


//material & cupertino