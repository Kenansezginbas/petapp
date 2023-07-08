import 'package:flutter/material.dart';
import 'package:pet_app/config/colors/color_manager.dart';
import 'package:pet_app/utils/ui/components/buttons/custom_icon_button.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "username",
            textAlign: TextAlign.left,
          ),
          Container(
            height: 300,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Placeholder(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                onPressed: () {},
                icondata: Icons.favorite,
              ),
              CustomIconButton(
                onPressed: () {},
                icondata: Icons.send,
              ),
            ],
          )
        ],
      ),
    );
  }
}
