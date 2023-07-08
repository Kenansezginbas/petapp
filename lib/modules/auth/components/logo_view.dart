import 'package:flutter/material.dart';
import 'package:pet_app/constants/pats/image_pats.dart';
import 'package:pet_app/constants/sizes/images_sizes.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      height: ImageSizes.i100,
      width: ImageSizes.i100,
      fit: BoxFit.contain,
      image: AssetImage(ImagePats.logoURL),
    );
  }
}
