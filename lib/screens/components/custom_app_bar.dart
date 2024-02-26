import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/asset_data.dart';
import '../../constants/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const MyAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SvgPicture.asset(
          AssetData.logoPath,
        ),
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: ColorApp.secondaryColor,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SvgPicture.asset(
            AssetData.settingsPath,
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
