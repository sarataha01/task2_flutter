import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/asset_data.dart';
import '../../constants/colors.dart';

class MyAddButton extends StatelessWidget {
  const MyAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Your Tasks",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorApp.primaryColor,
          ),
        ),
        SizedBox(
          width: 150,
          height: 30,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/createTask');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorApp.button,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetData.taskPlusPath),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  "Add",
                  style: TextStyle(
                    color: ColorApp.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
